import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:demo_provider/providers/counter.dart';
import 'package:demo_provider/screens/counter_screen.dart';

void main() {
  testWidgets('Counter increments test', (WidgetTester tester) async {
    // Initialize `ChangeNotifierProvider` for `Counter`
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => Counter(),
        child: MaterialApp(
          home: CounterScreen(),
        ),
      ),
    );

    // Verify initial text is "0"
    expect(find.text('0'), findsOneWidget);

    // Tap the FloatingActionButton to increment the counter
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pump();

    // Verify that the text has changed to "1"
    expect(find.text('1'), findsOneWidget);
  });
}
