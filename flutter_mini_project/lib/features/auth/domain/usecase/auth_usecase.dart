import 'package:flutter_mini_project/core/utils/helpers/secure_storage_service.dart';
import 'package:flutter_mini_project/features/auth/domain/constants/auth_constants.dart';

class AuthUsecase {
  final SecureStorageService _secureStorageService;

  AuthUsecase({required SecureStorageService secureStorageService})
      : _secureStorageService = secureStorageService;

  Future<void> saveUserCredentials(
      {required String email, required String password}) async {
    await _secureStorageService.write(
        key: AuthConstants.userCredentialsEmail, value: email);
  }

  Future<void> logout() async {
    await _secureStorageService.delete(key: AuthConstants.userCredentialsEmail);
  }

  Future<bool> isUserLoggedIn() async {
    String? email = await _secureStorageService.read(
        key: AuthConstants.userCredentialsEmail);
    return email != null;
  }
}
