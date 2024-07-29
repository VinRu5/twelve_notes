class K {
  const K._();

  static const String passwordRegEx = r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{8,}$';
}
