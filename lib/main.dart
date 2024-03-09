import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:whispr/auth/auth_gate.dart';
import 'package:whispr/firebase_options.dart';
import 'package:whispr/themes/light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: lightMode,
    );
  }
}