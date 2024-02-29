import 'package:planetsort/component/planetsort_textfield.dart';
import 'package:planetsort/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group('App Integration Testing', () {
    testWidgets('Home View', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      final Finder textFieldEmail = find.byKey(const ValueKey('email'));
      tester.enterText(textFieldEmail, "coucou@test.fr");
      final PlanetSortTextField emailTextField =
          tester.widget(textFieldEmail) as PlanetSortTextField;
      expect(emailTextField.controller.text, 'coucou@test.fr');
    });
  });
}
