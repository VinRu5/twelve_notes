import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/presentation/blocs/nav_positioned_cubit.dart';
import 'package:twelve_notes/src/presentation/widgets/ink_well_transparent.dart';
import 'package:twelve_notes/src/router/app_router.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

@RoutePage()
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) => AutoTabsRouter(
        routes: const [
          HomeTabRoute(),
          LibraryTabRoute(),
          SearchTabRoute(),
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
  Widget build(BuildContext context) => BlocBuilder<NavPositionedCubit, NavPositionedState>(
        builder: (context, state) {
          return AnimatedSlide(
            duration: const Duration(milliseconds: 150),
            offset: state is ShowNavPositioned ? Offset.zero : Offset(Offset.zero.dx, 100),
            child: Padding(
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
            ),
          );
        },
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
  Widget build(BuildContext context) => InkWellTransparent(
        onTap: onPressed,
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
