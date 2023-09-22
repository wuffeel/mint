import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:mint/data/model/phone_code_sent_data.dart';
import 'package:mint/data/repository/abstract/phone_auth_repository.dart';
import 'package:mint_core/mint_core.dart';
import 'package:mint_core/mint_module.dart';

@Injectable(as: PhoneAuthRepository)
class FirebaseAuthRepository implements PhoneAuthRepository {
  FirebaseAuthRepository(this._firebaseInitializer);

  final FirebaseInitializer _firebaseInitializer;

  Future<CollectionReference<Map<String, dynamic>>>
      get _usersCollectionRef async =>
          (await _firebaseInitializer.firestore).collection('users');

  @override
  Future<PhoneCodeSentData> verifyPhoneNumber({
    required String phoneNumber,
    int? resendToken,
  }) async {
    await _checkForValidUserType(phoneNumber);

    final auth = await _firebaseInitializer.firebaseAuth;

    final codeSendCompleter = Completer<PhoneCodeSentData>();

    await auth.verifyPhoneNumber(
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
    required String verificationId,
  }) async {
    final auth = await _firebaseInitializer.firebaseAuth;

    final phoneCredential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otpCode,
    );
    await auth.signInWithCredential(phoneCredential);
  }

  /// Checks if the user associated with [phoneNumber] in Firestore has the
  /// correct user type. If there is no user with [phoneNumber], does nothing.
  ///
  /// For mobile application, the correct user type is __'patient'__.
  /// Throws an [AuthUserTypeException] if the user type is incorrect.
  Future<void> _checkForValidUserType(String phoneNumber) async {
    final userCollection = await _usersCollectionRef;
    final userSnap =
        await userCollection.where('phoneNumber', isEqualTo: phoneNumber).get();
    if (userSnap.docs.isNotEmpty) {
      final user = userSnap.docs.first;
      final type = user.data()['type'];
      if (type != UserType.patient.name) throw AuthUserTypeException();
    }
  }
}
