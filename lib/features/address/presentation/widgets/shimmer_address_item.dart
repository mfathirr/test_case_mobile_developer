import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAddressItem extends StatelessWidget {
  const ShimmerAddressItem({
    super.key,
    this.margin = const EdgeInsets.symmetric(horizontal: 24),
    this.height = 120,
  });

  final EdgeInsetsGeometry margin;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: height,
        margin: margin,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
              offset: const Offset(0, 1),
            ),
          ],
        ),
      ),
    );
  }
}
