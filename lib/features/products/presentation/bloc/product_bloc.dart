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
    on<SearchProducts>(onSearchProducts);
  }

  Future<void> onLoadProducts(
    LoadProductsEvent event,
    Emitter<ProductState> emit,
  ) async {
    if (!await ConnectivityCheckerUtil().isConnected()) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
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

      emit(
        state.copyWith(
          status: ProductStatus.success,
          products: products,
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
    if (state.hasReachedMax || state.status == ProductStatus.loading) return;

    if (!await ConnectivityCheckerUtil().isConnected()) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          errorMessage: 'No internet connection',
        ),
      );
      return;
    }

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
        emit(
          state.copyWith(
            products: [...state.products, ...newProducts],
            hasReachedMax: newProducts.length < ConstantsApp.pageSize,
            currentOffset: state.currentOffset + newProducts.length,
            errorMessage: '',
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
          errorMessage: 'Failed to load more products: ${e.toString()}',
        ),
      );
    }
  }

  Future<void> onSearchProducts(
    SearchProducts event,
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
}
