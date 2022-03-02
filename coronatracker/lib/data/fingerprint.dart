import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintLock {
  static final _auth = LocalAuthentication();

  static AndroidAuthMessages androidStrings = const AndroidAuthMessages(
    cancelButton: 'cancel',
    goToSettingsButton: 'setting',
    biometricNotRecognized: 'Not Recognized',
    biometricSuccess: 'authentication success',
  );

  Future<bool> checkBiometrics() async {
    try {
      return await _auth.canCheckBiometrics;
    } on PlatformException {
      return false;
    }
  }

  Future<bool> authenticate() async {
    final auth = await checkBiometrics();
    if (!auth) {
      return false;
    }
    try {
      return await _auth.authenticate(
        sensitiveTransaction: true,
        localizedReason: "Authenticate",
        useErrorDialogs: true,
        androidAuthStrings: androidStrings,
        stickyAuth: true,
      );
    } on PlatformException {
      return false;
    }
  }
}
