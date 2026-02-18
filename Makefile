.PHONY: get clean build run test gen lint fix setup init

## ─── First Time Setup ────────────────────────────────────────────────────────

## Run this once when you first clone the template
## Generates all platform folders + installs deps + generates code
init:
	flutter create --platforms=android,ios,web,windows,linux,macos .
	flutter pub get
	flutter gen-l10n
	dart run build_runner build --delete-conflicting-outputs
	@echo "✅ Project is ready! Run 'make run' to start."

## ─── Daily Dev ───────────────────────────────────────────────────────────────

## Install dependencies
get:
	flutter pub get

## Clean build artifacts
clean:
	flutter clean && flutter pub get

## Generate code (freezed, injectable, json_serializable etc.)
gen:
	dart run build_runner build --delete-conflicting-outputs

## Watch and regenerate on file change
gen-watch:
	dart run build_runner watch --delete-conflicting-outputs

## Run in debug mode
run:
	flutter run

## Run with env flags
run-dev:
	flutter run --dart-define=ENV=dev

run-prod:
	flutter run --dart-define=ENV=prod

## ─── Platform Specific ───────────────────────────────────────────────────────

## Add only Android
add-android:
	flutter create --platforms=android .

## Add only iOS
add-ios:
	flutter create --platforms=ios .

## Add only Web
add-web:
	flutter create --platforms=web .

## Add only Windows
add-windows:
	flutter create --platforms=windows .

## Add only Linux
add-linux:
	flutter create --platforms=linux .

## Add only macOS
add-macos:
	flutter create --platforms=macos .

## ─── Build ───────────────────────────────────────────────────────────────────

## Build release APK (Android)
build-apk:
	flutter build apk --release

## Build release App Bundle (Android - for Play Store)
build-aab:
	flutter build appbundle --release

## Build release IPA (iOS)
build-ios:
	flutter build ios --release --no-codesign

## Build release Web
build-web:
	flutter build web --release

## Build release Windows
build-windows:
	flutter build windows --release

## ─── Testing & Quality ───────────────────────────────────────────────────────

## Run all tests
test:
	flutter test --coverage

## Run linter
lint:
	flutter analyze

## Auto-fix lint issues
fix:
	dart fix --apply

## Format code
format:
	dart format lib/ test/

## ─── Utilities ───────────────────────────────────────────────────────────────

## Full clean + reinstall + regenerate
setup: clean get gen
	flutter gen-l10n

## Check Flutter installation
doctor:
	flutter doctor -v

## Print all dart files
tree:
	find lib -type f | sort
