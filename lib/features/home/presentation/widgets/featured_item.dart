import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.red,
          image: const DecorationImage(
            image: AssetImage(AppAssets.testImage),
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
