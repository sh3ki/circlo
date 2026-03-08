import 'package:flutter_test/flutter_test.dart';
import 'package:circlo/main.dart';

void main() {
  testWidgets('CircloApp launches', (WidgetTester tester) async {
    await tester.pumpWidget(const CircloApp());
    expect(find.byType(CircloApp), findsOneWidget);
  });
}
