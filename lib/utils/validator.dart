import 'form_validator.dart';

class Validator {
  static final number = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    DoubleValidator(errorText: 'This field must be a number'),
  ]).call;

  static final numberOtherThanZero = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    DoubleValidator(errorText: 'Input a number'),
    NumberOtherThanZero(errorText: 'Value must be other than 0'),
  ]).call;

  static final required = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
  ]).call;

  static final password = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    MinLengthValidator(6, errorText: 'Password must be at least 6 digits long'),
  ]).call;

  static final email = MultiValidator([
    RequiredValidator(errorText: 'This field is required'),
    EmailValidator(errorText: 'Enter a valid email address'),
  ]).call;

  static String? Function(String?)? confirmPassword(String? password) {
    return MultiValidator([
      RequiredValidator(errorText: 'This field is required'),
      MatchValidator(password, errorText: 'Confirm password is not match'),
    ]).call;
  }
}
