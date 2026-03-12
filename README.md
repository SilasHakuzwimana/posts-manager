# Posts Manager — Flutter Lab 4

> A Flutter mobile application for managing posts via the [JSONPlaceholder](https://jsonplaceholder.typicode.com/) REST API.
>
> Built as part of  **Lab 4: Consuming APIs in Flutter** .

## Table of Contents

* [Overview](https://claude.ai/chat/183742e9-6849-4236-816a-a14e5bded8e8#overview)
* [Features](https://claude.ai/chat/183742e9-6849-4236-816a-a14e5bded8e8#features)
* [Tech Stack](https://claude.ai/chat/183742e9-6849-4236-816a-a14e5bded8e8#tech-stack)
* [Project Structure](https://claude.ai/chat/183742e9-6849-4236-816a-a14e5bded8e8#project-structure)
* [Getting Started](https://claude.ai/chat/183742e9-6849-4236-816a-a14e5bded8e8#getting-started)
* [API Reference](https://claude.ai/chat/183742e9-6849-4236-816a-a14e5bded8e8#api-reference)
* [Screenshots](https://claude.ai/chat/183742e9-6849-4236-816a-a14e5bded8e8#screenshots)
* [Author](https://claude.ai/chat/183742e9-6849-4236-816a-a14e5bded8e8#author)

## Overview

Posts Manager allows staff to **view, create, edit, and delete** posts from a remote server. The backend is simulated using the JSONPlaceholder public test API, allowing full CRUD operations to be demonstrated without a real backend.

## Features

| Feature        | Description                                       |
| -------------- | ------------------------------------------------- |
| View all posts | Fetches and displays all 100 posts from the API   |
| Post detail    | Tap any post to read its full content             |
| Create post    | Submit a new post via a validated form            |
| Edit post      | Update the title and body of any existing post    |
| Delete post    | Remove a post with a confirmation dialog          |
| Error handling | Graceful UI for network errors with retry support |

## Tech Stack

| Package          | Version  | Purpose                                   |
| ---------------- | -------- | ----------------------------------------- |
| `flutter`      | SDK      | UI framework                              |
| `http`         | ^1.2.0   | HTTP requests (GET, POST, PUT, DELETE)    |
| `google_fonts` | ^6.1.0   | Custom typography (Space Grotesk + Inter) |
| `dart:convert` | built-in | JSON encoding and decoding                |

## Project Structure

```
posts_manager/
├── lib/
│   ├── main.dart                    # App entry point & MaterialApp config
│   ├── models/
│   │   └── post.dart                # Post data model (fromJson, toJson, copyWith)
│   ├── services/
│   │   └── post_service.dart        # API service layer (CRUD + error handling)
│   └── screens/
│       ├── post_list_screen.dart    # Home screen — FutureBuilder + ListView
│       ├── post_detail_screen.dart  # Single post view
│       └── post_form_screen.dart    # Create / Edit form with validation
├── pubspec.yaml
└── README.md
```

## Getting Started

### Prerequisites

Make sure you have the following installed:

* [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.0.0`
* Dart `>=3.0.0`
* Android Studio / VS Code with Flutter extension
* An emulator or physical device

### Installation & Run

```bash
# 1. Clone the repository
git clone https://github.com/SilasHakuzwimana/posts_manager.git

# 2. Navigate into the project
cd posts_manager

# 3. Install dependencies
flutter pub get

# 4. Run the app (debug mode)
flutter run

# 5. Run on a specific device
flutter run -d <device-id>

# 6. List available devices
flutter devices
```

### Build

```bash
# Build APK (Android)
flutter build apk --release

# Build App Bundle (Google Play)
flutter build appbundle --release

# Build for iOS
flutter build ios --release
```

### Code Quality

```bash
# Analyze code for issues
flutter analyze

# Format all Dart files
dart format lib/

# Run tests
flutter test

# Clean build artifacts
flutter clean
```

## API Reference

Base URL: `https://jsonplaceholder.typicode.com/posts`

| Method     | Endpoint        | Description             |
| ---------- | --------------- | ----------------------- |
| `GET`    | `/posts`      | Fetch all posts         |
| `GET`    | `/posts/{id}` | Fetch a single post     |
| `POST`   | `/posts`      | Create a new post       |
| `PUT`    | `/posts/{id}` | Update an existing post |
| `DELETE` | `/posts/{id}` | Delete a post           |

> **Note:** JSONPlaceholder is a mock API. Create/Update/Delete operations return simulated responses and do not persist data.

## Screenshots

> Add screenshots here after running the app.

| Post List        | Post Detail      | Create / Edit    |
| ---------------- | ---------------- | ---------------- |
| *(screenshot)* | *(screenshot)* | *(screenshot)* |

## Author

**Your Name**

Mobile App Development — Lab 4

Institution: UR-CST

GitHub: [@SilasHakuzwimana](https://github.com/SilasHakuzwimana)

## License

This project is for academic purposes only.
