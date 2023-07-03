import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/repository/abstract/phone_auth_repository.dart';
import 'package:mint/domain/entity/phone_code_sent_data.dart';

@Injectable(as: PhoneAuthRepository)
class FirebaseAuthRepository implements PhoneAuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<PhoneCodeSentData> verifyPhoneNumber({
    required String phoneNumber,
    int? resendToken,
  }) async {
    final codeSendCompleter = Completer<PhoneCodeSentData>();

    await _firebaseAuth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) {
        // TODO(wuffeel): auto-retrieval won't be implemented
      },
      verificationFailed: (FirebaseAuthException exception) {
        if (!codeSendCompleter.isCompleted) {
          codeSendCompleter.completeError(exception);
        }
      },
      codeSent: (String verificationId, int? forceResendingToken) {
        final phoneCodeSent = PhoneCodeSentData(
          verificationId: verificationId,
          resendToken: forceResendingToken,
        );
        codeSendCompleter.complete(phoneCodeSent);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (codeSendCompleter.isCompleted) return;
        final phoneCodeSent = PhoneCodeSentData(verificationId: verificationId);
        codeSendCompleter.complete(phoneCodeSent);
      },
      forceResendingToken: resendToken,
    );

    return codeSendCompleter.future;
  }

  @override
  Future<void> verifyOtpCode({
    required String otpCode,
    String? verificationId,
  }) async {
    if (verificationId == null) return;
    final phoneCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    await _firebaseAuth.signInWithCredential(phoneCredential);
  }
}