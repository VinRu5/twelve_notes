import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:twelve_notes/src/home/domain/repositories/home_repository.dart';
import 'package:twelve_notes/src/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:twelve_notes/src/home/presentation/blocs/home_search_bloc/home_search_bloc.dart';
import 'package:twelve_notes/src/home/presentation/widgets/home_content.dart';
import 'package:twelve_notes/src/home/presentation/widgets/home_search_bar.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/presentation/widgets/loader.dart';
import 'package:twelve_notes/src/presentation/widgets/twelve_app_bar.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              homeRepository: context.read<HomeRepository>(),
            )..fetchData(),
          ),
          BlocProvider(
            create: (context) => HomeSearchBloc(
              homeRepository: context.read<HomeRepository>(),
            ),
          ),
        ],
        child: this,
      );

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: TwelveAppBar(
          title: context.appStrings.homeTitlePage,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: const HomeSearchBar(),
            ),
            Expanded(
              child: BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) => switch (state) {
                  HomeInitial() => const SizedBox.shrink(),
                  HomeLoading() => const Loader(),
                  HomeLoaded(:final artists, :final songs) => HomeContent(
                      artists: artists,
                      songs: songs,
                    ),
                  HomeError(:final message) => Center(
                      child: Text('Error: $message'),
                    ),
                  HomeEmpty() => const Center(
                      child: Text('No data available'),
                    ),
                },
              ),
            ),
          ],
        ),
      );
}
