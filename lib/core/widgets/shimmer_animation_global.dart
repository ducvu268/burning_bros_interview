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
      padding: padding ?? const EdgeInsets.all(16.0),
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor ?? Colors.transparent,
          width: borderWidth ?? 1,
        ),
        borderRadius: BorderRadius.circular(radius ?? 24),
        color: Colors.white,
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        period: const Duration(milliseconds: 1500),
        child: Row(
          children: [
            // Avatar shimmer
            Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              period: const Duration(milliseconds: 1500),
              child: Container(
                width: avatarSize,
                height: avatarSize,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title shimmer
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  period: const Duration(milliseconds: 1500),
                  child: Container(
                    width: titleWidth,
                    height: titleHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                // Description shimmer
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  period: const Duration(milliseconds: 1500),
                  child: Container(
                    width: descWidth,
                    height: descHeight,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
