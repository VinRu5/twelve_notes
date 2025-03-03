import 'dart:developer';

import 'package:talker/talker.dart';

final talker = Talker(
  logger: TalkerLogger(
    output: log,
    settings: TalkerLoggerSettings(
      defaultTitle: '🤖',
      maxLineWidth: 50,
    ),
  ),
);
