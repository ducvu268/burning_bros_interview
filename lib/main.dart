import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:burning_bros_interview/app.dart';
import 'package:burning_bros_interview/core/di/injector.dart';
import 'package:burning_bros_interview/core/services/local_storage_service.dart';
import 'package:burning_bros_interview/features/products/domain/models/product_model.dart';
import 'package:burning_bros_interview/simple_bloc_observer.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    configureDependencies();
    await LocalStorageService.init();
    await _hideSystemUI();
    await initHive();

    Bloc.observer = SimpleBlocObserver();
    runApp(FlutterInterviewApp());
  }, (error, stack) {
    debugPrint('error in main = $error');
  });
}

Future<void> _hideSystemUI() async {
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.immersive,
  );
  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    if (systemOverlaysAreVisible) {
      await Future.delayed(const Duration(seconds: 3));
      SystemChrome.restoreSystemUIOverlays();
    }
  });
}

Future<void> initHive() async {
  final appDocumentsDir = await getApplicationDocumentsDirectory();
  Hive
    ..init(appDocumentsDir.path)
    ..registerAdapter(ProductModelAdapter());
}
