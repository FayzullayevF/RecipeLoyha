// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signUp => 'Sign Up';

  @override
  String get firstName => 'First Name';

  @override
  String get lastName => 'Last Name';

  @override
  String get username => 'Username';

  @override
  String get email => 'Email';

  @override
  String get mobileNumber => 'Mobile Number';

  @override
  String get dateOfBirth => 'Date of birth';

  @override
  String get password => 'Password';

  @override
  String get confirmPassword => 'Confirm password';

  @override
  String get signUpDesc => 'By continuing, you Agree to ';

  @override
  String get signUpTerms => 'Terms of Use and Privacy Police';

  @override
  String get signUpAlready => 'Already have an account? Log in';

  @override
  String get login => 'Login';

  @override
  String get forgetPassword => 'Forget password';

  @override
  String get signUpWith => 'or sign up with';

  @override
  String get noAccount => 'Don\'t have an account? Sign Up';
}
