part of 'dependency_injector.dart';

final List<SingleChildWidget> adapters = [
  Provider<UserAdapter>(
    create: (_) => UserAdapter(),
  ),
];
