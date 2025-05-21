import 'package:burning_bros_interview/features/products/domain/models/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts({
    int limit = 20,
    int offset = 0,
  });

  Future<List<ProductModel>> searchProducts(String query);
}
