import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: AppStrings.searchAboutBookMessage,
        enabledBorder: _buildTextFieldBorder(),
        focusedBorder: _buildTextFieldBorder(),
        suffixIcon: IconButton(
          onPressed: () {},
          color: AppColors.whiteColor,
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ),
    );
  }

  OutlineInputBorder _buildTextFieldBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColors.whiteColor,
      ),
    );
  }
}
