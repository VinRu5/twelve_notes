class K {
  const K._();

  // RegEx
  static const String passwordRegEx = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{8,}$';

  //Firebase Collections Key
  static const String usersFKey = 'users';
}
