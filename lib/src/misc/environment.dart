class Environment {
  Environment._();

  static const String _firebaseProjectIDKey = 'firebaseProjectID';
  static const String _firebaseMessagingSenderKey = 'firebaseMessagingSender';
  static const String _firebaseWebAKKey = 'firebaseWebAK';
  static const String _firebaseWebAppIDKey = 'firebaseWebAppID';
  static const String _firebaseWebMeasIDKey = 'firebaseWebMeasID';
  static const String _firebaseAndroidAKKey = 'firebaseAndroidAK';
  static const String _firebaseAndroidAppIDKey = 'firebaseAndroidAppID';
  static const String _firebaseIOSdAKKey = 'firebaseIOSAK';
  static const String _firebaseIOSAppIDKey = 'firebaseIOSAppID';
  static const String _firebaseWinAKKey = 'firebaseWinAK';
  static const String _firebaseWinAppIDKey = 'firebaseWinAppID';
  static const String _firebaseWinMeasIDKey = 'firebaseWinMeasID';

  static const String firebaseProjectID = String.fromEnvironment(_firebaseProjectIDKey);
  static const String firebaseMessagingSender = String.fromEnvironment(_firebaseMessagingSenderKey);
  static const String firebaseWebAK = String.fromEnvironment(_firebaseWebAKKey);
  static const String firebaseWebAppID = String.fromEnvironment(_firebaseWebAppIDKey);
  static const String firebaseWebMeasID = String.fromEnvironment(_firebaseWebMeasIDKey);
  static const String firebaseAndroidAK = String.fromEnvironment(_firebaseAndroidAKKey);
  static const String firebaseAndroidAppID = String.fromEnvironment(_firebaseAndroidAppIDKey);
  static const String firebaseIOSAK = String.fromEnvironment(_firebaseIOSdAKKey);
  static const String firebaseIOSAppID = String.fromEnvironment(_firebaseIOSAppIDKey);
  static const String firebaseWinAK = String.fromEnvironment(_firebaseWinAKKey);
  static const String firebaseWinAppID = String.fromEnvironment(_firebaseWinAppIDKey);
  static const String firebaseWinMeasID = String.fromEnvironment(_firebaseWinMeasIDKey);
}
