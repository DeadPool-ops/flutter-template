import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/theme/app_colors.dart';

class SkeletonLoader extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry? borderRadius;

  const SkeletonLoader({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
  });

  const SkeletonLoader.line({
    super.key,
    this.width = double.infinity,
    this.height = 16,
    this.borderRadius,
  });

  const SkeletonLoader.circle({
    super.key,
    double size = 48,
  })  : width = size,
        height = size,
        borderRadius = const BorderRadius.all(Radius.circular(9999));

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.border,
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.border,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
        ),
      ),
    );
  }
}

/// A pre-built card skeleton for list items
class CardSkeletonLoader extends StatelessWidget {
  const CardSkeletonLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SkeletonLoader.circle(size: 40),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SkeletonLoader.line(width: 120, height: 14),
                      const SizedBox(height: 6),
                      SkeletonLoader.line(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: 12,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SkeletonLoader.line(height: 12),
            const SizedBox(height: 8),
            const SkeletonLoader.line(height: 12),
            const SizedBox(height: 8),
            const SkeletonLoader.line(width: 200, height: 12),
          ],
        ),
      ),
    );
  }
}
