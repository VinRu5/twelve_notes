import 'dart:developer';

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:talker/talker.dart';
import 'package:twelve_notes/src/auth/data/adapters/user_adapter.dart';

part 'adapters.dart';
part 'blocs.dart';
part 'datasources.dart';
part 'repositories.dart';

class DependencyInjector extends StatelessWidget {
  final Widget child;

  const DependencyInjector({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) => Provider(
        create: (_) => Talker(
          logger: TalkerLogger(output: log),
        ),
        child: MultiProvider(
          providers: adapters,
          child: MultiProvider(
            providers: datasources,
            child: MultiRepositoryProvider(
              providers: repositories,
              child: MultiBlocProvider(
                providers: blocs,
                child: child,
              ),
            ),
          ),
        ),
      );
}
