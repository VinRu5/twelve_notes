import 'package:flutter/material.dart';
import 'package:twelve_notes/src/theme/twelve_colors.dart';
import 'package:twelve_notes/src/theme/twelve_typography.dart';

class MockupWidget extends StatefulWidget {
  const MockupWidget({super.key});

  @override
  State<MockupWidget> createState() => _MockupWidgetState();
}

class _MockupWidgetState extends State<MockupWidget> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Twelve Notes ♪'),
          leading: Icon(Icons.access_alarms_rounded),
          actions: [Icon(Icons.hail_sharp)],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: Icon(Icons.plus_one),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  'Head Large',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.headlineLarge,
                ),
                Text(
                  'Head Medium',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.headlineMedium,
                ),
                Text(
                  'Head Small',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.headlineSmall,
                ),
                Text(
                  'Title Large',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.titleLarge,
                ),
                Text(
                  'Title Medium',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.titleMedium,
                ),
                Text(
                  'Title Small',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.titleSmall,
                ),
                Text(
                  'Title Large',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.titleColorLarge,
                ),
                Text(
                  'Title Medium',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.titleColorMedium,
                ),
                Text(
                  'Title Small',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.titleColorSmall,
                ),
                Text(
                  'Body Large',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.bodyLarge,
                ),
                Text(
                  'Body Medium',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.bodyMedium,
                ),
                Text(
                  'Body Small',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.bodySmall,
                ),
                Text(
                  'Label Large',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.labelLarge,
                ),
                Text(
                  'Label Medium',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.labelMedium,
                ),
                Text(
                  'Label Small',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.labelSmall,
                ),
                Text(
                  'Chords Large Do- Sib RE#m',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.chordLarge,
                ),
                Text(
                  'Chords Medium Do- Sib RE#m',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.chordMedium,
                ),
                Text(
                  'Chords Small Do- Sib RE#m',
                  style: Theme.of(context).extension<TwelveTypographyExtension>()!.chordSmall,
                ),
                Divider(),
                Card(
                  child: SizedBox(
                    width: 100,
                    height: 100,
                    child: Text('Card'),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Filled button'),
                ),
                FilledButton(
                  onPressed: () {},
                  child: Text('Filled button'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Text('Outlined button'),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text('Text button'),
                ),
                TextField(),
                TextField(
                  maxLines: 20,
                ),
                SearchAnchor.bar(
                  // builder: (context, controller) => Text('Serach'),
                  suggestionsBuilder: (context, controller) => [Text('Serach')],
                ),
                ListTile(
                  title: Text('title'),
                ),
                Chip(label: Text('label')),
                Badge(
                  child: Text('badge'),
                ),
                Switch(value: true, onChanged: (value) {}),
                Checkbox(value: true, onChanged: (value) {}),
                Radio(
                  value: RadioEnum.first,
                  groupValue: RadioEnum.values,
                  onChanged: (value) {},
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          selectedIndex: _selectedIndex,
          destinations: [
            NavigationDestination(
              selectedIcon: Icon(
                Icons.home,
                color: TwelveColors.bgLight,
              ),
              icon: Icon(Icons.home_outlined),
              label: 'Home',
            ),
            NavigationDestination(
              selectedIcon: Icon(
                Icons.settings,
                color: TwelveColors.bgLight,
              ),
              icon: Icon(Icons.settings_outlined),
              label: 'Settings',
            ),
          ],
        ),
      );
}

enum RadioEnum {
  first,
  second;
}
