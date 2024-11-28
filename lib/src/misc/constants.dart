class TwelveK {
  const TwelveK._();

  // Route constant path
  static String deepLinkBaseUrl = 'https://twelvenotesdl.web.app';
  static String newPasswordPath = '/new-password';
  static String confirmRegistrationPath = '/confirm';

  // RegEx
  static RegExp passwordRegEx = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])\S{8,}$');
}
