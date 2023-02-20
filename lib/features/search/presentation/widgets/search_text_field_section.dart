import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';
import 'custom_search_text_field.dart';
import 'filter_selection_viewer.dart';

class SearchTextFieldSection extends StatelessWidget {
  const SearchTextFieldSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CloseButton(),
            const Expanded(
              child: CustomSearchTextField(),
            ),
            IconButton(
              onPressed: () => context.read<SearchBloc>().add(
                    ChangeFilterSelectionVisibility(),
                  ),
              icon: const Icon(Icons.filter_list),
            ),
          ],
        ),
        const FilterSelectionViewer(),
      ],
    );
  }
}
