import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookly_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../bloc/search_bloc.dart';
import '../../data/models/search_model.dart';

class SortingOptionChip extends StatelessWidget {
  const SortingOptionChip({super.key, required this.sortOption});

  final SearchSortingOption sortOption;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return current is SearchOptionsChanged;
      },
      builder: (context, state) {
        return ChoiceChip(
          label: Text(sortOption.getValue()),
          selected: _checkSortingValueSelection(
            sortOption,
            context.read<SearchBloc>().searchModel,
          ),
          selectedColor: AppColors.primaryColor,
          onSelected: (value) {
            context.read<SearchBloc>().add(
                  ChangeSearchFilterOption(
                      context.read<SearchBloc>().searchModel.copyWith(
                            sortOption: sortOption.getValue(),
                          )),
                );
          },
        );
      },
    );
  }

  _checkSortingValueSelection(
    SearchSortingOption sortingOption,
    SearchModel searchParams,
  ) {
    return searchParams.sortOption == sortingOption.getValue();
  }
}
