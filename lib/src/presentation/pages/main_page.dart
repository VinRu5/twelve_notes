import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsRouter(
        routes: const [
          HomeRoute(),
          LibraryRoute(),
          SearchRoute(),
        ],
        transitionBuilder: (context, child, animation) => FadeTransition(
          opacity: animation,
          // the passed child is technically our animated selected-tab page
          child: child,
        ),
        builder: (context, child) {
          final tabsRouter = AutoTabsRouter.of(context);

          return Scaffold(
            appBar: _MainAppBar(
              activeIndex: tabsRouter.activeIndex,
            ),
            body: child,
            bottomSheet: _TwelveBottomBar(
              activeIndex: tabsRouter.activeIndex,
              icons: const [
                FontAwesomeIcons.houseChimney,
                FontAwesomeIcons.book,
                FontAwesomeIcons.magnifyingGlass,
              ],
              onChanged: (activeIndex) {
                tabsRouter.setActiveIndex(activeIndex);
              },
            ),
          );
        },
      );
}

class _TwelveBottomBar extends StatelessWidget {
  final List<IconData> icons;
  final int activeIndex;
  final Function(int activeIndex) onChanged;

  const _TwelveBottomBar({
    required this.icons,
    required this.activeIndex,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Card(
          color: context.isLightMode ? TwelveColors.bgDark : TwelveColors.bgLight,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 24.0,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: icons
                  .asMap()
                  .entries
                  .map<Widget>(
                    (icon) => _NavigationButton(
                      icon: icon.value,
                      onPressed: () => onChanged(icon.key),
                      selected: activeIndex == icon.key,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      );
}

class _NavigationButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final bool selected;

  const _NavigationButton({
    required this.icon,
    required this.onPressed,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(
          16.0,
        ),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 16.0,
          ),
          decoration: BoxDecoration(
            color: selected ? TwelveColors.primary.withAlpha(80) : Colors.transparent,
            borderRadius: BorderRadiusDirectional.circular(
              16.0,
            ),
          ),
          child: FaIcon(
            icon,
            size: 18.0,
            color: selected
                ? context.colorScheme.primary
                : context.isLightMode
                    ? TwelveColors.textDark.withAlpha(150)
                    : TwelveColors.textLight.withAlpha(150),
          ),
        ),
      );
}

class _MainAppBar extends StatelessWidget implements PreferredSize {
  final int activeIndex;

  const _MainAppBar({
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) => AppBar(
        centerTitle: false,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: CircleAvatar(),
        ),
        title: Text(
          switch (activeIndex) {
            0 => context.appStrings.homeTitlePage,
            1 => context.appStrings.libraryTitlePage,
            2 => context.appStrings.searchTitlePage,
            _ => throw UnimplementedError(),
          },
          style: context.twelveStyle?.headlineMedium,
        ),
      );

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
