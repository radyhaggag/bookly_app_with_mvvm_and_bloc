import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions.dart';

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
        var searchBloc = context.read<SearchBloc>();
        return ChoiceChip(
          label: Text(sortOption.getValue()),
          selected: _checkSortingValueSelection(
            sortOption,
            searchBloc.searchModel,
          ),
          selectedColor: AppColors.primaryColor,
          onSelected: (value) => _onSortOptionSelected(searchBloc),
        );
      },
    );
  }

  void _onSortOptionSelected(SearchBloc searchBloc) {
    if (searchBloc.searchModel.sortOption == sortOption.getValue()) {
      searchBloc.add(
        ChangeSearchFilterOption(searchBloc.searchModel.copyWith(
          sortOption: '',
        )),
      );
    } else {
      searchBloc.add(
        ChangeSearchFilterOption(searchBloc.searchModel.copyWith(
          sortOption: sortOption.getValue(),
        )),
      );
    }
  }

  _checkSortingValueSelection(
    SearchSortingOption sortingOption,
    SearchModel searchModel,
  ) {
    return searchModel.sortOption == sortingOption.getValue();
  }
}
