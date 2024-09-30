import 'dart:developer';
import 'dart:io';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:twelve_notes/src/app.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );

  // await FirebaseAuth.instance.useAuthEmulator('127.0.0.1', 9099);
  // FirebaseFirestore.instance.useFirestoreEmulator('127.0.0.1', 8080);
  // await FirebaseStorage.instance.useStorageEmulator('127.0.0.1', 9199);

  // Supabase.initialize(
  //   url: url,
  //   anonKey: anonKey,
  // );

  Bloc.observer = TalkerBlocObserver(
    talker: Talker(
      logger: TalkerLogger(
        output: log,
      ),
    ),
  );

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  if (Platform.isLinux || Platform.isMacOS || Platform.isWindows) {
    await windowManager.ensureInitialized();

    await windowManager.setMinimumSize(
      const Size(300.0, 600.0),
    );
  }

  runApp(
    const App(),
  );
}
