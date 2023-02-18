import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_text_button.dart';

class BookDetailsActions extends StatelessWidget {
  const BookDetailsActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: CustomTextButton(
              onPressed: () {},
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              backgroundColor: AppColors.whiteColor,
              text: "19.99 £",
              textColor: AppColors.blackColor,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: CustomTextButton(
              onPressed: () {},
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              backgroundColor: AppColors.orangeColor,
              text: 'Free preview',
              textColor: AppColors.whiteColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
