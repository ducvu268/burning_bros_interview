import 'package:burning_bros_interview/features/products/domain/models/product_model.dart';
import 'package:hive/hive.dart';
import 'package:logger/logger.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class WishlistService {
  static const String favoritesProductBoxName = 'favoritesProduct';
  late Box<ProductModel> favoritesProductBox;
  final Logger _logger = Logger();

  Future<void> initialize() async {
    favoritesProductBox = await Hive.openBox<ProductModel>(favoritesProductBoxName);
  }

  Future<void> add(ProductModel product) async {
    try {
      await initialize();
      await favoritesProductBox.put(
        product.id,
        product.copyWith(isFavorite: true),
      );
      _logger.d('Added product ${product.id} to favorites');
    } catch (e) {
      _logger.e('Error adding favorite: $e');
      rethrow;
    }
  }

  Future<void> remove(int productId) async {
    try {
      await initialize();
      await favoritesProductBox.delete(productId);
      _logger.d('Removed product $productId from favorites');
    } catch (e) {
      _logger.e('Error removing favorite: $e');
      rethrow;
    }
  }

  Future<List<int>> getIds() async {
    try {
      await initialize();
      return favoritesProductBox.keys.cast<int>().toList();
    } catch (e) {
      _logger.e('Error getting favorite IDs: $e');
      return [];
    }
  }

  Future<List<ProductModel>> getAll() async {
    try {
      await initialize();
      var data = favoritesProductBox.values.toList().reversed.toList();
      _logger.d('Favorites: $data');
      if (data.isEmpty) {
        return [];
      }
      return data;
    } catch (e) {
      _logger.e('Error getting favorites: $e');
      return [];
    }
  }

  Future<void> close() async {
    await initialize();
    await favoritesProductBox.close();
  }

  Future<void> clear() async {
    try {
      await initialize();
      await favoritesProductBox.clear();
      _logger.d('Cleared all favorites');
    } catch (e) {
      _logger.e('Error clearing favorites: $e');
      rethrow;
    }
  }
}
