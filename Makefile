
# * MAIN APP

app_fcg:
	cd apps/elbdesk_app/
	@echo "\033[38;5;208mChanged directory to apps/elbdesk_app/\033[0m"
	fvm flutter clean
	@echo "Flutter clean completed for apps/elbdesk_app/"
	fvm flutter pub get
	@echo "Flutter pub get completed for apps/elbdesk_app/"
	cd ../../
	@echo "Returned to root directory"
	@echo "All operations completed for apps/elbdesk_app/"

app_brw:
	cd apps/elbdesk_app/ && fvm dart run build_runner watch --delete-conflicting-outputs

app_brb:
	cd apps/elbdesk_app/ && fvm dart run build_runner build --delete-conflicting-outputs && cd ../../

app_run_dev_release:
	cd apps/elbdesk_app/ && fvm flutter run -d macos --dart-define=RUN_MODE=dev --release

app_run_macos_test:
	cd apps/elbdesk_app/ && fvm flutter run -d macos --dart-define=RUN_MODE=test --dart-define=APP_VERSION=0.0.0-test

app_run_macos_staging:
	cd apps/elbdesk_app/ && fvm flutter run -d macos --dart-define=RUN_MODE=staging --dart-define=APP_VERSION=0.0.0-staging

app_run_test_release:
	cd apps/elbdesk_app/ && fvm flutter run -d macos --dart-define=RUN_MODE=test --release

app_run_windows_test:
	cd apps/elbdesk_app/ && fvm flutter run -d windows --dart-define=RUN_MODE=test --dart-define=APP_VERSION=0.0.6-test

app_run_windows_test_release:
	cd apps/elbdesk_app/ && fvm flutter run -d windows --dart-define=RUN_MODE=test --release

app_run_web_test:
	cd apps/elbdesk_app/ && fvm flutter run -d chrome --dart-define=RUN_MODE=test --dart-define=APP_VERSION=0.0.6-test

app_run_wasm_test:
	cd apps/elbdesk_app/ && fvm flutter run -d chrome --wasm --dart-define=RUN_MODE=test --dart-define=APP_VERSION=0.0.0-test


# * CORE MODULES
core_fcg:
	cd packages/elbdesk_core/ && fvm flutter clean && fvm flutter pub get && cd ../../

core_brw:
	cd packages/elbdesk_core/ && fvm dart run build_runner watch --delete-conflicting-outputs

core_brb:
	cd packages/elbdesk_core/ && fvm dart run build_runner build --delete-conflicting-outputs && cd ../../

core_l10n_gen:
	cd packages/elbdesk_core/ && fvm flutter gen-l10n && cd ../../	


### Project
project_core_l10n_gen:
	cd packages/project_core/ && fvm flutter gen-l10n && cd ../../

project_core_fcg:
	cd packages/project_core/ && fvm flutter clean && fvm flutter pub get && cd ../../

project_core_brw:
	cd packages/project_core/ && fvm dart run build_runner watch --delete-conflicting-outputs



project_core_brb:
	cd packages/project_core/ && fvm dart run build_runner build --delete-conflicting-outputs && cd ../../

### UI
ui_fcg:
	cd packages/elbdesk_ui/ && fvm flutter clean && fvm flutter pub get

ui_brw:
	cd packages/elbdesk_ui/ && fvm dart run build_runner watch --delete-conflicting-outputs

ui_brb:
	cd packages/elbdesk_ui/ && fvm dart run build_runner build --delete-conflicting-outputs && cd ../../


# * SERVERS/BACKEND
server_delete_migrations:
	cd servers/elbdesk_server/ && rm -rf migrations && cd ../../

server_fcg:
	cd servers/elbdesk_server/ && fvm dart pub get && cd ../../

server_up:
	cd servers/elbdesk_server/ && docker compose up --build --detach && cd ../../

server_pod_up:
	cd servers/elbdesk_server/ && podman compose up --build --detach && cd ../../

server_gen:
	cd servers/elbdesk_server/ && serverpod generate && cd ../../

server_migrate:
	cd servers/elbdesk_server/ && serverpod create-migration && cd ../../

server_migrate_force:
	cd servers/elbdesk_server/ && serverpod create-migration --force && cd ../../

server_repair:
	cd servers/elbdesk_server/ && serverpod create-repair-migration && cd ../../

server_run:
	cd servers/elbdesk_server/ && dart bin/main.dart --apply-migrations


server_gen_run:
	cd servers/elbdesk_server/ && serverpod generate && cd ../../ && cd servers/elbdesk_server/ && dart bin/main.dart --apply-migrations

# Run this before and keep it running while executing server_repair_force 
# Stop it and run it again after a server_repair_force to apply the migration
server_run_repair:
	cd servers/elbdesk_server/ && dart bin/main.dart --apply-repair-migration
# Run this while the server is already running
server_repair_force:
	cd servers/elbdesk_server/ && serverpod create-repair-migration --force && cd ../../

backend_core_migrate:
	cd servers/elbdesk_backend_core/elbdesk_backend_core_server/ && serverpod create-migration && cd ../../../

backend_core_fcg:
	cd servers/elbdesk_backend_core/elbdesk_backend_core_server/ && rm ./pubspec.lock && fvm dart pub get && cd ../../../



backend_core_gen:
	cd servers/elbdesk_backend_core/elbdesk_backend_core_server/ && serverpod generate && cd ../../../

backend_core_migrate_force:
	cd servers/elbdesk_backend_core/elbdesk_backend_core_server/ && serverpod create-migration --force && cd ../../../


server_all_gen:
	make backend_core_gen && make server_gen

server_all_migrate:
	make backend_core_migrate ; make server_migrate



# * MODULES

# * CRM
crm_fcg:
	cd packages/elbdesk_crm/ && fvm flutter clean && fvm flutter pub get && cd ../../

crm_brw:
	cd packages/elbdesk_crm/ && fvm dart run build_runner watch --delete-conflicting-outputs

crm_brb:
	cd packages/elbdesk_crm/ && fvm dart run build_runner build --delete-conflicting-outputs && cd ../../

crm_l10n_gen:
	cd packages/elbdesk_crm/ && fvm flutter gen-l10n && cd ../../


# * PREPRESS
prepress_fcg:
	cd packages/elbdesk_prepress/ && fvm flutter clean && fvm flutter pub get && cd ../../

prepress_brw:
	cd packages/elbdesk_prepress/ && fvm dart run build_runner watch --delete-conflicting-outputs

prepress_brb:
	cd packages/elbdesk_prepress/ && fvm dart run build_runner build --delete-conflicting-outputs && cd ../../

prepress_l10n_gen:
	cd packages/elbdesk_prepress/ && fvm flutter gen-l10n && cd ../../

# * SALES
sales_fcg:
	cd packages/elbdesk_sales/ && fvm flutter clean && fvm flutter pub get && cd ../../

sales_brw:
	cd packages/elbdesk_sales/ && fvm dart run build_runner watch --delete-conflicting-outputs

sales_brb:
	cd packages/elbdesk_sales/ && fvm dart run build_runner build --delete-conflicting-outputs && cd ../../

sales_l10n_gen:
	cd packages/elbdesk_sales/ && fvm flutter gen-l10n && cd ../../









# Melos stuff

bs:
	melos bootstrap

clean:
	melos clean

docs_install:
	cd docs/elbdesk-docusaurus/ && npm install

docs_run:
	cd docs/elbdesk-docusaurus/ && npm run start

docs_start:
	cd docs/elbdesk-docusaurus/ && deno task start


# Macros

project_reset:
	make project_brb && make server_gen && make server_migrate && make l10n_gen



project_brb:
	make core_fcg && \
	make core_brb && \
	make crm_fcg && \
	make crm_brb && \
	make prepress_fcg && \
	make prepress_brb && \
	make sales_fcg && \
	make sales_brb && \
	make ui_fcg && \
	make ui_brb && \
	make app_fcg && \
	make app_brb
	




