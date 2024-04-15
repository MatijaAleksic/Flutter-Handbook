import 'package:flutter_mini_project/features/auth/domain/constants/validation_constants.dart';
import 'package:flutter_mini_project/core/utils/extensions/string_extension.dart';

class LoginValidationUseCase {
  String? validatePassword(String? password) {
    if (password.isEmptyOrNull) {
      return "Password is required";
    } else if (password!.length < ValidationConstants.passwordSizeMin) {
      return "Password needs to be at least 5 characters long";
    }
    if (password.length > ValidationConstants.passwordSizeMax) {
      return "Password needs to be lower than 15 characters long";
    }
    return null;
  }

  String? validateEmail(String? email) {
    if (email.isEmptyOrNull) {
      return "Email is required";
    }
    if (!RegExp(ValidationConstants.emailPattern).hasMatch(email!)) {
      return "Email is not in valid format";
    }
    return null;
  }
}
