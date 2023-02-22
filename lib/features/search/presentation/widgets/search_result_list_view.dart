import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions.dart';
import '../../../../core/widgets/book_shimmer.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../home/presentation/widgets/featured_book_item.dart';
import '../bloc/search_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.screenHeight * 0.3,
      child: BlocBuilder<SearchBloc, SearchState>(
        buildWhen: (previous, current) {
          if (current is SearchResultLoading ||
              current is SearchResultLoadingSuccess ||
              current is SearchResultLoadingFailed) {
            return true;
          }
          return false;
        },
        builder: (context, state) {
          if (state is SearchResultLoadingSuccess) {
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: FeaturedBookItem(
                  isClickable: true,
                  book: state.books[index],
                ),
              ),
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
            );
          } else if (state is SearchResultLoadingFailed) {
            return CustomErrorWidget(message: state.message);
          } else {
            return ListView.builder(
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: AspectRatio(
                  aspectRatio: 2.6 / 4,
                  child: BookShimmer(),
                ),
              ),
              itemCount: 10,
              scrollDirection: Axis.horizontal,
            );
          }
        },
      ),
    );
  }
}
