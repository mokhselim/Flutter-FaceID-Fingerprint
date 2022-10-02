
import 'package:local_auth/local_auth.dart';

class BiometricHelper {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> hasBiometrics() async {
    final List<BiometricType> listOfBiometric =
    await _localAuth.getAvailableBiometrics();
    if (listOfBiometric.isNotEmpty) {
      return true;
    }
    return false;
  }

  Future<bool> authenticated() async {
    final bool isAuthenticated = await _localAuth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(biometricOnly: true,stickyAuth: true));
    return isAuthenticated;
  }
}