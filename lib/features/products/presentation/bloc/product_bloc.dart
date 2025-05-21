import 'package:bloc/bloc.dart';
import 'package:burning_bros_interview/core/constants/constants.dart';
import 'package:burning_bros_interview/core/utils/connectivity_checker_util.dart';
import 'package:burning_bros_interview/features/products/domain/models/product_model.dart';
import 'package:burning_bros_interview/features/products/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'product_event.dart';
part 'product_state.dart';

@injectable
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc({required this.repository}) : super(ProductState()) {
    on<LoadProductsEvent>(onLoadProducts);
    on<LoadMoreProductsEvent>(onLoadMoreProducts);
    on<SearchProductsEvent>(onSearchProducts);
    on<ToggleFavoriteEvent>(onToggleFavorite);
  }

  Future<void> onLoadProducts(
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (!await ConnectivityCheckerUtil().isConnected()) {
      final productsFavorite = await repository.getFavorites();
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          productsFavorite: productsFavorite,
          errorMessage: 'No internet connection',
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        status: ProductStatus.loading,
        isSearching: false,
        currentQuery: '',
      ),
    );

    try {
      final products = await repository.getProducts(
        limit: ConstantsApp.pageSize,
        offset: 0,
      );
      final productsFavorite = await repository.getFavorites();
      emit(
        state.copyWith(
          status: ProductStatus.success,
          products: products,
          productsFavorite: productsFavorite,
          hasReachedMax: products.length < ConstantsApp.pageSize,
          currentOffset: products.length,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          errorMessage: 'Failed to load products: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> onLoadMoreProducts(
    LoadMoreProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (state.hasReachedMax || state.isLoading) return;

    if (!await ConnectivityCheckerUtil().isConnected()) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          errorMessage: 'No internet connection',
        ),
      );
      return;
    }

    emit(state.copyWith(isLoading: true));

    try {
      List<ProductModel> newProducts;

      if (state.isSearching && state.currentQuery.isNotEmpty) {
        emit(state.copyWith(hasReachedMax: true));
        return;
      } else {
        newProducts = await repository.getProducts(
          limit: ConstantsApp.pageSize,
          offset: state.currentOffset,
        );
      }

      if (newProducts.isEmpty) {
        emit(state.copyWith(hasReachedMax: true));
      } else {
        print('--------------------------------');
        print('newProducts: ${newProducts.length}');
        print('state.products: ${state.products.length}');
        print('state.currentOffset: ${state.currentOffset}');
        print('--------------------------------');

        emit(
          state.copyWith(
            status: ProductStatus.success,
            products: [...state.products, ...newProducts],
            hasReachedMax: newProducts.length < ConstantsApp.pageSize,
            currentOffset: state.currentOffset + newProducts.length,
            errorMessage: '',
            isLoading: false,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          errorMessage: 'Failed to load more products: ${e.toString()}',
          isLoading: false,
        ),
      );
    }
  }

  Future<void> onSearchProducts(
    SearchProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    final query = event.query;
    if (!await ConnectivityCheckerUtil().isConnected()) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          errorMessage: 'No internet connection',
        ),
      );
      return;
    }

    if (query.isEmpty) {
      add(LoadProductsEvent());
      return;
    }

    emit(
      state.copyWith(
        status: ProductStatus.loading,
        isSearching: true,
        currentQuery: query,
      ),
    );

    try {
      final products = await repository.searchProducts(query);

      emit(
        state.copyWith(
          status: ProductStatus.success,
          products: products,
          hasReachedMax: true,
          errorMessage: '',
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          errorMessage: 'Failed to search products: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> onToggleFavorite(
    ToggleFavoriteEvent event,
    Emitter<ProductState> emit,
  ) async {
    try {
      final productSelected = event.product;
      await repository.toggleFavorite(productSelected);
      final updatedProductsFavorite = await repository.getFavorites();

      final updatedProducts =
          state.products
              .map(
                (p) =>
                    p.id == productSelected.id
                        ? p.copyWith(isFavorite: !productSelected.isFavorite)
                        : p,
              )
              .toList();
      emit(
        state.copyWith(
          status: ProductStatus.success,
          products: updatedProducts,
          productsFavorite: updatedProductsFavorite,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          errorMessage: 'Failed to toggle favorite: ${e.toString()}',
        ),
      );
    }
  }
}
