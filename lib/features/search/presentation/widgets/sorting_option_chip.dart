import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookly_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../bloc/search_bloc.dart';
import '../../../../core/utils/params.dart';

class SortingOptionChip extends StatelessWidget {
  const SortingOptionChip({super.key, required this.sortingOption});

  final SearchSortingOption sortingOption;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return current is SearchOptionsChanged;
      },
      builder: (context, state) {
        return ChoiceChip(
          label: Text(sortingOption.getValue()),
          selected: _checkSortingValueSelection(
            sortingOption,
            context.read<SearchBloc>().searchParams,
          ),
          selectedColor: AppColors.primaryColor,
          onSelected: (value) {
            context.read<SearchBloc>().add(
                  ChangeSearchFilterOption(
                      context.read<SearchBloc>().searchParams.copyWith(
                            searchSortingOption: sortingOption,
                          )),
                );
          },
        );
      },
    );
  }

  _checkSortingValueSelection(
    SearchSortingOption sortingOption,
    SearchParams searchParams,
  ) {
    return searchParams.searchSortingOption == sortingOption;
  }
}
