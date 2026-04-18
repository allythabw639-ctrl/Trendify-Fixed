# Trendify 🎬

A social media video app built with Flutter — TikTok-style short video feed with AI-powered style filters.

## Features

- **Video Feed** — Swipe vertically through short videos (TikTok-style)
- **Discover** — Search, trending tags, categories, and suggested creators
- **Inbox** — Activity notifications and direct messages
- **Profile** — User profile with stats
- **Record** — Camera UI with style filters (Anime, Sketch, Oil Painting, Watercolor, Pop Art)
- **Auth** — Login screen with provider-based state management

## Fixes Applied

### Buttons Not Working
- Fixed `BottomNavigationBar` with proper `onTap` + `setState` for screen switching
- Feed action buttons (Like, Comment, Share) use `InkWell` with working `onTap` callbacks
- Video player uses `GestureDetector` for play/pause tap handling

### Internet Support
- Added `INTERNET` permission in `AndroidManifest.xml`
- Added `ACCESS_NETWORK_STATE` permission
- Enabled `usesCleartextTraffic` for HTTP video loading
- Video URLs updated to use Google's public CDN (reliable, always available)
- Video player includes retry logic with fallback constructors

## Getting Started

### Prerequisites
- Flutter SDK >= 3.0.0
- Android Studio or VS Code with Flutter extension
- Java 17 (for Android builds)

### Run Locally
```bash
flutter pub get
flutter run
```

### Build Release APK
```bash
flutter build apk --release
```
The APK will be at `build/app/outputs/flutter-apk/app-release.apk`

## CI/CD — Automatic APK Builds

This repo includes a GitHub Actions workflow that automatically builds a release APK whenever code is pushed to `main`.

### How to Download the APK
1. Go to the **Actions** tab in this repository
2. Click on the latest successful workflow run
3. Scroll down to **Artifacts**
4. Download `trendify-release-apk`
5. Unzip and install the APK on your Android device

## Project Structure
```
lib/
├── main.dart                          # App entry point + navigation
├── models/
│   ├── video_model.dart               # Video data model + sample data
│   ├── user_model.dart                # User data model
│   └── style_filter_model.dart        # Style filter model
├── screens/
│   ├── home_screen.dart               # Home (wraps FeedScreen)
│   ├── discover_screen.dart           # Simple discover placeholder
│   ├── inbox_screen.dart              # Simple inbox placeholder
│   ├── profile_screen.dart            # Simple profile placeholder
│   ├── feed/feed_screen.dart          # Video feed with swipe
│   ├── discover/discover_screen.dart  # Full discover with search/tags
│   ├── inbox/inbox_screen.dart        # Full inbox with tabs
│   ├── profile/profile_screen.dart    # Full profile with stats
│   ├── auth/login_screen.dart         # Login screen
│   └── upload/record_screen.dart      # Camera/record screen
├── services/
│   ├── api_service.dart               # API service (mock)
│   ├── auth_provider.dart             # Auth state management
│   └── style_filter_provider.dart     # Filter state management
├── utils/
│   └── trendify_theme.dart            # Theme and branding
└── widgets/
    ├── trendify_video_player.dart      # Main video player widget
    └── video_player_widget.dart        # Alternative video player
```

## Tech Stack
- **Flutter** 3.x with Material 3
- **video_player** for video playback
- **chewie** for enhanced video controls
- **Provider** for state management (auth, filters)

## License
This project is for educational purposes.
