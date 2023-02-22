import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../bloc/search_bloc.dart';
import '../../data/models/search_model.dart';

class FilterOptionChip extends StatelessWidget {
  const FilterOptionChip({super.key, required this.filterOption});

  final SearchFilterOption filterOption;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return current is SearchOptionsChanged;
      },
      builder: (context, state) {
        var searchBloc = context.read<SearchBloc>();
        return ChoiceChip(
          label: Text(filterOption.getValue()),
          selected: _checkFilterValueSelection(
            filterOption,
            searchBloc.searchModel,
          ),
          selectedColor: AppColors.primaryColor,
          onSelected: (value) => _onFilterOptionSelected(searchBloc),
        );
      },
    );
  }

  void _onFilterOptionSelected(SearchBloc searchBloc) {
    if (filterOption.getValue() == searchBloc.searchModel.filterOption) {
      searchBloc.add(
        ChangeSearchFilterOption(searchBloc.searchModel.copyWith(
          filterOption: '',
        )),
      );
    } else {
      searchBloc.add(
        ChangeSearchFilterOption(searchBloc.searchModel.copyWith(
          filterOption: filterOption.getValue(),
        )),
      );
    }
  }

  _checkFilterValueSelection(
    SearchFilterOption filterOption,
    SearchModel searchModel,
  ) {
    return searchModel.filterOption == filterOption.getValue();
  }
}
