import 'package:burning_bros_interview/core/constants/hive_type_const.dart';
import 'package:burning_bros_interview/core/models/base_model.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@HiveType(typeId: HiveTypeConst.productType)
@JsonSerializable()
class ProductModel extends TModel {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String? description;
  @HiveField(2)
  final double price;
  @HiveField(3)
  final double discountPercentage;
  @HiveField(4)
  final double rating;
  @HiveField(5)
  final int stock;
  @HiveField(6)
  final String? brand;
  @HiveField(7)
  final String? category;
  @HiveField(8)
  final String? thumbnail;
  @HiveField(9)
  final List<String>? images;
  @HiveField(10)
  final bool isFavorite;

  ProductModel({
    required super.id,
    required this.title,
    required this.description,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.stock,
    required this.brand,
    required this.category,
    required this.thumbnail,
    required this.images,
    this.isFavorite = false,
  });

  ProductModel copyWith({
    int? id,
    String? title,
    String? description,
    double? price,
    double? discountPercentage,
    double? rating,
    int? stock,
    String? brand,
    String? category,
    String? thumbnail,
    List<String>? images,
    bool? isFavorite,
  }) {
    return ProductModel(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      discountPercentage: discountPercentage ?? this.discountPercentage,
      rating: rating ?? this.rating,
      stock: stock ?? this.stock,
      brand: brand ?? this.brand,
      category: category ?? this.category,
      thumbnail: thumbnail ?? this.thumbnail,
      images: images ?? this.images,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.empty() {
    return ProductModel(
      id: 0,
      title: '',
      description: '',
      price: 0,
      discountPercentage: 0,
      rating: 0,
      stock: 0,
      brand: '',
      category: '',
      thumbnail: '',
      images: [],
      isFavorite: false,
    );
  }

  @override
  String toString() {
    return 'ProductModel(id: $id, title: $title, description: $description, price: $price, discountPercentage: $discountPercentage, rating: $rating, stock: $stock, brand: $brand, category: $category, thumbnail: $thumbnail, images: $images, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return other is ProductModel &&
        other.id == id &&
        other.title == title &&
        other.description == description &&
        other.price == price &&
        other.discountPercentage == discountPercentage &&
        other.rating == rating &&
        other.stock == stock &&
        other.brand == brand &&
        other.category == category &&
        other.thumbnail == thumbnail &&
        other.images == images &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return Object.hash(
      id,
      title,
      description,
      price,
      discountPercentage,
      rating,
      stock,
      brand,
      category,
      thumbnail,
      images,
      isFavorite,
    );
  }
}
