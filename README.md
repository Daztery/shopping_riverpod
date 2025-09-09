# Shopping Riverpod App

This is a sample Flutter application built with **Riverpod** and **Clean
Architecture** principles.\
It demonstrates how to manage state, persistence, and business logic
separation in a simple purchases tracker app.

## Features

-   Add products with name, price, and quantity
-   Edit and remove products from the list
-   Persistent storage using SharedPreferences
-   Display of total spending
-   Set and clear a spending limit
-   Clear all products at once

## Architecture

The project follows a **Clean Architecture** structure with three
layers:

-   **Domain**: Entities, Repositories (contracts), and Use Cases
-   **Data**: Data sources, Models, and Repository Implementations
-   **Presentation**: UI (screens, widgets), State, and Controllers
    (Riverpod providers)

## Tech Stack

-   Flutter (Material 3)
-   Riverpod (with code generation)
-   SharedPreferences for local persistence
-   Intl for currency formatting

## Project Structure

    lib/
      core/                # Core dependencies (e.g., DI)
      features/
        purchases/
          data/            # Datasources, Models, Repository Implementations
          domain/          # Entities, Repositories (abstract), Use Cases
          presentation/    # UI, State, Controllers, Widgets
      main.dart

## Setup

1.  Install Flutter (3.35.1 or newer recommended).

2.  Run:

    ``` bash
    flutter pub get
    flutter pub run build_runner build --delete-conflicting-outputs
    ```

3.  For iOS: ensure CocoaPods is installed and run `pod install` inside
    the `ios` folder.

4.  Launch the app:

    ``` bash
    flutter run
    ```

## Commands

-   **Codegen watch** (keep code generation updated automatically):

    ``` bash
    flutter pub run build_runner watch --delete-conflicting-outputs
    ```

-   **Clean & Reinstall dependencies**:

    ``` bash
    flutter clean
    flutter pub get
    ```
