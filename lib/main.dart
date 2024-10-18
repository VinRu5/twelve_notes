import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:talker/talker.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:twelve_notes/src/app.dart';
import 'package:twelve_notes/src/misc/environment.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Supabase.initialize(
    url: Environment.supabaseURL,
    anonKey: Environment.supabaseAnon,
  );

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
