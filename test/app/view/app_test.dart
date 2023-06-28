import 'package:flutter_test/flutter_test.dart';
import 'package:mint/presentation/app/app.dart';

void main() {
  group('App', () {
    testWidgets('', (tester) async {
      await tester.pumpWidget(App());
    });
  });
}
