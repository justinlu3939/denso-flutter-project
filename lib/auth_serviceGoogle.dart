import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:my_app/firestoreentry.dart';

class AuthServicegoogle {
  final BuildContext context; // Add this line to store the context

  AuthServicegoogle(this.context); // Constructor that accepts the context

  Future<void> signInWithGoogle() async {
    final GoogleSignInAccount? guser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await guser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);

    //print(FirebaseAuth.instance.currentUser?.displayName);
    checkForDoc();
    Navigator.pushNamed(context, '/landingpage');
  }
}
