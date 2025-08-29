# CHECK IF XCODE IS INSTALLED
# if (-not (Get-Command xcrun -ErrorAction SilentlyContinue)) {
#     Write-Host "`n(*) xcrun command not found. Please check your Xcode installation`n"
#     exit 1
# }

# if (-not (Get-Command xcodebuild -ErrorAction SilentlyContinue)) {
#     Write-Host "`n(*) xcodebuild command not found. Please check your Xcode installation`n"
#     exit 1
# }

# CHECK IF FLUTTER IS INSTALLED
if (-not (Get-Command flutter -ErrorAction SilentlyContinue)) {
    Write-Host "`n(*) flutter command not found. Please install Flutter SDK`n" 
    exit 1
}

# CHECK IF DART IS INSTALLED
if (-not (Get-Command dart -ErrorAction SilentlyContinue)) {
    Write-Host "`n(*) dart command not found. Please install Dart SDK`n"
    exit 1
}

# CHECK IF VISUAL STUDIO IS INSTALLED
$vsWhere = "${env:ProgramFiles(x86)}\Microsoft Visual Studio\Installer\vswhere.exe"
if (-not (Test-Path $vsWhere)) {
    Write-Host "`n(*) Visual Studio not found. Please install Visual Studio with 'Desktop development with C++' workload`n"
    exit 1
}

$vsPath = & $vsWhere -latest -products * -requires Microsoft.VisualStudio.Component.VC.Tools.x86.x64 -property installationPath
if (-not $vsPath) {
    Write-Host "`n(*) Visual Studio C++ workload not found. Please install 'Desktop development with C++' workload`n"
    exit 1
}


# LOAD INITIAL SETTINGS
$BASEDIR = Get-Location
$env:ELBDESK_APP_BUILD_TYPE = "windows"
. "$BASEDIR/scripts/variable.ps1"
. "$BASEDIR/scripts/function-$($env:ELBDESK_APP_BUILD_TYPE).ps1"
$disabled_libraries = @()

# SET DEFAULT BUILD OPTIONS
$env:GPL_ENABLED = "no"
$DISPLAY_HELP = ""
$BUILD_TYPE_ID = ""
$BUILD_FULL = ""
$FFMPEG_KIT_XCF_BUILD = ""
$BUILD_FORCE = ""
$RUN_MODE = $null
$CERTIFICATE_PATH = "./windows/certificates/AppAhoiGmbH.pfx"
$CERTIFICATE_PASSWORD = $null
$CERTIFICATE_STRING = $null
$APP_VERSION = $null
$BUILD_VERSION = git describe --tags --always 2>> "$BASEDIR/build.log"
if (-not $BUILD_VERSION) {
    Write-Host "`n(*): Can not run git commands in this folder. See build.log.`n"
    exit 1
}


# PROCESS LTS BUILD OPTION FIRST AND SET BUILD TYPE: MAIN OR LTS
foreach ($argument in $args) {
    if ($argument -eq "-l" -or $argument -eq "--lts") {
        Enable-LTSBuild
        $BUILD_TYPE_ID += "LTS "
    }
}

# PROCESS BUILD OPTIONS
$i = 0
while ($i -lt $args.Count) {
    $arg = $args[$i]
    switch ($arg) {
        { $_ -eq "-h" -or $_ -eq "--help" } {
            $DISPLAY_HELP = "1"
        }
        # { $_ -eq "-v" -or $_ -eq "--version" } {
        #     Display-Version
        #     exit 0
        # }
        "--development" {
            if ($RUN_MODE) {
                Write-Host "`n(*) Error: Only one run mode can be specified.`n"
                exit 1
            }
            $RUN_MODE = "development"
        }
        "--test" {
            if ($RUN_MODE) {
                Write-Host "`n(*) Error: Only one run mode can be specified.`n"
                exit 1
            }
            $RUN_MODE = "test"
        }
        "--staging" {
            if ($RUN_MODE) {
                Write-Host "`n(*) Error: Only one run mode can be specified.`n"
                exit 1
            }
            $RUN_MODE = "staging"
        }
        "--production" {
            if ($RUN_MODE) {
                Write-Host "`n(*) Error: Only one run mode can be specified.`n"
                exit 1
            }
            $RUN_MODE = "production"
        }
        { $_ -match "^--version=" } {
            $APP_VERSION = $arg -replace "^--[A-Za-z]*="
        }
        { $_ -match "^--certificate-path=" } {
            $CERTIFICATE_PATH = $arg -replace "^--[A-Za-z]*-[A-Za-z]*="
        }
        { $_ -match "^--certificate-password=" } {
            $CERTIFICATE_PASSWORD = $arg -replace "^--[A-Za-z]*-[A-Za-z]*="
        }
        { $_ -match "^--certificate-string=" } {
            $CERTIFICATE_STRING = $arg -replace "^--[A-Za-z]*-[A-Za-z]*="
        }
        default {
            Print-UnknownOption $arg
        }
    }
    $i++
}

# IF HELP DISPLAYED EXIT
if ($DISPLAY_HELP) {
    Display-Help
    exit 0
}

# SET DEFAULT RUN MODE IF NONE SPECIFIED
if (-not $RUN_MODE) {
    $RUN_MODE = "development"
}

# SET ENVIRONMENT VARIABLE FOR BUILD PROCESS
$env:RUN_MODE = $RUN_MODE

if (-not $APP_VERSION) {
    Write-Host "`n(*) Error: --version is required.`n"
    exit 1
}

$env:APP_VERSION = $APP_VERSION



# VALIDATE CERTIFICATE OPTIONS
if ($CERTIFICATE_STRING -and $CERTIFICATE_PATH -ne "./windows/certificates/AppAhoiGmbH.pfx") {
    Write-Host "`n(*) Error: Cannot specify both --certificate-string and --certificate-path.`n"
    exit 1
}

if ($CERTIFICATE_STRING -and -not $CERTIFICATE_PASSWORD) {
    Write-Host "`n(*) Error: --certificate-password is required when using --certificate-string.`n"
    exit 1
}

$env:CERTIFICATE_PATH = $CERTIFICATE_PATH
$env:CERTIFICATE_PASSWORD = $CERTIFICATE_PASSWORD

if ($CERTIFICATE_STRING) {
    $env:CERTIFICATE_STRING = $CERTIFICATE_STRING
}

# Validate certificate path
if (-not (Test-Path $CERTIFICATE_PATH)) {
    Write-Host "`n(*) Error: Certificate path $CERTIFICATE_PATH does not exist.`n"
    exit 1
}

# Setup Windows version
Setup-Windows-Version

# Setup CMakeLists.txt
Setup-CMakeLists

# Setup deeplinking instance
Setup-Deeplinking-Instance

# Setup Windows icon
Setup-Windows-Icon

# Remove existing MSIX config
Remove-Existing-MSIX-Config

# Setup MSIX config
Setup-MSIX-Config

# Create MSIX package
Msix-Create

# PROCESS FULL OPTION AS LAST OPTION
# if ($BUILD_FULL) {
#     for ($library = 0; $library -le 61; $library++) {
#         if ($env:GPL_ENABLED -eq "yes") {
#             Enable-Library (Get-LibraryName $library) 1
#         } else {
#             if ((Is-GPLLicensed $library) -eq 1) {
#                 Enable-Library (Get-LibraryName $library) 1
#             }
#         }
#     }
# }

# # DISABLE SPECIFIED LIBRARIES
# foreach ($disabled_library in $disabled_libraries) {
#     Set-Library $disabled_library 0
# }


