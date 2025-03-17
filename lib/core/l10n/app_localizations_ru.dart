// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get signUp => 'Зарегистрироваться';

  @override
  String get firstName => 'Имя';

  @override
  String get lastName => 'Фамилия';

  @override
  String get username => 'Имя пользователя';

  @override
  String get email => 'Электронная почта';

  @override
  String get mobileNumber => 'Номер телефона';

  @override
  String get dateOfBirth => 'Дата рождения';

  @override
  String get password => 'Пароль';

  @override
  String get confirmPassword => 'Подтвердите пароль';

  @override
  String get signUpDesc => 'Продолжая, вы соглашаетесь с';

  @override
  String get signUpTerms => 'Terms of Use and Privacy Police';

  @override
  String get signUpAlready => 'У вас уже есть аккаунт? Войти';

  @override
  String get login => 'Входить';

  @override
  String get forgetPassword => 'Забыли пароль';

  @override
  String get signUpWith => 'Или зарегистрируйтесь через эти';

  @override
  String get noAccount => 'У вас нет учетной записи? Зарегистрироваться';
}
