function Display-Help {
    #  $COMMAND = $MyInvocation.MyCommand.Name
    $COMMAND = Split-Path -Leaf $MyInvocation.ScriptName

    Write-Host "`n'$COMMAND' builds elbdesk_coe for Windows platform. By default only one Windows architecture (x86-64) is built without any external libraries enabled. Options can be used to enable external libraries. Please note that GPL libraries (external libraries with GPL license) need --enable-gpl flag to be set explicitly. When compilation ends, libraries are created under the prebuilt folder.`n"
    Write-Host "Usage: .\$COMMAND [OPTION]...`n"
    Write-Host "Specify environment variables as VARIABLE=VALUE to override default build options.`n"

    Write-Host "Options:"
    Write-Host "  -h, --help`t`t`tdisplay this help and exit"
    Write-Host "  -d, --debug`t`t`tbuild the debug version of the application"
    Write-Host "  -r, --release`t`t`tbuild the release version of the application`n"

    Write-Host "Run modes:"
    Write-Host "  --development`t`t`tbuild for dev environment (default)"
    Write-Host "  --test`t`t`tbuild for test environment"
    Write-Host "  --staging`t`t`tbuild for staging environment"
    Write-Host "  --production`t`t`tbuild for production environment`n"

    Write-Host "Certificate:"
    Write-Host "  --certificate-path`t`tset the path to the certificate"
    Write-Host "  `t`t`t`t(default: ./windows/certificates/AppAhoiGmbH.pfx)`n"
    Write-Host "  --certificate-password`tset the password for the certificate"
    Write-Host "  --certificate-string`t`tif provided, certificate will be created from base64 string`n"

    Write-Host "Architectures:"
    Write-Host "  --disable-x86-64`t`tdo not build x86-64 architecture [yes]`n"

}

function Create-PFX-Certificate {
    $pfxPath = "./windows/certificates/AppAhoiGmbH.pfx"
    $bytes = [Convert]::FromBase64String('${{ secrets.PFX_BASE64 }}')
    [IO.File]::WriteAllBytes($pfxPath, $bytes)
    echo "PFX certificate created at: $pfxPath"
}

function Remove-Existing-MSIX-Config {
    $content = Get-Content -Path "pubspec.yaml" -Raw
    $content = $content -replace '(?ms)msix_config:.*?(?=\n\S|\Z)', ''
    # Remove trailing empty lines
    $content = $content.TrimEnd("`r`n")
    Set-Content -Path "pubspec.yaml" -Value $content
}

function Setup-Windows-Version {
    $runMode = "$RUN_MODE"
    $semver = "$APP_VERSION"

    Write-Host "Semver: $semver"

    # Match semver pattern (ignoring any existing pre-release)
    if ($semver -match '^(\d+)\.(\d+)\.(\d+)(?:-[^+]*)?(?:\+([0-9A-Za-z-]+(?:\.[0-9A-Za-z-]+)*))?$') {
        $major = $matches[1]
        $minor = $matches[2]
        $patch = $matches[3]
        $buildmeta = $matches[4]
        
        # Windows version needs a fourth number and can't have pre-release/build info
        $windowsVersion = "${major}.${minor}.${patch}.0"
        
        # Construct full semver with runMode as pre-release (except for production)
        $fullSemver = "${major}.${minor}.${patch}"
        if ($runMode -ne "production") {
          $fullSemver += "-${runMode}"
        }
        if ($buildmeta) {
          $fullSemver += "+${buildmeta}"
        }
        
        # Tag name for GitHub release
        $tagName = "v${fullSemver}"

        # echo "semver=$fullSemver" >> $env:GITHUB_OUTPUT
        # echo "windows_version=$windowsVersion" >> $env:GITHUB_OUTPUT
        # echo "tag_name=$tagName" >> $env:GITHUB_OUTPUT
        # echo "major=$([int]$major)" >> $env:GITHUB_OUTPUT
        # echo "minor=$([int]$minor)" >> $env:GITHUB_OUTPUT
        # echo "patch=$([int]$patch)" >> $env:GITHUB_OUTPUT
        # echo "buildmeta=$buildmeta" >> $env:GITHUB_OUTPUT

        $env:SEMVER_VERSION = $fullSemver
        $env:WINDOWS_VERSION = $windowsVersion
        $env:TAG_NAME = $tagName
        $env:MAJOR = $major
        $env:MINOR = $minor
        $env:PATCH = $patch
        $env:BUILD_META = $buildmeta
        
        # Write-Host "Input version: ${{ inputs.version }}"
        Write-Host "Full semver: $fullSemver"
        Write-Host "Windows version: $windowsVersion"
        Write-Host "Tag name: $tagName"
        Write-Host "Major: $major"
        Write-Host "Minor: $minor"
        Write-Host "Patch: $patch"
        Write-Host "Buildmeta: $buildmeta"
    } else {
        Write-Error "Invalid version format. Please use X.Y.Z[+build] format (e.g., 1.2.3 or 1.2.3+build.123)"
        exit 1
    }
}


function Setup-MSIX-Config {
    $publisherDisplayName = "App Ahoi GmbH"
    $installCertificate = "false"


    $runMode = "$env:RUN_MODE"
    $msixVersion = "$env:WINDOWS_VERSION"
    $appVersion = "$env:SEMVER_VERSION"

    $identifier = switch ($runMode) {
                "production"  { "elbdesk-coe" }
                "staging"     { "elbdesk-staging-coe" }
                "test"        { "elbdesk-test-coe" }
                "development" { "elbdesk-development-coe" }
                default      { "elbdesk-development-coe" }
            }

    $domain = switch ($runMode) {
            "production"  { "coe.elbdesk.link" }
            "staging"     { "staging.coe.elbdesk.link" }
            "test"        { "test.coe.elbdesk.link" }
            "development" { "development.coe.elbdesk.link" }
            default       { "development.coe.elbdesk.link" }
        }

    $displayName = switch ($runMode) {
            "production"  { "ElbDesk - Carl Ostermann Erben" }
            "staging"     { "ElbDesk - Carl Ostermann Erben (STAGING)" }
            "test"        { "ElbDesk - Carl Ostermann Erben (TEST)" }
            "development" { "ElbDesk - Carl Ostermann Erben (DEV)" }
            default       { "ElbDesk - Carl Ostermann Erben (DEV)" }
        }
    
    $identityName = switch ($runMode) {
            "production"  { "com.elbdesk.coe" }
            "staging"     { "com.elbdesk.coe.staging" }
            "test"        { "com.elbdesk.coe.test" }
            "development" { "com.elbdesk.coe.development" }
            default       { "com.elbdesk.coe.development" }
        }

    $logoPath = switch ($runMode) {
            "production"  { "./windows/runner/resources/app_icon_production_512.png" }
            "staging"     { "./windows/runner/resources/app_icon_staging_512.png" }
            "test"        { "./windows/runner/resources/app_icon_test_512.png" }
            "development" { "./windows/runner/resources/app_icon_development_512.png" }
            default       { "./windows/runner/resources/app_icon_development_512.png" }
        }
          
    $content = Get-Content -Path "pubspec.yaml" -Raw
    $content += "`nmsix_config:"
    $content += "`n  display_name: $displayName"
    $content += "`n  publisher_display_name: $publisherDisplayName"
    $content += "`n  identity_name: $identityName"
    $content += "`n  certificate_path: $env:CERTIFICATE_PATH"
    $content += "`n  certificate_password: $env:CERTIFICATE_PASSWORD"
    $content += "`n  install_certificate: $installCertificate"
    $content += "`n  protocol_activation: https, $identifier"
    $content += "`n  app_uri_handler_hosts: www.$domain, $domain"
    $content += "`n  logo_path: $logoPath"
    $content += "`n  msix_version: $msixVersion"
    $content += "`n  signtool_options: /td SHA256"
    $content += "`n  output_name: ElbDesk_Setup_$appVersion"
    $content += "`n  windows_build_args: --dart-define=APP_VERSION=$appVersion --dart-define=RUN_MODE=$runMode"
    Set-Content -Path "pubspec.yaml" -Value $content
}

function Setup-CMakeLists {
    $runMode = "$RUN_MODE"
    $content = Get-Content -Path "./windows/CMakeLists.txt" -Raw
    $content = $content -replace 'set\(BINARY_NAME "elbdesk_app[^"]*"\)', "set(BINARY_NAME `"elbdesk_app_$runMode`")"
    Set-Content -Path "./windows/CMakeLists.txt" -Value $content
}

function Setup-Deeplinking-Instance {
    $runMode = "$RUN_MODE"
    $windowTitle = switch ($runMode) {
                "production"  { "ElbDesk - Carl Ostermann Erben" }
                "staging"     { "ElbDesk - Carl Ostermann Erben (STAGING)" }
                "test"        { "ElbDesk - Carl Ostermann Erben (TEST)" }
                "development" { "ElbDesk - Carl Ostermann Erben (DEV)" }
                default       { "ElbDesk - Carl Ostermann Erben (DEV)" }
            }
    $content = Get-Content -Path "./windows/runner/main.cpp" -Raw
    $content = $content -replace 'if \(SendAppLinkToInstance\(L"ElbDesk - Carl Ostermann Erben[^"]*"\)', "if (SendAppLinkToInstance(L`"$windowTitle`")"
    Set-Content -Path "./windows/runner/main.cpp" -Value $content
}

function Setup-Windows-Icon {
    $runMode = "$RUN_MODE"
    $iconPath = switch ($runMode) {
        "production"  { "app_icon_production.ico" }
        "staging"     { "app_icon_staging.ico" }
        "test"        { "app_icon_test.ico" }
        "development" { "app_icon_development.ico" }
        default       { "app_icon_development.ico" }
    }
    
    $content = Get-Content -Path "./windows/runner/Runner.rc" -Raw
    $content = $content -replace 'IDI_APP_ICON\s+ICON\s+"[^"]*"', "IDI_APP_ICON            ICON                    `"resources\\$iconPath`""
    Set-Content -Path "./windows/runner/Runner.rc" -Value $content
}



function Msix-Create {
    flutter clean
    flutter pub get
    # Run msix:create command
    dart run msix:create -v --release 
}