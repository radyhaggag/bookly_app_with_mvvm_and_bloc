import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/config/app_router.dart';
import '../../../../core/utils/app_assets.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({super.key, required this.isClickable});

  final bool isClickable;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isClickable
          ? () => GoRouter.of(context).push(AppRouter.bookDetailsView)
          : null,
      child: AspectRatio(
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
      ),
    );
  }
}
