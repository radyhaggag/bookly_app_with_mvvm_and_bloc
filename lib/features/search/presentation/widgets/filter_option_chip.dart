import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bookly_app/core/utils/extensions.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../bloc/search_bloc.dart';
import '../search_params.dart';

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
        return ChoiceChip(
          label: Text(filterOption.getValue()),
          selected: _checkFilterValueSelection(
            filterOption,
            context.read<SearchBloc>().searchParams,
          ),
          selectedColor: AppColors.primaryColor,
          onSelected: (value) {
            context.read<SearchBloc>().add(
                  ChangeSearchFilterOption(
                      context.read<SearchBloc>().searchParams.copyWith(
                            searchFilterOption: filterOption,
                          )),
                );
          },
        );
      },
    );
  }

  _checkFilterValueSelection(
    SearchFilterOption filterOption,
    SearchParams searchParams,
  ) {
    return searchParams.searchFilterOption == filterOption;
  }
}
