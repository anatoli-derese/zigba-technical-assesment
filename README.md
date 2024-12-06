# Demoz Mobile Application

This repository contains the source code for **Demoz**, a Flutter-based mobile application developed with a focus on clean architecture and reliable state management. The app is modular, scalable, and follows best practices to ensure maintainability and robustness. It includes comprehensive unit tests and precise implementation of design specifications.

## Table of Contents
1. [Overview](#overview)
2. [Project Structure](#project-structure)
3. [Dependencies](#dependencies)
4. [Features](#features)
5. [Getting Started](#getting-started)
6. [Code Details](#code-details)
    - [Blocs](#blocs)
    - [Models](#models)
    - [Pages](#pages)
    - [Repository Layer](#repository-layer)
    - [Local Storage](#local-storage)
7. [Unit Testing](#unit-testing)

---

## Overview

Demoz is a mobile application built to demonstrate a strong understanding of clean architecture principles, local data persistence, and test-driven development. The project integrates Hive for local storage, utilizes Bloc for state management, and implements a clear folder structure to ensure code readability and scalability.

---

## Project Structure

The `lib` directory is organized for clarity and maintainability:

```plaintext
lib
├── Blocs
│   └── bloc
│       ├── Auth
│       │   └── bloc
│       │       ├── auth_bloc.dart
│       │       ├── auth_event.dart
│       │       └── auth_state.dart
│       ├── Company
│       │   ├── company_bloc.dart
│       │   ├── company_event.dart
│       │   └── company_state.dart
│       └── Employees
│           ├── employee_bloc.dart
│           ├── employee_event.dart
│           └── employee_state.dart
├── main.dart
├── Models
│   ├── Company.dart
│   ├── Company.g.dart
│   ├── Employee.dart
│   └── Employee.g.dart
├── Pages
│   ├── Auth
│   │   └── auth_page.dart
│   ├── bottom_navigation.dart
│   ├── Company
│   │   ├── company_profile_page.dart
│   │   └── register_company.dart
│   ├── Employee
│   │   ├── add_employee.dart
│   │   └── employee_list.dart
│   ├── Home
│   │   ├── buildBottomRow.dart
│   │   ├── buildDataRange.dart
│   │   ├── buildHeader.dart
│   │   ├── buildMetricCard.dart
│   │   ├── buildTabs.dart
│   │   ├── buildTaxInfo.dart
│   │   ├── home_page.dart
│   │   └── tabs_wrapper.dart
│   └── landing_page.dart
└── Repository
    ├── auth_repository.dart
    ├── company_repository.dart
    └── employee_repository.dart
```

Additionally, the `test` directory includes unit tests for the repository layer, ensuring the business logic's reliability.

---

## Dependencies

Here are the key dependencies used in the project:

- **State Management**: [flutter_bloc](https://pub.dev/packages/flutter_bloc)
- **JSON Serialization**: [json_serializable](https://pub.dev/packages/json_serializable), [build_runner](https://pub.dev/packages/build_runner)
- **Local Storage**: [hive](https://pub.dev/packages/hive), [hive_flutter](https://pub.dev/packages/hive_flutter)
- **Unit Testing**: [mockito](https://pub.dev/packages/mockito)
- **Others**: flutter, etc.

---

## Features

### Authentication
- Login and registration functionality.
- Authentication state managed by `auth_bloc`.

### Company Management
- Add and view company profiles.
- Managed using `company_bloc`.

### Employee Management
- Add, view, and list employees.
- State management handled via `employee_bloc`.

---

## Getting Started

### Prerequisites
1. Install Flutter SDK: [Flutter Installation Guide](https://flutter.dev/docs/get-started/install)
2. Clone the repository:
   ```bash
   git clone https://github.com/anatoli-derese/zigba-technical-assesment.git
   ```
3. Navigate to the project directory:
   ```bash
   cd zigba
   ```

### Running the App
1. Install dependencies:
   ```bash
   flutter pub get
   ```
2. Run the app on an emulator or device:
   ```bash
   flutter run
   ```

### Running Tests
- Execute unit tests with:
  ```bash
  flutter test
  ```

---

## Code Details

### Blocs

Blocs handle state transitions for various application features:
- **Auth Bloc**: Handles authentication-related states.
- **Company Bloc**: Manages company-related state changes.
- **Employee Bloc**: Manages employee-related states.

### Models

Models represent application data structures and support JSON serialization for easy data exchange:
- `Company.dart`
- `Employee.dart`

The `.g.dart` files are generated using `build_runner`.

### Pages

The `Pages` directory organizes UI components by feature:
- **Auth**: Authentication page.
- **Company**: Registration and profile pages.
- **Employee**: Employee addition and listing pages.
- **Home**: Dashboard with custom UI widgets.

### Repository Layer

The repository layer handles data access and business logic. Each repository is modular and adheres to clean architecture principles, ensuring testability and scalability.

### Local Storage

**Hive** is used for local storage due to its lightweight, fast, and secure nature. It provides efficient data persistence without requiring a complex database setup. 

Integration of Hive includes:
1. Initialization in the `main.dart` file.
2. Data persistence for user and app-specific information.
3. Optimized read/write operations.

---

## Unit Testing

Unit tests are implemented for the repository layer, covering core business logic. 

### Highlights
- Uses **Mockito** for mocking dependencies.
- Ensures that repository methods behave as expected.

To regenerate mock files:
```bash
flutter pub run build_runner build
``` 

Tests can be found in the `test` directory.

---

With the combination of **Hive**, **Bloc**, and a well-structured architecture, this project achieves a balance of performance, scalability, and maintainability. It adheres to all specified requirements, including unit testing, precise design implementation, and comprehensive documentation.