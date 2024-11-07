import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rg_interview/core/res/strings/app_messages.dart';
import 'package:tuple/tuple.dart';

class AuthenticationService {
  AuthenticationService._internal();

  static final AuthenticationService _instance =
      AuthenticationService._internal();

  factory AuthenticationService() => _instance;

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAuthentication? googleSignInAuthentication;
  GoogleSignInAccount? googleSignInAccount;

  Future<Tuple2<User?, String?>> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication!.accessToken,
          idToken: googleSignInAuthentication!.idToken,
        );
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          return Tuple2(userCredential.user, null);
        }

        return const Tuple2(null, AppMessages.sSomeThingWentWrong);
      }
      return const Tuple2(null, AppMessages.sSomeThingWentWrong);
    } catch (e) {
      return Tuple2(null, e.toString());
    }
  }

  Future<bool> signOut() async {
    await _auth.signOut().whenComplete(() async {
      await googleSignIn.signOut().then((result) async {
        if (result != null) {
          log('result :$result');
          return false;
        }
        return true;
      }, onError: (e) {
        return false;
      });
    });
    return true;
  }

  Future<bool> isEmailExist(String uid) async {
    try {
      DatabaseReference ref = FirebaseDatabase.instance.ref("users");
      final snapshot = await ref.child(uid).get();
      return snapshot.exists;
    } catch (e) {
      return false;
    }
  }
}
