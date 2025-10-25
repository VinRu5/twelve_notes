// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'TwelveNotes';

  @override
  String get titleLogin => 'Ready to play!!!🎸';

  @override
  String get ctaLogin => 'Login';

  @override
  String get signUpText => 'You haven\'t signed up yet?';

  @override
  String get signUpCta => 'SignUp!!!🚀';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailConfirmLabel => 'Confirm email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordConfirmLabel => 'Confirm password';

  @override
  String get nameLabel => 'Name';

  @override
  String get surnameLabel => 'Surname';

  @override
  String get or => 'or';

  @override
  String get resetPswMessage => 'You cannot to access?';

  @override
  String get resetPswCta => 'Reset password🔄';

  @override
  String get welcomeMessage1 => 'Play the music you love.';

  @override
  String get welcomeMessage2 => 'Wherever you are.';

  @override
  String get welcomeMessage3 => 'Share it with whomever you want.';

  @override
  String get welcomeMessage4 => 'Have fun.';

  @override
  String get welcomeCta => 'Start now';

  @override
  String get closeCta => 'Close';

  @override
  String get loginGenericError =>
      'An error has occurred. Please try logging in again.';

  @override
  String get loginWrongCredentials =>
      'The credentials don\'t seem to be correct. Please try again.';

  @override
  String get loginAccountNotExsist =>
      'The account you\'re trying to log in with does not exist. Please register before.';

  @override
  String get titleRegister => 'SignUp!!!';

  @override
  String get registerErrorEmailMatch =>
      'The email and confirm email fields must match.';

  @override
  String get registerErrorPasswordMatch =>
      'The password and confirm password fields must match.';

  @override
  String get ctaSignUp => 'Sign Up';

  @override
  String get resetPswModalMessage =>
      'We will send a message to the following email address:';

  @override
  String get resetPswModalCta => 'Send email';

  @override
  String get errorWrongPassword =>
      'The password must contain: 1 uppercase letter, 1 lowercase letter, 1 symbol, 1 number, and be at least 8 characters long.';

  @override
  String get errorAlreadyExsist =>
      'This email is already registered. Please try another one.';

  @override
  String get errorGeneric => 'An error has occurred. Please try again.';

  @override
  String get confirmSignUpTitle => 'Sign up Confirmed!';

  @override
  String get errorSignUpTitle => 'Sign up Error!';

  @override
  String confirmSignUpMessage(String email) {
    return 'Check your email to $email confirm your registration.';
  }

  @override
  String get errorSignUpMessage =>
      'There was an error during registration. Please start again.';

  @override
  String get startAgainButton => 'Start again';

  @override
  String get confirmCta => 'Confirm';

  @override
  String get newPswTitle => 'Reset Password';

  @override
  String get homeTitlePage => 'Home';

  @override
  String get libraryTitlePage => 'Library';

  @override
  String get searchTitlePage => 'Search';

  @override
  String get settingsTitlePage => 'Settings';
}
