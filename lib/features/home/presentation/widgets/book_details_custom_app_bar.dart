import 'package:bookly_app/core/config/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class BookDetailsCustomAppBar extends StatelessWidget {
  const BookDetailsCustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => GoRouter.of(context).pop(),
          icon: const Icon(Icons.close),
        ),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.searchView);
          },
          icon: const Icon(FontAwesomeIcons.magnifyingGlass),
        ),
      ],
    );
  }
}
