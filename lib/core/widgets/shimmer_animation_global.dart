import 'package:burning_bros_interview/core/enums/shimmer_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAnimationGlobal extends StatelessWidget {
  final bool isLoading;
  final ShimmerType type;
  final int itemCount;
  final Widget? child;
  final double? radius;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final Color? borderColor;
  final double? borderWidth;
  final String? bgImage;
  final double avatarSize;
  final double titleWidth;
  final double descWidth;
  final double titleHeight;
  final double descHeight;

  const ShimmerAnimationGlobal({
    super.key,
    required this.isLoading,
    required this.type,
    required this.itemCount,
    this.child,
    this.radius,
    this.padding,
    this.backgroundColor,
    this.borderColor,
    this.borderWidth,
    this.bgImage,
    this.avatarSize = 48,
    this.titleWidth = 150,
    this.descWidth = 200,
    this.titleHeight = 16,
    this.descHeight = 14,
  });

  @override
  Widget build(BuildContext context) {
    return !isLoading
        ? child ?? const SizedBox.shrink()
        : ListView.separated(
          itemCount: itemCount,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          separatorBuilder: (c, i) => const SizedBox(height: 16),
          itemBuilder: (__, index) {
            if (type == ShimmerType.product) {
              return buildProductShimmerEffect(context);
            }
            return const SizedBox.shrink();
          },
        );
  }

  Widget buildProductShimmerEffect(BuildContext context) {
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
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 1500),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Thumbnail shimmer
            Container(
              width: 124,
              height: 124,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            const SizedBox(width: 8),
            // Right content shimmer
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title shimmer
                  Container(
                    height: 14,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Price shimmer
                  Container(
                    height: 12,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Rating shimmer
                  Container(
                    height: 12,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Description shimmer
                  Container(
                    height: 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    height: 12,
                    width: 150,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Button shimmer
                  Container(
                    height: 32,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
