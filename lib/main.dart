import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_bloc_logger/talker_bloc_logger_observer.dart';
import 'package:window_manager/window_manager.dart';

import 'src/app.dart';
import 'src/utils/logger.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // try {
  //   Supabase.initialize(
  //     url: Environment.supabaseURL,
  //     anonKey: Environment.supabaseAnon,
  //   );
  // } catch (e) {
  //   talker.error(e);
  // }

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
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
