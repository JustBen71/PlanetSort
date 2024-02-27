import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:planetsort/firebase_options.dart';
import 'package:planetsort/pages/login_page.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}
class MockFirebaseApp extends Mock implements FirebaseApp {}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  testWidgets('Vérification chargement page', (WidgetTester tester) async {
    // Render the widget.
    await tester.pumpWidget(const MaterialApp(home: LoginPage()));

    // // Verify the output.
    expect(find.text('Sign in'), findsOneWidget);
    expect(find.text('Create an account'), findsOneWidget);
  });
}