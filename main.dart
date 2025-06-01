// ignore_for_file: use_super_parameters, deprecated_member_use

import 'package:flutter/material.dart';
import 'themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isDarkMode = false;
  void _toggleTheme(bool newValue) {
    setState(() {
      _isDarkMode = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Theming Example',
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: HomePage(
        isDarkMode: _isDarkMode,
        onThemeChanged: _toggleTheme,
      ),
    );
  }
}

/// A sample home page demonstrating various widgets adapting to theme.
class HomePage extends StatelessWidget {
  final bool isDarkMode;
  final ValueChanged<bool> onThemeChanged;

  const HomePage({
    Key? key,
    required this.isDarkMode,
    required this.onThemeChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dark & Light Mode Demo'),
        actions: [
          Row(
            children: [
              Icon(
                isDarkMode ? Icons.dark_mode : Icons.light_mode,
                color: Theme.of(context).appBarTheme.foregroundColor,
              ),
              Switch(
                value: isDarkMode,
                onChanged: onThemeChanged,
                activeColor: colorScheme.primary,
                inactiveThumbColor: colorScheme.onBackground,
              ),
            ],
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Headline1 Text',
            style: textTheme.displayLarge,
          ),
          const SizedBox(height: 16),
          Text(
            'BodyLarge demonstrates how regular text adapts its color to the current theme.\n\n'
            'Below are examples of Containers, Cards, Buttons, and Input fields also using theme colors.',
            style: textTheme.bodyLarge,
          ),
          const SizedBox(height: 24),

          /// Container with themed background
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: colorScheme.secondary.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                'Container using secondary color with opacity',
                style: textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 24),

          /// Card example
          Card(
            elevation: 4,
            color: Theme.of(context).cardColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'This is a Card with background “cardColor”.\nIt also adapts for light/dark automatically.',
                style: textTheme.bodyLarge,
              ),
            ),
          ),
          const SizedBox(height: 24),

          /// Elevated Button example
          ElevatedButton(
            onPressed: () {
              // Just show a snackbar
              final snackBar = SnackBar(
                content: Text(
                  'Pressed ElevatedButton',
                  style: textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSecondary,
                  ),
                ),
                backgroundColor: colorScheme.secondary,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: const Text('Themed Elevated Button'),
          ),
          const SizedBox(height: 24),

          /// TextField example
          TextField(
            decoration: InputDecoration(
              labelText: 'Sample Input',
              hintText: 'Type something...',
            ),
          ),
          const SizedBox(height: 24),

          /// Divider to separate sections
          Divider(color: colorScheme.onBackground.withOpacity(0.3)),
          const SizedBox(height: 24),

          /// Example ListTile with themed icon & text
          ListTile(
            leading: Icon(
              Icons.palette,
              color: colorScheme.primary,
            ),
            title: Text(
              'ListTile title',
              style: textTheme.bodyLarge,
            ),
            subtitle: Text(
              'Subtitle adapts as well',
              style: textTheme.bodyMedium,
            ),
            tileColor: colorScheme.surface,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ],
      ),
    );
  }
}
