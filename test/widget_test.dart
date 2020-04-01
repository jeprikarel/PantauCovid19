// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
/* awal
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:pantaucovid19/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
akhir */

import 'package:flutter_test/flutter_test.dart';
import 'package:pantaucovid19/connection/pantauCovid19Http.dart';

main() {
  group('API Test', () {
    test('Indonesia API', () async {
      print(await PantauCovid19Http().getStatusIndonesia());
    });
    test('Sembuh Dunia API', () async {
      print(await PantauCovid19Http().getSembuh());
    });
    test('Terinfeksi Dunia API', () async {
      print(await PantauCovid19Http().getPositif());
    });
    test('Meninggal Dunia API', () async {
      print(await PantauCovid19Http().getMeninggal());
    });
    test('Data Dunia API', () async {
      print(await PantauCovid19Http().getStatusDunia());
    });
    test('Data Provinsi API', () async {
      print(await PantauCovid19Http().getStatusProvinsi());
    });
  });
}
