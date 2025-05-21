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
├── core/                     # Các thành phần cốt lõi, dùng chung
│   ├── configs/              # Cấu hình ứng dụng
│   ├── constants/            # Các hằng số (ví dụ: API URL, Key...)
│   ├── di/                   # Dependency Injection (get_it)
│   ├── extensions/           # Các extension giúp mở rộng tính năng
│   ├── localization/         # Đa ngôn ngữ
│   ├── services/             # Các dịch vụ hỗ trợ (API, Storage, v.v.)
│   ├── themes/               # Quản lý giao diện (Theme, Color Scheme...)
│   ├── utils/                # Các tiện ích (Helpers, Formatters, Validators...)
│   └── widgets/              # Các widget tái sử dụng (Button, Card, Modal...)
├── features/                 # Các tính năng chính
│   ├── name_feature/         # Tính năng "name_feature"
│   │   ├── domain/           # Lớp domain
│   │   │   ├── models/       # Các lớp mô hình
│   │   │   └── repositories/ # Các lớp Repository
│   │   └── presentation/     # Lớp hiển thị (UI, Bloc, Widget...)
│   │       ├── bloc/         # Quản lý trạng thái (State Management)
│   │       ├── page/         # Các màn hình hiển thị chính
│   │       └── widget/       # Widget dùng riêng cho feature
│   └── splash/               # Tính năng màn hình chờ (Splash Screen)
└── app.dart                  # Entry point của ứng dụng (MaterialApp)
└── main.dart                 # Initital ứng dụng
└── simple_bloc_observer.dart # Theo dõi và ghi lại các thay đổi trong trạng thái (state)
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

Nếu công ty có bất kỳ câu hỏi nào đó, có thể liên hệ qua email **ducvuglotec@gmail.com**. Cảm ơn! 😊

---

> 💡 Built with love using Flutter and best development practices.
