// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get appName => 'TwelveNotes';

  @override
  String get titleLogin => 'Pronto per suonare!!!🎸';

  @override
  String get ctaLogin => 'Accedi';

  @override
  String get signUpText => 'Non sei ancora registrato?';

  @override
  String get signUpCta => 'Registrati!!!🚀';

  @override
  String get emailLabel => 'Email';

  @override
  String get emailConfirmLabel => 'Conferma email';

  @override
  String get passwordLabel => 'Password';

  @override
  String get passwordConfirmLabel => 'Conferma password';

  @override
  String get nameLabel => 'Nome';

  @override
  String get surnameLabel => 'Cognome';

  @override
  String get or => 'o';

  @override
  String get resetPswMessage => 'Non riesci ad accedere?';

  @override
  String get resetPswCta => 'Resetta la password🔄';

  @override
  String get welcomeMessage1 => 'Suona la musica che ami.';

  @override
  String get welcomeMessage2 => 'Ovunque tu sia.';

  @override
  String get welcomeMessage3 => 'Convidila con chi vuoi.';

  @override
  String get welcomeMessage4 => 'Divertiti.';

  @override
  String get welcomeCta => 'Inizia subito';

  @override
  String get closeCta => 'Chiudi';

  @override
  String get loginGenericError =>
      'Si è verificato un errore. Riprova ad effettuare l\'accesso.';

  @override
  String get loginWrongCredentials =>
      'Le credenziali non sembrano corrette. Riprova.';

  @override
  String get loginAccountNotExsist =>
      'L\'account con cui stai provando ad accedere non esiste. Effettua la registrazione prima.';

  @override
  String get titleRegister => 'Registrati!!!';

  @override
  String get registerErrorEmailMatch =>
      'Il campo email e conferma email devono coincidere';

  @override
  String get registerErrorPasswordMatch =>
      'Il campo password e conferma password devono coincidere';

  @override
  String get ctaSignUp => 'Registrati';

  @override
  String get resetPswModalMessage =>
      'Ti invieremo un messaggio al seguente indirizzo email:';

  @override
  String get resetPswModalCta => 'Invia email';

  @override
  String get errorWrongPassword =>
      'La password deve contenere: 1 lettera maiuscola, 1 lettera minuscola, 1 simbolo, 1 numero e lunga almeno 8 caratteri';

  @override
  String get errorAlreadyExsist =>
      'Questa email risulta già registrata. Prova con un\'altra.';

  @override
  String get errorGeneric => 'Si è verificato un errore. Riprova.';

  @override
  String get confirmSignUpTitle => 'Conferma Registrazione!';

  @override
  String get errorSignUpTitle => 'Errore Registrazione!';

  @override
  String confirmSignUpMessage(String email) {
    return 'Accedi alla tua email $email per confermare la tua registrazione.';
  }

  @override
  String get errorSignUpMessage =>
      'C\'è stato un errore in fase di registrazione ricomincia.';

  @override
  String get startAgainButton => 'Ricomincia';

  @override
  String get confirmCta => 'Confirma';

  @override
  String get newPswTitle => 'Reset Password';

  @override
  String get homeTitlePage => 'Home';

  @override
  String get libraryTitlePage => 'Libreria';

  @override
  String get searchTitlePage => 'Cerca';

  @override
  String get settingsTitlePage => 'Impostazioni';

  @override
  String get searchHint => 'Cerca artisti e canzoni...';

  @override
  String get searchSectionArtists => 'Artisti';

  @override
  String get searchSectionSongs => 'Canzoni';

  @override
  String get searchNoResults => 'Nessun risultato trovato';
}
