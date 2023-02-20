import 'package:flutter/material.dart';

import '../../../../core/utils/constants.dart';
import 'newest_section.dart';
import 'featured_items_list_view.dart';
import 'home_view_custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: kMainHorizontalPadding,
              ),
              child: HomeViewCustomAppBar(),
            ),
            FeaturedItemsListView(),
            SizedBox(height: 50),
            NewestSection(),
          ],
        ));
  }
}
