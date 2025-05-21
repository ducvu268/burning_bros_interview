import 'dart:async';
import 'package:flutter/foundation.dart';

class DebouncerUtil {
  final int milliseconds;
  Timer? _timer;

  DebouncerUtil({required this.milliseconds});

  void run(VoidCallback action) {
    if (_timer?.isActive ?? false) {
      _timer?.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}