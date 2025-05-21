part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadProductsEvent extends ProductEvent {}

class LoadMoreProductsEvent extends ProductEvent {}

class SearchProductsEvent extends ProductEvent {
  final String query;

  SearchProductsEvent(this.query);

  @override
  List<Object?> get props => [query];
}

class ToggleFavoriteEvent extends ProductEvent {
  final ProductModel product;

  ToggleFavoriteEvent(this.product);

  @override
  List<Object?> get props => [product];
}