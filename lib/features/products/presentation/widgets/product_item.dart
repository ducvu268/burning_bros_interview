import 'package:burning_bros_interview/core/themes/app_color.dart';
import 'package:burning_bros_interview/features/products/domain/models/product_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  final IconData icon;
  final bool isShowIcon;
  final Function(ProductModel) onToggleFavorite;

  const ProductItem({
    super.key,
    required this.product,
    required this.icon,
    this.isShowIcon = true,
    required this.onToggleFavorite,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 12,
            spreadRadius: 12,
            color: Colors.black.withOpacity(.05),
            offset: const Offset(1, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CachedNetworkImage(
            imageUrl: product.thumbnail ?? '',
            width: 124,
            height: 124,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text(
                  product.title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                    fontFamily: 'Inter',
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                const SizedBox(height: 6),

                /// PRICE
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.price_change,
                      color: Colors.black,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      '${product.price.toString()}\$',
                      style: const TextStyle(
                        color: AppColors.contentColorGreen2,
                        fontWeight: FontWeight.w600,
                        fontSize: 13,
                        fontFamily: 'Inter',
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 1,
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                /// RATING
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        product.rating.toString(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          fontFamily: 'Inter',
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                /// DESCRIPTION
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(
                      Icons.description_outlined,
                      color: Colors.black,
                      size: 16,
                    ),
                    const SizedBox(width: 6),
                    Expanded(
                      child: Text(
                        product.description ?? '',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 10,
                          fontFamily: 'Inter',
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                /// ADD TO WISHLIST
                !isShowIcon
                    ? const SizedBox.shrink()
                    : IconButton(
                      onPressed: () => onToggleFavorite(product),
                      icon: Icon(icon, color: AppColors.contentColorRed),
                      iconSize: 24,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
