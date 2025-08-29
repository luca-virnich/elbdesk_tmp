#!/bin/bash

display_help() {
    COMMAND=$(basename "$0")

    echo -e "\n'$COMMAND' builds elbdesk_app for web platform.\n"
    echo -e "Usage: ./$COMMAND [OPTION]...\n"
    echo -e "Specify environment variables as VARIABLE=VALUE to override default build options.\n"

    echo "Options:"
    echo -e "  -h, --help\t\t\tdisplay this help and exit"
    echo -e "  -d, --debug\t\t\tbuild the debug version of the application"
    echo -e "  -p, --profile\t\t\tbuild the profile version of the application"
    echo -e "  -r, --release\t\t\tbuild the release version of the application\n"

    echo -e "  --version=VERSION\t\tspecify the version number (required)"
    echo -e "  --api-host=HOST\t\tspecify the API host URL (required)\n"

    echo "Run modes:"
    echo -e "  --development\t\t\tbuild for dev environment"
    echo -e "  --test\t\t\tbuild for test environment"
    echo -e "  --staging\t\t\tbuild for staging environment"
    echo -e "  --production\t\t\tbuild for production environment (default)\n"

    echo "Build modes:"
    echo -e "  --debug\t\t\tbuild the debug version of the application"
    echo -e "  --profile\t\t\tbuild the profile version of the application"
    echo -e "  --release\t\t\tbuild the release version of the application (default)\n"

    echo "Architectures:"
    echo -e "  --disable-x86-64\t\tdo not build x86-64 architecture [yes]\n"
}

# setup_web_icons() {
# TODO(kz): Handle this properly
# local run_mode="$RUN_MODE"
# local icon_path

# # Determine icon path based on run mode
# case "$run_mode" in
# "production")
#     icon_path="app_icon_production.ico"
#     ;;
# "staging")
#     icon_path="app_icon_staging.ico"
#     ;;
# "test")
#     icon_path="app_icon_test.ico"
#     ;;
# "development" | *)
#     icon_path="app_icon_development.ico"
#     ;;
# esac

# # Update the Runner.rc file
# local rc_file="./windows/runner/Runner.rc"
# if [[ -f "$rc_file" ]]; then
#     # Use sed to replace the icon path
#     sed -i.bak "s|IDI_APP_ICON[[:space:]]*ICON[[:space:]]*\"[^\"]*\"|IDI_APP_ICON            ICON                    \"resources\\\\$icon_path\"|" "$rc_file"
#     rm -f "${rc_file}.bak" # Remove backup file created by sed
# else
#     echo "Error: Runner.rc file not found at $rc_file" >&2
#     exit 1
# fi
# }

build_web() {
    echo $SEMVER_VERSION
    # Detect OS and use appropriate sed command
    if [[ "$OSTYPE" == "darwin"* ]]; then
        # macOS/BSD
        sed -i '' "s|flutter_bootstrap.js?version=[0-9]*|flutter_bootstrap.js?version=${SEMVER_VERSION}|g" "${BASEDIR}/web/index.html"
    else
        # Linux
        sed -i "s|flutter_bootstrap.js?version=[0-9]*|flutter_bootstrap.js?version=${SEMVER_VERSION}|g" "${BASEDIR}/web/index.html"
    fi

    flutter build web --dart-define=RUN_MODE=${RUN_MODE} --dart-define=APP_VERSION=${SEMVER_VERSION} --dart-define=API_HOST=${API_HOST} --${BUILD_MODE}
}
