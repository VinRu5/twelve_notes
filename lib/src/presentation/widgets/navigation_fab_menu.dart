import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twelve_notes/src/misc/app_localization_extension.dart';
import 'package:twelve_notes/src/presentation/widgets/ink_well_transparent.dart';
import 'package:twelve_notes/src/theme/extension_theme.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';

class NavigationFabMenu extends StatefulWidget {
  final int activeIndex;
  final ValueChanged<int> onChanged;

  const NavigationFabMenu({
    super.key,
    required this.activeIndex,
    required this.onChanged,
  });

  @override
  State<NavigationFabMenu> createState() => _NavigationFabMenuState();
}

class _NavigationFabMenuState extends State<NavigationFabMenu> {
  static const _animationDuration = Duration(milliseconds: 240);
  static const _fabSize = 66.0;
  static const _fabRadius = _fabSize / 2;

  bool _isOpen = false;

  @override
  Widget build(BuildContext context) => Material(
        color: Colors.transparent,
        child: AnimatedContainer(
          duration: _animationDuration,
          curve: Curves.easeOutCubic,
          width: _fabSize,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            color: _isOpen
                ? context.isLightMode
                    ? TwelveColors.bgDark
                    : TwelveColors.bgLight
                : context.colorScheme.primary,
            borderRadius: BorderRadius.circular(_fabRadius),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(_isOpen ? 45 : 35),
                blurRadius: _isOpen ? 18.0 : 14.0,
                offset: Offset(0, _isOpen ? 8 : 6),
              ),
            ],
          ),
          child: AnimatedSize(
            duration: _animationDuration,
            curve: Curves.easeOutCubic,
            alignment: Alignment.bottomCenter,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              switchInCurve: Curves.easeOut,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) => FadeTransition(
                opacity: animation,
                child: ScaleTransition(
                  alignment: Alignment.bottomCenter,
                  scale: animation,
                  child: child,
                ),
              ),
              child: _isOpen
                  ? _MenuContent(
                      key: const ValueKey('navigation-fab-menu-open'),
                      activeIndex: widget.activeIndex,
                      destinations: _destinations(context),
                      onClose: _closeMenu,
                      onChanged: _selectDestination,
                    )
                  : _ClosedFabContent(
                      key: const ValueKey('navigation-fab-menu-closed'),
                      icon: _selectedIcon,
                      onTap: _openMenu,
                    ),
            ),
          ),
        ),
      );

  IconData get _selectedIcon =>
      widget.activeIndex == 1 ? FontAwesomeIcons.book : FontAwesomeIcons.houseChimney;

  List<_NavigationFabDestination> _destinations(BuildContext context) => [
        _NavigationFabDestination(
          index: 0,
          icon: FontAwesomeIcons.houseChimney,
          label: context.appStrings.homeTitlePage,
        ),
        _NavigationFabDestination(
          index: 1,
          icon: FontAwesomeIcons.book,
          label: context.appStrings.libraryTitlePage,
        ),
      ];

  void _openMenu() {
    if (_isOpen) {
      return;
    }

    setState(() => _isOpen = true);
  }

  void _closeMenu() {
    if (!_isOpen) {
      return;
    }

    setState(() => _isOpen = false);
  }

  void _selectDestination(int index) {
    _closeMenu();

    if (!mounted || index == widget.activeIndex) {
      return;
    }

    widget.onChanged(index);
  }
}

class _MenuContent extends StatelessWidget {
  final int activeIndex;
  final List<_NavigationFabDestination> destinations;
  final VoidCallback onClose;
  final ValueChanged<int> onChanged;

  const _MenuContent({
    super.key,
    required this.activeIndex,
    required this.destinations,
    required this.onClose,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ...destinations.map(
              (destination) => _NavigationFabItem(
                destination: destination,
                selected: activeIndex == destination.index,
                onTap: () => onChanged(destination.index),
              ),
            ),
            const SizedBox(height: 4.0),
            _OpenFabAction(
              icon: FontAwesomeIcons.xmark,
              onTap: onClose,
            ),
          ],
        ),
      );
}

class _NavigationFabItem extends StatelessWidget {
  final _NavigationFabDestination destination;
  final bool selected;
  final VoidCallback onTap;

  const _NavigationFabItem({
    required this.destination,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final foregroundColor = selected
        ? context.colorScheme.primary
        : context.isLightMode
            ? TwelveColors.textDark.withAlpha(190)
            : TwelveColors.textLight.withAlpha(190);

    return InkWellTransparent(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOut,
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 6.0),
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: selected ? TwelveColors.primary.withAlpha(60) : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              destination.icon,
              size: 20.0,
              color: foregroundColor,
            ),
            const SizedBox(height: 4.0),
            Text(
              destination.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: context.twelveStyle?.labelSmall.copyWith(
                color: foregroundColor,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ClosedFabContent extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _ClosedFabContent({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWellTransparent(
        onTap: onTap,
        child: SizedBox(
          width: _NavigationFabMenuState._fabSize,
          height: _NavigationFabMenuState._fabSize,
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              switchInCurve: Curves.easeOutBack,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: .25, end: 1).animate(animation),
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              ),
              child: FaIcon(
                icon,
                key: ValueKey(icon),
                size: 28.0,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      );
}

class _OpenFabAction extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _OpenFabAction({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => InkWellTransparent(
        onTap: onTap,
        child: Container(
          width: _NavigationFabMenuState._fabSize,
          height: _NavigationFabMenuState._fabSize,
          decoration: BoxDecoration(
            color: context.colorScheme.primary,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 180),
              switchInCurve: Curves.easeOutBack,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) => RotationTransition(
                turns: Tween<double>(begin: .25, end: 1).animate(animation),
                child: ScaleTransition(
                  scale: animation,
                  child: child,
                ),
              ),
              child: FaIcon(
                icon,
                key: ValueKey(icon),
                size: 26.0,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ),
        ),
      );
}

class _NavigationFabDestination {
  final int index;
  final IconData icon;
  final String label;

  const _NavigationFabDestination({
    required this.index,
    required this.icon,
    required this.label,
  });
}
