import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Text Widget Test', (WidgetTester tester) async {
    // Build the widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  '14.46',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              // Add other Text widgets here
            ],
          ),
        ),
      ),
    );

    // Find the Text widget
    final textFinder = find.text('14.46');

    // Verify that the Text widget exists
    expect(textFinder, findsOneWidget);

    // Verify the text color
    final textWidget = tester.widget<Text>(textFinder);
    expect(textWidget.style?.color, equals(Colors.black));
  });
}
