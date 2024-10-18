import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

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
  Widget build(BuildContext context) => MultiProvider(
        providers: datasources,
        child: child,
      );

  // MultiProvider(
  //       providers: adapters,
  //       child: MultiProvider(
  //         providers: datasources,
  //         child: MultiRepositoryProvider(
  //           providers: repositories,
  //           child: MultiBlocProvider(
  //             providers: blocs,
  //             child: child,
  //           ),
  //         ),
  //       ),
  //     );
}
