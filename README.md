# Hướng Dẫn Thiết Lập Ứng Dụng DeeplinkCatcher

## Yêu cầu hệ thống

- Flutter SDK (>=3.x.x)
- Dart SDK
- Android Studio hoặc VS Code
- Thiết bị Android/iOS hoặc trình giả lập

## Các bước thiết lập

### 1. Clone dự án

```bash
git clone https://github.com/your-username/DeeplinkCatcher.git
cd DeeplinkCatcher
```

### 2. Cài đặt các package phụ thuộc

```bash
flutter pub get
```

### 3. Chạy ứng dụng

- **Android:**

    ```bash
    flutter run
    ```

- **iOS:**  
    Đảm bảo đã cài đặt CocoaPods, sau đó:

    ```bash
    cd ios
    pod install
    cd ..
    flutter run
    ```

### 4. Thiết lập deeplink (tuỳ chọn)

- Cấu hình deeplink trong `AndroidManifest.xml` và `Info.plist` theo tài liệu Flutter.

## Kiểm tra Deeplink ứng dụng bất kỳ
```bash
adb shell dumpsys package <package-name>
```

## Tham khảo

- [Tài liệu Flutter](https://flutter.dev/docs)
- [Hướng dẫn cấu hình deeplink](https://docs.flutter.dev/development/ui/navigation/deep-linking)
