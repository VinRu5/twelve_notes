import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twelve_notes/src/home/presentation/blocs/home_search_bloc/home_search_bloc.dart';
import 'package:twelve_notes/src/home/presentation/widgets/search_results_widget.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';

class HomeSearchBar extends StatefulWidget {
  const HomeSearchBar({super.key});

  @override
  State<HomeSearchBar> createState() => _HomeSearchBarState();
}

class _HomeSearchBarState extends State<HomeSearchBar> {
  final _searchController = SearchController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeSearchBloc>();

    return SearchAnchor(
      searchController: _searchController,
      isFullScreen: false,
      viewTrailing: [
        IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            _searchController.clear();
            _searchController.closeView(null);
            bloc.add(HomeSearchCleared());
          },
        ),
      ],
      builder: (context, controller) => SearchBar(
        controller: controller,
        onTap: () => controller.openView(),
        onChanged: (_) => controller.openView(),
        leading: const Icon(Icons.search),
        hintText: context.appStrings.searchHint,
      ),
      suggestionsBuilder: (context, controller) {
        final query = controller.text;
        if (query.isEmpty) {
          bloc.add(HomeSearchCleared());
        } else {
          bloc.add(HomeSearchQueryChanged(query: query));
        }
        return [
          BlocBuilder<HomeSearchBloc, HomeSearchState>(
            bloc: bloc,
            builder: (ctx, state) => SearchResultsWidget(state: state),
          ),
        ];
      },
    );
  }
}
