.PHONY: get clean build run test gen lint fix

## Install dependencies
get:
	flutter pub get

## Clean build artifacts
clean:
	flutter clean && flutter pub get

## Build release APK
build-apk:
	flutter build apk --release

## Build release IPA
build-ios:
	flutter build ios --release --no-codesign

## Run in debug mode
run:
	flutter run

## Run with flavor (example: make run-dev)
run-dev:
	flutter run --dart-define=ENV=dev

run-prod:
	flutter run --dart-define=ENV=prod

## Generate code (freezed, injectable, etc.)
gen:
	dart run build_runner build --delete-conflicting-outputs

## Watch and generate continuously
gen-watch:
	dart run build_runner watch --delete-conflicting-outputs

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

## All-in-one: clean, get, gen
setup: clean get gen

## Print folder structure
tree:
	find lib -type f | sort
