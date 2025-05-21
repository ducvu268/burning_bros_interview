import 'package:burning_bros_interview/core/services/api_service.dart';
import 'package:burning_bros_interview/core/services/wishlist_service.dart';
import 'package:burning_bros_interview/features/products/domain/models/product_model.dart';
import 'package:burning_bros_interview/features/products/domain/repositories/product_repository.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductRepository)
class ProductRepositoryImpl extends ProductRepository {
  final ApiService apiService;
  final WishlistService wishlistService;

  final Logger _logger = Logger();

  ProductRepositoryImpl({
    required this.apiService,
    required this.wishlistService,
  });

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
      final favoriteIds = await wishlistService.getIds();

      if (response.statusCode == 200) {
        List<dynamic> allProducts = response.data['products'];
        return allProducts
            .map<ProductModel>((json) => ProductModel.fromJson(json))
            .map(
              (product) => product.copyWith(
                isFavorite: favoriteIds.contains(product.id),
              ),
            )
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
      final favoriteIds = await wishlistService.getIds();

      if (response.statusCode == 200) {
        List<dynamic> allProducts = response.data['products'];
        return allProducts
            .map<ProductModel>((json) => ProductModel.fromJson(json))
            .map(
              (product) => product.copyWith(
                isFavorite: favoriteIds.contains(product.id),
              ),
            )
            .toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      _logger.e('Error searching products: $e');
      rethrow;
    }
  }

  @override
  Future<List<ProductModel>> getFavorites() async {
    try {
      return await wishlistService.getAll();
    } catch (e) {
      _logger.e('Error fetching favorites: $e');
      rethrow;
    }
  }

  @override
  Future<void> toggleFavorite(ProductModel product) async {
    try {
      if (product.isFavorite) {
        await wishlistService.remove(product.id);
      } else {
        await wishlistService.add(product);
      }
    } catch (e) {
      _logger.e('Error toggling favorite: $e');
      rethrow;
    }
  }
}
