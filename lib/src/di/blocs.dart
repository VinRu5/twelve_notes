part of 'dependency_injector.dart';

final List<SingleChildWidget> blocs = [
  // BlocProvider<DarkModeCubit>(
  //   create: (context) => DarkModeCubit(
  //     preferencesDatasource: context.read<SharedPreferencesDatasource>(),
  //   )..init(),
  // ),
  BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(
      firebaseAuth: context.read<FirebaseAuth>(),
      talker: context.read<Talker>(),
    ),
  ),
  // BlocProvider(create: (_) => SearchCubit()),
];
