# 🚀 Flutter Universal Template

A production-ready Flutter template built with **Clean Architecture**, **BLoC state management**, **go_router**, and a full suite of utilities — ready to clone and go.

---

## 📁 Folder Structure

```
flutter_template/
├── lib/
│   ├── main.dart                  # Entry point
│   ├── app.dart                   # Root MaterialApp widget
│   │
│   ├── core/
│   │   ├── constants/
│   │   │   ├── app_constants.dart # API URLs, keys, timeouts
│   │   │   ├── app_strings.dart   # Static UI strings
│   │   │   └── app_assets.dart    # Asset path constants
│   │   │
│   │   ├── errors/
│   │   │   ├── failures.dart      # Domain-level failure classes
│   │   │   └── exceptions.dart    # Data-level exception classes
│   │   │
│   │   ├── network/
│   │   │   ├── network_client.dart         # Dio client
│   │   │   ├── network_info.dart           # Connectivity checker
│   │   │   ├── local_storage_service.dart  # SharedPrefs + SecureStorage
│   │   │   └── interceptors/
│   │   │       ├── auth_interceptor.dart   # Token injection + refresh
│   │   │       └── error_interceptor.dart  # Global error handling
│   │   │
│   │   ├── router/
│   │   │   └── app_router.dart    # go_router config + route names
│   │   │
│   │   ├── theme/
│   │   │   ├── app_theme.dart     # Light & dark ThemeData
│   │   │   ├── app_colors.dart    # Color palette
│   │   │   └── app_text_styles.dart # Typography system
│   │   │
│   │   └── utils/
│   │       ├── app_spacing.dart   # Spacing, padding, radius constants
│   │       ├── app_bloc_observer.dart # Global BLoC logger
│   │       ├── extensions.dart    # Context, String, Widget extensions
│   │       └── validators.dart    # Form field validators
│   │
│   ├── data/
│   │   ├── datasources/
│   │   │   ├── local/             # Hive / SharedPrefs data sources
│   │   │   └── remote/            # Retrofit / Dio API sources
│   │   ├── models/
│   │   │   └── api_response.dart  # Generic API + paginated response
│   │   └── repositories/          # Concrete repository implementations
│   │
│   ├── domain/
│   │   ├── entities/              # Pure Dart entity classes
│   │   ├── repositories/          # Abstract repository contracts
│   │   └── usecases/
│   │       └── base_usecase.dart  # UseCase / NoParamsUseCase base
│   │
│   ├── presentation/
│   │   ├── blocs/
│   │   │   └── base_state.dart    # Generic Loading/Success/Error states
│   │   ├── pages/
│   │   │   ├── splash/            # SplashPage
│   │   │   ├── auth/              # LoginPage
│   │   │   ├── home/              # HomePage
│   │   │   └── not_found/         # 404 Page
│   │   └── widgets/
│   │       ├── common/
│   │       │   ├── app_button.dart    # Multi-variant button
│   │       │   ├── app_text_field.dart # Unified text input
│   │       │   ├── state_widgets.dart # Loader, Error, Empty widgets
│   │       │   ├── skeleton_loader.dart # Shimmer skeletons
│   │       │   └── app_dialogs.dart   # Alert, confirm, bottom sheet
│   │       └── layout/            # Scaffold wrappers, nav bars, etc.
│   │
│   ├── di/
│   │   └── injection.dart         # get_it + injectable setup
│   │
│   └── l10n/
│       └── l10n.dart              # Localization barrel export
│
├── assets/
│   ├── fonts/                     # Custom font files (.ttf/.otf)
│   ├── icons/                     # SVG icons
│   ├── images/                    # PNG/JPG images
│   └── lottie/                    # Lottie animation JSON files
│
├── l10n/
│   └── app_en.arb                 # English translations
│
├── test/
│   ├── unit/                      # Unit tests (use cases, repos)
│   ├── widget/                    # Widget tests
│   └── integration/               # End-to-end tests
│
├── analysis_options.yaml          # Lint rules
├── l10n.yaml                      # Localization config
├── Makefile                       # Dev command shortcuts
└── pubspec.yaml                   # Dependencies
```

---

## ⚡ Quick Start

```bash
# 1. Clone the repo
git clone https://github.com/your-username/flutter_template.git my_app
cd my_app

# 2. Rename the project
# Find & replace 'flutter_template' with your app name in:
# - pubspec.yaml (name field)
# - All import statements
# Or use: flutter pub run rename_app:main all=MyApp

# 3. Install dependencies & generate code
make setup

# 4. Run the app
make run
```

---

## 🏗️ Architecture

This template follows **Clean Architecture** with three layers:

| Layer | Responsibility |
|-------|---------------|
| **Domain** | Business logic — Entities, Repositories (abstract), Use Cases |
| **Data** | Data access — Models, Remote/Local DataSources, Repository Implementations |
| **Presentation** | UI — Pages, BLoCs, Widgets |

Dependencies flow **inward only**: `Presentation → Domain ← Data`

---

## 🔧 Key Technologies

| Purpose | Package |
|---------|---------|
| State Management | `flutter_bloc` + `equatable` |
| Navigation | `go_router` |
| DI | `get_it` + `injectable` |
| Networking | `dio` + `retrofit` |
| Local Storage | `shared_preferences` + `flutter_secure_storage` |
| Code Gen | `freezed` + `json_serializable` |
| Functional Programming | `dartz` (Either type) |
| Localization | `flutter_localizations` (ARB) |

---

## 🧩 Adding a New Feature

For each new feature (e.g. `products`), follow this pattern:

```
lib/
  domain/
    entities/product.dart
    repositories/product_repository.dart      ← abstract
    usecases/get_products_usecase.dart
  data/
    models/product_model.dart                 ← @JsonSerializable
    datasources/remote/product_remote_ds.dart ← @injectable
    datasources/local/product_local_ds.dart
    repositories/product_repository_impl.dart ← @LazySingleton
  presentation/
    blocs/product/
      product_bloc.dart
      product_event.dart
      product_state.dart
    pages/products/
      products_page.dart
    widgets/
      product_card.dart
```

---

## 🛠️ Useful Commands

```bash
make get          # Install dependencies
make gen          # Run code generation (freezed, injectable, retrofit)
make gen-watch    # Watch & regenerate on file change
make test         # Run tests with coverage
make lint         # Run static analysis
make fix          # Auto-fix lint issues
make clean        # Clean build + reinstall
make build-apk    # Build release Android APK
```

---

## 🔐 Environment Variables

Pass environment-specific config at build time:

```bash
flutter run --dart-define=BASE_URL=https://api.staging.example.com
flutter build apk --dart-define=BASE_URL=https://api.example.com
```

Access in code via `AppConstants.baseUrl`.

---

## 📄 License

MIT — free to use for personal and commercial projects.
