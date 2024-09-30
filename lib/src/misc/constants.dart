class K {
  const K._();

  // RegEx
  static RegExp passwordRegEx = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{8,}$');

  //Firebase Collections Key
  static const String usersFKey = 'users';
}
