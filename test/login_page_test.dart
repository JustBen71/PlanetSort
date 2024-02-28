import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:planetsort/component/planetsort_button.dart';
import 'package:planetsort/component/planetsort_datefield.dart';
import 'package:planetsort/component/planetsort_textfield.dart';
import 'package:planetsort/pages/login_page.dart';
import 'package:planetsort/pages/signup_page.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Future<UserCredential> signInWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
          Invocation.method(#signInWithEmailAndPassword, [email, password]),
          returnValue: Future.value(MockUserCredential()));

  @override
  Future<UserCredential> createUserWithEmailAndPassword({
    required String? email,
    required String? password,
  }) =>
      super.noSuchMethod(
          Invocation.method(#createUserWithEmailAndPassword, [email, password]),
          returnValue: Future.value(MockUserCredential()));
}

class MockFirebaseApp extends Mock implements FirebaseApp {}

class MockFirebaseUser extends Mock implements User {}

class MockUserCredential extends Mock implements UserCredential {}

void main() async {
  late MockFirebaseAuth firebase;
  late MockUserCredential mockUserCredential;
  setUpAll(() async {
    firebase = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
  });
  group('Authentification test', () {
    testWidgets('Check page loading', (WidgetTester tester) async {
      // Render the widget.
      await tester.pumpWidget(MaterialApp(
          home: LoginPage(
        firebase: firebase,
      )));

      // Verify the output.
      expect(find.text('Sign in'), findsExactly(2));
      expect(find.byType(PlanetSortTextField), findsExactly(2));
      expect(find.byType(PlanetSortButton), findsExactly(2));
      expect(find.text('Create an account'), findsOneWidget);
    });

    testWidgets('Check login connexion', (WidgetTester tester) async {
      when(firebase.signInWithEmailAndPassword(
              email: 'coucou@test.fr', password: 'test1234'))
          .thenAnswer((_) async => mockUserCredential);

      // Render the widget.
      await tester.pumpWidget(MaterialApp(
          home: LoginPage(
        firebase: firebase,
      )));

      await tester.enterText(find.byKey(const Key('email')), 'coucou@test.fr');
      await tester.enterText(
          find.byKey(const Key('passwordField')), 'test1234');
      await tester.tap(find.byKey(const Key('loginButton')));
      await tester.pumpAndSettle();

      expect(mockUserCredential.user, firebase.currentUser);
    });

    testWidgets('Check register page loading', (WidgetTester tester) async {
      // Render the widget.
      await tester.pumpWidget(const MaterialApp(home: SignUpPage()));

      // // Verify the output.
      expect(find.text('Sign up'), findsExactly(2));
      expect(find.byType(PlanetSortTextField), findsExactly(5));
      expect(find.byType(PlanetSortButton), findsExactly(1));
      expect(find.byType(PlanetSortDateField), findsOneWidget);
    });

    testWidgets('Check register', (WidgetTester tester) async {
      when(firebase.createUserWithEmailAndPassword(
              email: 'coucou@test.fr', password: 'test1234'))
          .thenAnswer((_) async => mockUserCredential);

      // Render the widget.
      await tester.pumpWidget(const MaterialApp(home: SignUpPage()));

      await tester.enterText(find.byKey(const Key('email')), 'coucou@test.fr');
      await tester.enterText(find.byKey(const Key('firstname')), 'bob');
      await tester.enterText(find.byKey(const Key('lastname')), 'mark');
      await tester.enterText(find.byKey(const Key('birthdate')), '2023-10-11');
      await tester.enterText(find.byKey(const Key('password')), 'test1234');
      await tester.enterText(
          find.byKey(const Key('confirmpassword')), 'test1234');

      await tester.tap(find.byKey(const Key('signupbutton')));
      await tester.pumpAndSettle();

      // Verify the output.
      expect(mockUserCredential.user, firebase.currentUser);
    });
  });
}
