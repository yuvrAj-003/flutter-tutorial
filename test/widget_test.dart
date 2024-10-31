

import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("hello world test" , (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidge());

    expect(find.byType(Container), findsOneWidget);
    expect(find.text("hello world"), findsOneWidget);
  });
}