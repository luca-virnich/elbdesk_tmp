# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

ElbDesk COE is a Flutter-based ERP/CRM system tailored for the printing/prepress industry. It's structured as a monorepo using Melos and Dart workspaces, with both frontend Flutter applications and a Serverpod backend.

## Essential Commands

### Quick Start
```bash
make bs                    # Bootstrap all packages with Melos
make project_brb          # Build all packages (runs build_runner)
make app_run_macos_test   # Run main app on macOS in test mode
```

### Common Development Commands
```bash
# App development
make app_fcg              # Flutter clean & get for main app
make app_brw              # Build runner watch (auto-generates code)
make app_brb              # Build runner build (one-time generation)

# Run on different platforms
make app_run_macos_test   # macOS test environment
make app_run_windows_test # Windows test environment
make app_run_web_test     # Chrome test environment

# Server
make server_up            # Start PostgreSQL & Redis via Docker
make server_gen           # Generate Serverpod code
make server_run           # Run server with migrations

# Linting & Analysis
fvm flutter analyze       # Run linting for entire workspace
```

### Package-Specific Commands
For any package (core, crm, sales, prepress, ui):
```bash
make [package]_fcg        # Clean and get dependencies
make [package]_brw        # Build runner watch
make [package]_brb        # Build runner build
```

### Testing
```bash
cd packages/[package_name] && fvm flutter test  # Run tests for a package
fvm flutter test path/to/test.dart              # Run specific test
```

## Architecture

### Monorepo Structure
- **`/apps/`**: Flutter applications
  - `elbdesk_app`: Main ERP application with modular dashboard
  - `coe_dateneingang`: Data entry application
  
- **`/packages/`**: Business logic and UI components
  - `elbdesk_core`: Authentication, utilities, shared functionality
  - `elbdesk_crm`: Customer, contact, company management
  - `elbdesk_sales`: Sales orders and related features
  - `elbdesk_prepress`: Industry-specific features (artwork, colors, layouts)
  - `elbdesk_ui`: Design system and shared UI components
  - `elbdesk_window_manager`: Desktop window management
  
- **`/servers/`**: Backend infrastructure
  - `elbdesk_server`: Serverpod backend API
  - `elbdesk_client`: Generated client for server communication

### Key Technologies
- **Frontend**: Flutter with Riverpod for state management
- **Backend**: Serverpod (Dart backend framework)
- **Code Generation**: build_runner with freezed, json_serializable, riverpod_generator
- **Database**: PostgreSQL (via Docker)
- **Caching**: Redis (via Docker)

### Development Patterns
1. **State Management**: Riverpod with code generation (`@riverpod` annotations)
2. **Data Classes**: Freezed for immutable models
3. **API Communication**: Serverpod client/server with generated endpoints
4. **Routing**: go_router with type-safe routes
5. **Localization**: Flutter l10n with ARB files

### Important Development Notes
- Always use `fvm` prefix for Flutter commands (Flutter Version Manager)
- Run `make app_brw` during development to watch for code generation changes
- The project uses custom linting rules from `elbdesk_lints` package
- Environment modes: dev, test, staging, production (set via RUN_MODE)
- Desktop app uses custom window management for multi-window support