import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:twelve_notes/l10n/app_localizations.dart';
import 'package:twelve_notes/src/presentation/widgets/navigation_fab_menu.dart';

void main() {
  Widget buildSubject({
    required int activeIndex,
    required ValueChanged<int> onChanged,
  }) =>
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          floatingActionButton: NavigationFabMenu(
            activeIndex: activeIndex,
            onChanged: onChanged,
          ),
        ),
      );

  testWidgets('opens the menu and navigates to library', (tester) async {
    var activeIndex = 0;
    int? selectedIndex;

    await tester.pumpWidget(
      StatefulBuilder(
        builder: (context, setState) => buildSubject(
          activeIndex: activeIndex,
          onChanged: (index) {
            selectedIndex = index;
            setState(() => activeIndex = index);
          },
        ),
      ),
    );

    expect(find.text('Home'), findsNothing);
    expect(find.text('Library'), findsNothing);

    await tester.tap(find.byType(NavigationFabMenu));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Library'), findsOneWidget);

    await tester.tap(find.text('Library'));
    await tester.pumpAndSettle();

    expect(selectedIndex, 1);
    expect(find.text('Home'), findsNothing);
    expect(find.text('Library'), findsNothing);
  });

  testWidgets('keeps the menu open on outside tap without navigation',
      (tester) async {
    int? selectedIndex;

    await tester.pumpWidget(
      buildSubject(
        activeIndex: 0,
        onChanged: (index) => selectedIndex = index,
      ),
    );

    await tester.tap(find.byType(NavigationFabMenu));
    await tester.pumpAndSettle();

    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Library'), findsOneWidget);

    await tester.tapAt(const Offset(10, 10));
    await tester.pumpAndSettle();

    expect(selectedIndex, isNull);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Library'), findsOneWidget);
  });
}
