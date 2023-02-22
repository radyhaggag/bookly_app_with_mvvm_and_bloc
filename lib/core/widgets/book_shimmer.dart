import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/custom_shimmer.dart';

class BookShimmer extends StatelessWidget {
  const BookShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          const AspectRatio(
            aspectRatio: 2.6 / 4,
            child: CustomShimmer(radius: 10),
          ),
          const SizedBox(width: 30),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomShimmer(
                  width: context.screenWidth * .5,
                  height: 25,
                  radius: 3,
                ),
                const SizedBox(height: 10),
                CustomShimmer(
                  width: context.screenWidth * .3,
                  height: 15,
                  radius: 3,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    CustomShimmer(
                      width: 70,
                      height: 15,
                      radius: 3,
                    ),
                    CustomShimmer(
                      width: 50,
                      height: 15,
                      radius: 3,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
