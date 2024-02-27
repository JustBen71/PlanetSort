import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:planetsort/component/planetsort_button.dart';
import 'package:planetsort/component/planetsort_dailytips.dart';
import 'package:planetsort/component/planetsort_textfield.dart';
import 'package:planetsort/firebase_options.dart';
import 'package:planetsort/pages/login_page.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockFirebaseApp extends Mock implements FirebaseApp {}
class MockUserCredential extends Mock implements UserCredential {}

void main() async {
  var firestore;
  setUpAll(() async {
    firestore = MockFirebaseAuth();
  });
  group('login test', () { 
    testWidgets('Check page loading', (WidgetTester tester) async {
      // Render the widget.
      await tester.pumpWidget( MaterialApp(home: LoginPage(firebase: firestore,)));

      // // Verify the output.
      expect(find.text('Sign in'), findsExactly(2));
      expect(find.byType(PlanetSortTextField), findsExactly(2));
      expect(find.byType(PlanetSortButton), findsExactly(2));
      expect(find.text('Create an account'), findsOneWidget);
    });

    testWidgets('Check login connexion', (WidgetTester tester) async {
      // Render the widget.
      await tester.pumpWidget( MaterialApp(home: LoginPage(firebase: firestore,)));

      await tester.enterText(find.byKey(const Key('email')), 'coucou@test.fr');
      await tester.enterText(find.byKey(const Key('passwordField')), 'test1234');
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();// Attendez que les animations se terminent

      expect(find.byType(DailyTipWidget), findsOneWidget);
    });
  });
}