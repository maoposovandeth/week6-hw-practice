import 'package:flutter_test/flutter_test.dart';

import 'package:g4deth/Ex-3/main.dart';

void main() {
  testWidgets('dice roller displays a roll button', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Roll Dice'), findsOneWidget);
  });
}
