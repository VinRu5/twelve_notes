import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:twelve_notes/src/presentation/widgets/navigation_fab_menu.dart';
import 'package:twelve_notes/src/router/app_router.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsRouter(
        routes: const [
          HomeTabRoute(),
          LibraryTabRoute(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          // the passed child is technically our animated selected-tab page
          child: child,
        ),
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            body: child,
            floatingActionButton: NavigationFabMenu(
              activeIndex: tabsRouter.activeIndex,
              onChanged: tabsRouter.setActiveIndex,
            ),
          );
        },
      );
}
