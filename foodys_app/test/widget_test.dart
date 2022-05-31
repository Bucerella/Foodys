// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:foodys_app/utilities/utilities.dart';
import 'package:foodys_app/view/screens/home_screen.dart';

void main() {
  testWidgets('This test for Home Screen smoke test',
      (WidgetTester tester) async {
    await tester.pumpWidget(HomeScreen());

    /// After than run app, wait home screen welcome message and category screen text.
    expect(find.text(Constants.welcomeMessage), findsOneWidget);
    expect(find.text(Constants.categoryScreen), findsOneWidget);
    expect(find.text("Test"), findsNothing);

    /// Click NavBar Item
    await tester.tap(find.byIcon(Icons.favorite));

    /// Clicking navbar fav icon
    await tester.pump();
    expect(find.text(Constants.fav), findsOneWidget);
  });
}
