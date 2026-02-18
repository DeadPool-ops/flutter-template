# setup.sh
#!/bin/bash
echo "Enter your app name (snake_case, e.g. my_cool_app):"
read APP_NAME
echo "Enter display name (e.g. My Cool App):"
read DISPLAY_NAME
echo "Enter bundle ID (e.g. com.yourcompany.myapp):"
read BUNDLE_ID

# Rename files
find . -type f \( -name "*.dart" -o -name "*.yaml" -o -name "*.gradle" \) \
  -exec sed -i "s/flutter_template/$APP_NAME/g" {} +
  
dart pub global run rename setAppName --value "$DISPLAY_NAME"
dart pub global run rename setBundleId --value "$BUNDLE_ID"

flutter pub get
echo "✅ Done! Your app '$DISPLAY_NAME' is ready."