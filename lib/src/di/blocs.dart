part of 'dependency_injector.dart';

final List<SingleChildWidget> blocs = [
  // BlocProvider<DarkModeCubit>(
  //   create: (context) => DarkModeCubit(
  //     preferencesDatasource: context.read<SharedPreferencesDatasource>(),
  //   )..init(),
  // ),
  BlocProvider<AuthCubit>(
    create: (context) => AuthCubit(
      authRepository: context.read<AuthenticationRepository>(),
    ),
  ),
  // BlocProvider(create: (_) => SearchCubit()),
];
