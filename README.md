
# Posts Manager — Flutter Lab 4

> A Flutter mobile application for managing posts via the [JSONPlaceholder](https://jsonplaceholder.typicode.com/) REST API.
>
> Built as part of **Lab 4: Consuming APIs in Flutter**.

## Table of Contents

* [Overview](#overview)
* [Features](#features)
* [Tech Stack](#tech-stack)
* [Project Structure](#project-structure)
* [Getting Started](#getting-started)
* [API Reference](#api-reference)
* [Screenshots](#screenshots)
* [Demo Videos](#demo-videos)
* [Author](#author)

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

<img width="223" height="356" alt="image" src="https://github.com/user-attachments/assets/a67b9c28-2d35-41a5-a468-af6f955bf403" />

<img width="680" height="668" alt="image" src="https://github.com/user-attachments/assets/bb3630e9-3b0e-4625-8a6e-8c600ffc93a3" />


## Getting Started

### Prerequisites

Make sure you have the following installed:

* [Flutter SDK](https://docs.flutter.dev/get-started/install) `>=3.0.0`
* Dart `>=3.0.0`
* Android Studio / VS Code with Flutter extension
* An emulator or physical device

### Installation & Run


# 1. Clone the repository
```bash
git clone https://github.com/SilasHakuzwimana/posts_manager.git
```

# 2. Navigate into the project
```bash
cd posts_manager
```

# 3. Install dependencies

```bash
flutter pub get
```

# 4. Run the app (debug mode)
```bash
flutter run
```

# 5. Run on a specific device

```bash
flutter run -d <device-id>
```

# 6. List available devices

```bash
flutter devices
```
### Build
# Build APK (Android)

```bash
flutter build apk --release
```

# Build App Bundle (Google Play)

```bash
flutter build appbundle --release
```
# Build for iOS

```bash
flutter build ios --release
```

### Code Quality

# Analyze code for issues

```bash
flutter analyze
```

# Format all Dart files

```bash
dart format lib/
```
# Run tests

```bash
flutter test
```

# Clean build artifacts

```bash
flutter clean
```

## API Reference

Base URL: ```bash https://jsonplaceholder.typicode.com/posts```


|Method	|Endpoint	      |Description              |
|-------|---------------|-------------------------|
|GET	  |  /posts	      |Fetch all posts          |
|GET	  |  /posts/{id}	|Fetch a single post      |
|POST	  |  /posts	      |Create a new post        |
|PUT	  |  /posts/{id}	|Update an existing post  |
|DELETE |	 /posts/{id}	|Delete a post            |


Note: JSONPlaceholder is a mock API. Create/Update/Delete operations return simulated responses and do not persist data.

## Screenshots

Screenshots are in [lib/screenshots](https://github.com/SilasHakuzwimana/posts-manager/tree/main/lib/screenshots)

## Demo Videos

Demo videos can be found in [lib/demos](https://github.com/SilasHakuzwimana/posts-manager/tree/main/lib/demos)

## Author

```bash
Silas HAKUZWIMANA (223001019)
Year of study & Department: Year III CSE
Academic year: 2025-2026

Module name & lab: Mobile Application Systems & Design — Lab 4
Institution: UR-CST
GitHub: @SilasHakuzwimana

```

License

This project is for academic purposes only.

