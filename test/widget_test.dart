import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:safesync/pages/home.dart';
import 'package:safesync/pages/splashscreen.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    // Verify that our app starts with the splash screen.
    
    expect(find.byType(SplashScreen), findsOneWidget);

    // Wait for the splash screen to disappear and the home page to appear.
    await tester.pumpAndSettle();

    // Verify that the home page is displayed after the splash screen.
    expect(find.byType(MyHomePage), findsOneWidget);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
