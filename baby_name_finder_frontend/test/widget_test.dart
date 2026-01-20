import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:baby_name_finder_frontend/main.dart';

void main() {
  testWidgets('Baby Name Finder app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const BabyNameFinderApp());

    // Verify app loads
    expect(find.byType(BabyNameFinderApp), findsOneWidget);
    
    // Wait for async operations
    await tester.pumpAndSettle();
    
    // Check for bottom navigation bar
    expect(find.byType(BottomNavigationBar), findsOneWidget);
  });

  testWidgets('Bottom navigation works', (WidgetTester tester) async {
    await tester.pumpWidget(const BabyNameFinderApp());
    await tester.pumpAndSettle();

    // Verify we have 4 navigation items
    expect(find.byIcon(Icons.home_outlined), findsOneWidget);
    expect(find.byIcon(Icons.search_outlined), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsOneWidget);
    expect(find.byIcon(Icons.settings_outlined), findsOneWidget);

    // Tap on search tab
    await tester.tap(find.byIcon(Icons.search_outlined));
    await tester.pumpAndSettle();

    // Verify search icon is now active
    expect(find.byIcon(Icons.search), findsOneWidget);
  });
}
