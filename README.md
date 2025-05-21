# Interview at Burning Bros

## 📌 Giới thiệu
Theo yêu cầu bài test từ ITBee Solutions, thì đây là ứng dụng **Quản lý Công Việc (Task Manager App)** được phát triển bằng Flutter, sử dụng BloC để quản lý state. Ứng dụng giúp người dùng tạo danh sách công việc cá nhân, theo dõi trạng thái hoàn thành và lưu trữ dữ liệu bằng SQLite. Ứng dụng chạy trên cả **iOS & Android**.

## 🚀 Tính năng chính
- 📝 **Quản lý công việc**: Thêm, sửa, xóa công việc.
- ✅ **Đánh dấu hoàn thành**: Chuyển đổi trạng thái hoàn thành/chưa hoàn thành.
- 📅 **Hạn hoàn thành**: Đặt ngày hoàn thành cho công việc.
- 🔍 **Bộ lọc công việc**: Hiển thị công việc chưa hoàn thành hoặc tất cả công việc.
- 🎨 **Giao diện đơn giản & mượt mà**: Sử dụng `ListView.builder` để hiển thị danh sách.
- 🔔 **Snackbar thông báo**: Hiển thị khi thêm, sửa, xóa công việc.
- ⚡ **Dialog xác nhận xóa**: Đảm bảo người dùng không xóa nhầm dữ liệu.

## 🛠️ Công nghệ sử dụng
- **Flutter** (Dart)
- **SQLite**
- **State Management**: BloC

## 📂 Cấu trúc thư mục
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

## 🚀 Cài đặt & Chạy ứng dụng
### 1️⃣ Clone repository
```bash
git clone https://github.com/ducvu268/interview_junior_flutter.git
cd interview_junior_flutter
```

### 2️⃣ Cài đặt dependencies
```bash
1. flutter pub get
2. dart run build_runner build --delete-conflicting-outputs
```

### 3️⃣ Chạy ứng dụng
```bash
flutter run
```

## 🚀 Test nhanh với file build APK
Link: **https://drive.google.com/drive/folders/1SXAgWK4OI8DiF0W3638_pXxd7G5m9CpK?usp=sharing**

## 📈 Mở rộng
- 🔹 **Tìm kiếm công việc** 🔍
- 🔹 **Giao diện hỗ trợ Dark Mode** 🌙
- 🔹 **Sử dụng BloC để quản lý state** ⚡

---
### 📩 Liên hệ
Nếu công ty có bất kỳ câu hỏi nào đó, có thể liên hệ qua email **ducvuglotec@gmail.com**. Cảm ơn! 😊

