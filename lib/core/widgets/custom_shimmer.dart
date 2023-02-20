import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({
    super.key,
    this.width,
    this.height,
    this.radius,
  });
  final double? width;
  final double? height;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.white.withOpacity(.5),
      highlightColor: Colors.white.withOpacity(.45),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: radius == null ? null : BorderRadius.circular(radius!),
          color: Colors.white,
        ),
      ),
    );
  }
}
