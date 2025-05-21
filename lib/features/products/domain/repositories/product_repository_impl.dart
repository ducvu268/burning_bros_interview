import 'package:burning_bros_interview/core/services/api_service.dart';
import 'package:burning_bros_interview/features/products/domain/models/product_model.dart';
import 'package:burning_bros_interview/features/products/domain/repositories/product_repository.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  final ApiService apiService;
  final Logger _logger = Logger();

  ProductRepositoryImpl({required this.apiService});

  @override
  Future<List<ProductModel>> getProducts({
    int limit = 20,
    int offset = 0,
  }) async {
    try {
      final response = await apiService.get(
        '/products',
        params: {'limit': limit, 'skip': offset},
      );

      if (response.statusCode == 200) {
        List<dynamic> allProducts = response.data['products'];
        return allProducts
            .map<ProductModel>((json) => ProductModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      _logger.e('Error fetching products: $e');
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> searchProducts(String query) async {
    try {
      final response = await apiService.get(
        '/products/search',
        params: {'q': query},
      );
      return response.data
          .map<ProductModel>((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      _logger.e('Error searching products: $e');
      rethrow;
    }
  }
  // Future<void> toggleFavorite(ProductModel product) async {
  //   if (product.isFavorite) {
  //     await _favoriteService.removeFavorite(product.id);
  //   } else {
  //     await _favoriteService.addFavorite(product);
  //   }
  // }

  // Future<List<Product>> getFavorites() async {
  //   return await _favoriteService.getFavorites();
  // }
}
