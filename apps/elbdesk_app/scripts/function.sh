#!/bin/bash

setup_versions() {
    local run_mode="$RUN_MODE"
    # local build_mode="$BUILD_MODE"
    local app_version="$APP_VERSION"

    echo "Function inputs:"
    echo "  app_version: $app_version"
    echo "  run_mode: $run_mode"

    # Match semver pattern (ignoring any existing pre-release)
    # Pattern ensures no leading zeros in numbers
    if [[ "$app_version" =~ ^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(\+(0|[1-9][0-9]*))?$ ]]; then
        echo "Debug: Regex matched successfully"
        local major="${BASH_REMATCH[1]}"
        local minor="${BASH_REMATCH[2]}"
        local patch="${BASH_REMATCH[3]}"
        local buildmeta="${BASH_REMATCH[4]:1}" # Remove the + from the beginning

        # Windows version needs a fourth number and can't have pre-release/build info
        local windows_version="${major}.${minor}.${patch}.0"

        # Construct full semver with runMode as pre-release (except for production)
        local semver="${major}.${minor}.${patch}"
        if [[ "$run_mode" != "production" ]]; then
            semver+="-${run_mode}"
        fi
        # if [[ "$run_mode" != "production" && "$build_mode" != "release" ]]; then
        #     semver+=".${build_mode}"
        # fi
        if [[ -n "$buildmeta" ]]; then
            semver+="+${buildmeta}"
        fi

        # Tag name for GitHub release
        local tag_name="v${semver}"

        # Export variables for local use
        export SEMVER_VERSION="$semver"
        export WINDOWS_VERSION="$windows_version"
        export TAG_NAME="$tag_name"
        export MAJOR="$major"
        export MINOR="$minor"
        export PATCH="$patch"
        export BUILD_META="$buildmeta"

        # If running in GitHub Actions, set outputs
        if [[ -n "$GITHUB_ACTIONS" ]]; then
            echo "semver=$semver" >>$GITHUB_OUTPUT
            echo "windows_version=$windows_version" >>$GITHUB_OUTPUT
            echo "tag_name=$tag_name" >>$GITHUB_OUTPUT
            echo "major=$major" >>$GITHUB_OUTPUT
            echo "minor=$minor" >>$GITHUB_OUTPUT
            echo "patch=$patch" >>$GITHUB_OUTPUT
            echo "buildmeta=$buildmeta" >>$GITHUB_OUTPUT
        fi

        echo "OUTPUTS:"
        echo "  semver: $semver"
        echo "  windows_version: $windows_version"
        echo "  tag_name: $tag_name"
        echo "  major: $major"
        echo "  minor: $minor"
        echo "  patch: $patch"
        echo "  buildmeta: $buildmeta"
    else
        echo "Debug: Regex did not match"
        echo "Debug: Pattern is: ^(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)\.(0|[1-9][0-9]*)(\+(0|[1-9][0-9]*))?$"
        echo "Error: Invalid version format. Please use X.Y.Z[+build] format (e.g., 1.2.3 or 1.2.3+build.123)" >&2
        echo "Note: Version numbers cannot have leading zeros (e.g., use 1.12.13+1 instead of 01.012.013+01)" >&2
        exit 1
    fi
}
