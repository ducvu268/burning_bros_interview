# 🔍 Infinite Scrolling and Searchable Product List (Flutter) | Interview at Burning Bros

A Flutter coding project that demonstrates how to build an infinite scrolling list of products with search functionality, local favorites, and offline awareness.

> 📌 This project uses the [DummyJSON Product API](https://dummyjson.com/docs/products)
> 🎯 Key features include pagination, debounced search, offline handling, and local storage with Hive.

---

## 📱 Features

* 🔁 Infinite scrolling (loads 20 products per scroll)
* 🔍 Real-time product search with debounce
* ❤️ Add/remove favorites with local persistence
* 📂 Store favorite products using Hive (local NoSQL DB)
* 📶 Offline detection and fallback to local favorites
* ⚙️ Clean architecture using BLoC pattern and dependency injection

---

## 🧰 Tech Stack

| Tool / Library       | Purpose                             |
| -------------------- | ----------------------------------- |
| Flutter              | Mobile UI development               |
| BLoC (flutter\_bloc) | State management                    |
| Dio                  | HTTP networking                     |
| Hive                 | Local database for favorite storage |
| Freezed              | Data modeling and immutability      |
| Json Serializable    | JSON parsing                        |
| Injectable + GetIt   | Dependency injection                |
| Connectivity Plus    | Internet connection status handling |
| Logger               | Logging debug info and errors       |

---

## 📂 Project Structure

```
lib/
├── core/                     # Core components, shared across the app
│   ├── configs/              # Application configurations
│   ├── constants/            # Global constants (e.g., API URL, Keys, etc.)
│   ├── di/                   # Dependency Injection (get_it setup)
│   ├── enums/                # Named constant value sets (Enums)
│   ├── extensions/           # Extension methods to enhance functionality
│   ├── localization/         # Internationalization (i18n)
│   ├── models/               # Global model classes
│   ├── services/             # Shared services (API, local storage, etc.)
│   ├── themes/               # Theme and color scheme management
│   ├── utils/                # Utility helpers (validators, formatters, etc.)
│   └── widgets/              # Reusable shared widgets (buttons, cards, modals, etc.)
├── features/                 # Main feature-based modules
│   ├── products/             # Product-related features
│   │   ├── domain/           # Domain layer (business logic, models)
│   │   │   ├── models/       # Data models specific to this feature
│   │   │   └── repositories/ # Repository interfaces and implementations
│   │   └── presentation/     # Presentation layer (UI and state management)
│   │       ├── bloc/         # Bloc or Cubit files for state management
│   │       ├── pages/        # UI screens (e.g., Product List, Detail Page)
│   │       └── widgets/      # Feature-specific UI components
│   └── splash/               # Splash screen feature module
├── app.dart                  # Root app configuration (MaterialApp, routes, etc.)
├── main.dart                 # Main application entry point
└── simple_bloc_observer.dart # Bloc observer for logging state transitions
```

---

## 🚀 Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/ducvu268/burning_bros_interview.git
cd burning_bros_interview
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Generate Code

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### 4. Run the App

```bash
flutter run
```

---

## 🔍 How It Works

### 📦 Pagination

* Uses the endpoint `/products?limit=20&skip=x`
* Loads more products as the user scrolls

### 🔎 Search

* Uses `/products/search?q=keyword`
* Search is debounced to reduce unnecessary API calls

### ❤️ Favorites

* Users can favorite/unfavorite products
* Favorites are saved in local Hive DB and persist across app restarts

### 📴 Offline Support

* App detects internet connection
* If offline, it displays saved favorite products

---

## 🎯 Design Decisions

* **Clean Architecture**: Separation of concerns via feature-based folders
* **Scalable Architecture**: Easy to add more features or services
* **Efficient Search**: Debounced input to avoid API flooding
* **Smooth UX**: Non-laggy scrolling, even with large datasets
* **Offline-first UX**: Displays useful content even when no internet is available

---


## 📝 Useful Commands

```bash
# Generate all necessary code for DI, Freezed, Hive, etc.
flutter pub run build_runner build --delete-conflicting-outputs
```

---

## 📧 Contact

If the company has any questions, feel free to contact me via email at **ducvuglotec@gmail.com**. Thank you! 😊

---

> 💡 Have a nice day.
