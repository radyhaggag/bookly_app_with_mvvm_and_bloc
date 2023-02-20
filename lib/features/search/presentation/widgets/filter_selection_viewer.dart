import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/search_bloc.dart';
import 'search_selection_options.dart';

class FilterSelectionViewer extends StatelessWidget {
  const FilterSelectionViewer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      buildWhen: (previous, current) {
        return current is FilterSelectionVisibilityChanged;
      },
      builder: (context, state) {
        return AnimatedCrossFade(
          firstChild: const SearchSelectionOptions(),
          secondChild: const SizedBox(),
          crossFadeState: _showCurrentFade(state),
          duration: const Duration(milliseconds: 500),
        );
      },
    );
  }

  CrossFadeState _showCurrentFade(SearchState state) {
    if (state is FilterSelectionVisibilityChanged && state.isVisible) {
      return CrossFadeState.showFirst;
    }
    return CrossFadeState.showSecond;
  }
}
