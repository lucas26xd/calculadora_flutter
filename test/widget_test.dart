import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:calculadora_flutter/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('1'), findsOneWidget);

    await tester.tap(find.text('1'));
    await tester.pump();
	  await tester.tap(find.text('➖'));
    await tester.pump();
	  await tester.tap(find.text('1'));
    await tester.pump();
	
	  await tester.tap(find.text('Calcular'));
    await tester.pump();
    
    expect(find.text('0'), findsOneWidget);
  });
}
