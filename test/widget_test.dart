

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/app.dart';
import 'package:flutter_test/flutter_test.dart';

void main(){
  testWidgets("calculator test" , (WidgetTester tester) async {
    await tester.pumpWidget(const MyWidge());

    expect(find.byKey(const Key("result")), findsOneWidget);
    expect(find.byKey(const Key("displayOne")), findsOneWidget);
    expect(find.byKey(const Key("displayTwo")), findsOneWidget);
    expect(find.byIcon(CupertinoIcons.add), findsOneWidget);

    await tester.enterText(find.byKey(const Key("displayOne")), "10");
    await tester.enterText(find.byKey(const Key("displayTwo")), "20");

    await tester.tap(find.byIcon(CupertinoIcons.add));

    await tester.pump();

    expect(find.text("30"), findsOneWidget);

    // expect(find.text("hello world"), findsOneWidget);
  });
}