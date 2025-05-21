import 'package:burning_bros_interview/core/di/injector.dart';
import 'package:burning_bros_interview/features/products/domain/models/product_model.dart';
import 'package:burning_bros_interview/features/products/presentation/bloc/product_bloc.dart';
import 'package:burning_bros_interview/features/products/presentation/pages/favorite_screen.dart';
import 'package:burning_bros_interview/features/products/presentation/pages/products_screen.dart';
import 'package:burning_bros_interview/features/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoutes {
  static const String initialRoute = '/splash';
  static const String products = '/products';
  static const String favorite = '/favorite';

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case products:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => getIt<ProductBloc>(),
                child: const ProductsScreen(),
              ),
        );
      case favorite:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (_) => getIt<ProductBloc>(),
                child: const FavoriteScreen(),
              ),
        );

      default:
        return MaterialPageRoute(
          builder:
              (_) => const Scaffold(
                body: Center(child: Text('404 - Page Not Found')),
              ),
        );
    }
  }
}
