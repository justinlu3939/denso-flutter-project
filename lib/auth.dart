// import 'dart:math';
import 'package:firebase_core/firebase_core.dart';
//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:google_sign_in/google_sign_in.dart';

//in the signup page, make sure you have under the ontap async button: await Auth().signup(email: _emailcontroller.text, password: _passwordcontroller.text)

class Auth {
  Future<void> signup ({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(context, '/landingpage');
    } 
    on FirebaseAuthException catch(e) {
      String message = '';
      if(e.code == 'email-already-in-use'){
        message = 'An account already exists with that email';
      }
      else {
        message = 'Please use a valid email address';
      }
      Fluttertoast.showToast(
          msg: message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.SNACKBAR,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 14,
        );
    }
  }

  Future<void> signin({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      // await Future.delayed(const Duration(seconds: 1));
      Navigator.pushNamed(context, '/landingpage');
    } 
    on FirebaseAuthException catch(e) {
      String message = '';
      //this is a potential security vulnerability
      //solution: make the messages the same to prevent unauthorized access
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user.';
      }
      else {
        message = 'Something went wrong. Please check your email address and/or password';
      }
       Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }

  Future<void> signout({
    required BuildContext context
  }) async {
    await FirebaseAuth.instance.signOut();
    await Future.delayed(const Duration(seconds: 1));
    Navigator.pushNamed(context, '/signout');
  }

// Future<UserCredential> signInWithApple() async {
//   final appleProvider = AppleAuthProvider();

//   try {
//     UserCredential userCredential = await FirebaseAuth.instance.signInWithPopup(appleProvider);
//     // Keep the authorization code returned from Apple platforms
//     String? authCode = userCredential.additionalUserInfo?.authorizationCode;
//     // Revoke Apple auth token
//     await FirebaseAuth.instance.revokeTokenWithAuthorizationCode(authCode!);

//     return userCredential; // Explicitly return the user credential
//   } catch (error) {
//     print('Error: $error');
//     rethrow; // Rethrow the error
//   }
// }

  Future<void> sendPasswordResetLink(String email, BuildContext context) async{
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Fluttertoast.showToast(
        msg: 'An email has been sent to your account',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
      await Future.delayed(Duration(seconds: 1));
        Navigator.pop(context);
    }
    on FirebaseAuthException catch(e) {
      String message = '';
      //this is a potential security vulnerability
      //solution: make the messages the same to prevent unauthorized access
      if (e.code == 'invalid-email') {
        message = 'No user found for that email.';
      } else {
        message = 'Something went wrong. Please enter a valid email and try again.';
      }
       Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.SNACKBAR,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
        fontSize: 14.0,
      );
    }
  }
}