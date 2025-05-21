// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/products/domain/repositories/product_repository.dart'
    as _i963;
import '../../features/products/domain/repositories/product_repository_impl.dart'
    as _i68;
import '../../features/products/presentation/bloc/product_bloc.dart' as _i28;
import '../services/api_service.dart' as _i137;
import '../services/local_storage_service.dart' as _i527;
import '../services/wishlist_service.dart' as _i203;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i137.ApiService>(() => _i137.ApiService());
    gh.lazySingleton<_i527.LocalStorageService>(
        () => _i527.LocalStorageService());
    gh.lazySingleton<_i203.WishlistService>(() => _i203.WishlistService());
    gh.factory<_i963.ProductRepository>(() => _i68.ProductRepositoryImpl(
          apiService: gh<_i137.ApiService>(),
          wishlistService: gh<_i203.WishlistService>(),
        ));
    gh.factory<_i28.ProductBloc>(
        () => _i28.ProductBloc(repository: gh<_i963.ProductRepository>()));
    return this;
  }
}
