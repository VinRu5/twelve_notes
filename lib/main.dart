import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twelve_notes/firebase_options.dart';
import 'package:twelve_notes/src/app.dart';
import 'package:twelve_notes/src/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    App(router: AppRouter()),
  );
}
