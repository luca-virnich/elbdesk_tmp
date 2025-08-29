#!/bin/bash

# CHECK IF FLUTTER IS INSTALLED
if [ ! -x "$(command -v flutter)" ]; then
  echo -e "\n(*) flutter command not found. Please install Flutter SDK\n"
  exit 1
fi

# CHECK IF DART IS INSTALLED
if [ ! -x "$(command -v dart)" ]; then
  echo -e "\n(*) dart command not found. Please install Dart SDK\n"
  exit 1
fi

# LOAD INITIAL SETTINGS
export BASEDIR="$(pwd)"
export ELDESK_APP_BUILD_TYPE="web"
source "${BASEDIR}"/scripts/variable.sh
source "${BASEDIR}"/scripts/function.sh
source "${BASEDIR}"/scripts/function-${ELDESK_APP_BUILD_TYPE}.sh
disabled_libraries=()

# SET DEFAULT BUILD OPTIONS
DISPLAY_HELP=""
RUN_MODE=""
BUILD_MODE=""
APP_VERSION=""
API_HOST=""
BUILD_VERSION=$(git describe --tags --always 2>>"${BASEDIR}"/build.log)
if [[ -z ${BUILD_VERSION} ]]; then
  echo -e "\n(*): Can not run git commands in this folder. See build.log.\n"
  exit 1
fi

# # MAIN BUILDS ENABLED BY DEFAULT
# enable_main_build

# PROCESS LTS BUILD OPTION FIRST AND SET BUILD TYPE: MAIN OR LTS
for argument in "$@"; do
  if [[ "$argument" == "-l" ]] || [[ "$argument" == "--lts" ]]; then
    enable_lts_build
    BUILD_TYPE_ID+="LTS "
  fi
done

# PROCESS BUILD OPTIONS
while [ ! $# -eq 0 ]; do
  case $1 in
  -h | --help)
    DISPLAY_HELP="1"
    ;;
  -v | --version)
    display_version
    exit 0
    ;;
  --development)
    if [ -n "$RUN_MODE" ]; then
      echo -e "\n(*) Error: Only one run mode can be specified.\n"
      exit 1
    fi
    RUN_MODE="development"
    ;;
  --test)
    if [ -n "$RUN_MODE" ]; then
      echo -e "\n(*) Error: Only one run mode can be specified.\n"
      exit 1
    fi
    RUN_MODE="test"
    ;;
  --staging)
    if [ -n "$RUN_MODE" ]; then
      echo -e "\n(*) Error: Only one run mode can be specified.\n"
      exit 1
    fi
    RUN_MODE="staging"
    ;;
  --production)
    if [ -n "$RUN_MODE" ]; then
      echo -e "\n(*) Error: Only one run mode can be specified.\n"
      exit 1
    fi
    RUN_MODE="production"
    ;;
  -d | --debug)
    if [ -n "$BUILD_MODE" ]; then
      echo -e "\n(*) Error: Only one build mode can be specified.\n"
      exit 1
    fi
    BUILD_MODE="debug"
    ;;
  -p | --profile)
    if [ -n "$BUILD_MODE" ]; then
      echo -e "\n(*) Error: Only one build mode can be specified.\n"
      exit 1
    fi
    BUILD_MODE="profile"
    ;;
  -r | --release)
    if [ -n "$BUILD_MODE" ]; then
      echo -e "\n(*) Error: Only one build mode can be specified.\n"
      exit 1
    fi
    BUILD_MODE="release"
    ;;
  --version=*)
    APP_VERSION="${1#*=}"
    ;;
  --api-host=*)
    API_HOST="${1#*=}"
    ;;
  *)
    print_unknown_option "$1"
    ;;
  esac
  shift
done

# IF HELP DISPLAYED EXIT
if [[ -n ${DISPLAY_HELP} ]]; then
  display_help
  exit 0
fi

# SET DEFAULT RUN MODE IF NONE SPECIFIED
if [[ -z "${RUN_MODE}" ]]; then
  RUN_MODE="production"
fi

# SET ENVIRONMENT VARIABLE FOR BUILD PROCESS
export RUN_MODE

# SET DEFAULT BUILD MODE IF NONE SPECIFIED
if [[ -z "${BUILD_MODE}" ]]; then
  BUILD_MODE="release"
fi

export BUILD_MODE

if [[ -z "${APP_VERSION}" ]]; then
  echo -e "\n(*) Error: --version is required.\n"
  exit 1
fi

export APP_VERSION

if [[ -z "${API_HOST}" ]]; then
  echo -e "\n(*) Error: --api-host is required.\n"
  exit 1
fi

export API_HOST

# Source the functions file
source "${BASEDIR}/scripts/function-web.sh"

setup_versions

# setup_web_icons

build_web
