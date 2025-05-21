part of 'product_bloc.dart';

enum ProductStatus { initial, loading, success, failure }

class ProductState extends Equatable {
  final List<ProductModel> products;
  final List<ProductModel> productsFavorite;
  final ProductStatus status;
  final String errorMessage;
  final bool hasReachedMax;
  final int currentOffset;
  final String currentQuery;
  final bool isSearching;
  final bool isLoading;

  const ProductState({
    this.products = const [],
    this.productsFavorite = const [],
    this.status = ProductStatus.initial,
    this.errorMessage = '',
    this.hasReachedMax = false,
    this.currentOffset = 0,
    this.currentQuery = '',
    this.isSearching = false,
    this.isLoading = false,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    List<ProductModel>? productsFavorite,
    ProductStatus? status,
    String? errorMessage,
    bool? hasReachedMax,
    int? currentOffset,
    String? currentQuery,
    bool? isSearching,
    bool? isLoading,
  }) {
    return ProductState(
      products: products ?? this.products,
      productsFavorite: productsFavorite ?? this.productsFavorite,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentOffset: currentOffset ?? this.currentOffset,
      currentQuery: currentQuery ?? this.currentQuery,
      isSearching: isSearching ?? this.isSearching,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
    products,
    productsFavorite,
    status,
    errorMessage,
    hasReachedMax,
    currentOffset,
    currentQuery,
    isSearching,
    isLoading,
  ];
}
