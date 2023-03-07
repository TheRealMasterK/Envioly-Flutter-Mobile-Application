// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';

Future<String?> changePassword(
  String passwordat,
  String newpass,
) async {
  User user = FirebaseAuth.instance.currentUser!;
  String? email = user.email;

  //Create field for user to input old password

  //pass the password here
  String password = passwordat;
  String newPassword = newpass;

  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email!,
      password: password,
    );

    user.updatePassword(newPassword).then((_) {
      return 'okay';
    }).catchError((error) {
      return 'error';
      //This might happen, when the wrong password is in, the user isn't found, or if the user hasn't logged in recently.
    });
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      return 'nouser';
    } else if (e.code == 'wrong-password') {
      return 'passruim';
    }
  }
}
