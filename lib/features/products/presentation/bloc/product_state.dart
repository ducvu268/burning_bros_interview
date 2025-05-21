part of 'product_bloc.dart';

enum ProductStatus { initial, loading, success, failure }

class ProductState extends Equatable {
  final List<ProductModel> products;
  final ProductStatus status;
  final String errorMessage;
  final bool hasReachedMax;
  final int currentOffset;
  final String currentQuery;
  final bool isSearching;

  const ProductState({
    this.products = const [],
    this.status = ProductStatus.initial,
    this.errorMessage = '',
    this.hasReachedMax = false,
    this.currentOffset = 0,
    this.currentQuery = '',
    this.isSearching = false,
  });

  ProductState copyWith({
    List<ProductModel>? products,
    ProductStatus? status,
    String? errorMessage,
    bool? hasReachedMax,
    int? currentOffset,
    String? currentQuery,
    bool? isSearching,
  }) {
    return ProductState(
      products: products ?? this.products,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      currentOffset: currentOffset ?? this.currentOffset,
      currentQuery: currentQuery ?? this.currentQuery,
      isSearching: isSearching ?? this.isSearching,
    );
  }

  @override
  List<Object?> get props => [
    products,
    status,
    errorMessage,
    hasReachedMax,
    currentOffset,
    currentQuery,
    isSearching,
  ];
}
