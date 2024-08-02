import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_app/firestoreentry.dart';
import 'package:my_app/user_model.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:dartz/dartz.dart';

class Auth {
  Future<void> signup ({
    required String name,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await Future.delayed(const Duration(seconds: 1));
      final user = UserModel(name: name, email: email, password: password);
      // Create Firestore entry - the user id is user.email
      await FirebaseFirestore.instance.collection('documents').doc(user.email).set({
        'name': user.name,
        'email': user.email,
        'password': user.password,
      });
      //will need to pass in the user.name as a parameter for checkForDoc()
      // checkForDoc(); //this function doesn't actually add the user's name into the firestore
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
      checkForDoc();
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

  Future<User?> signinApple() async {
    try {
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          ]
      );
      final OAuthCredential = OAuthProvider("apple.com").credential(
        idToken: credential.identityToken,
        accessToken: credential.authorizationCode,
      );
      final UserCredential = await FirebaseAuth.instance.signInWithCredential(OAuthCredential);
      final user = UserCredential.user;
      if(user == null)
      {
        throw const Failure(code: "user-credential-null", message: "error");
      }
      return user;
    } on SignInWithAppleAuthorizationException catch (e) {
      switch (e.code) {
        case AuthorizationErrorCode.canceled:
          return null;
        case AuthorizationErrorCode.failed:
          throw Failure(code: 'sign-in-error', message: 'error: $e');
        case AuthorizationErrorCode.invalidResponse:
          throw Failure(code: 'sign-in-error', message: 'error: $e');
        case AuthorizationErrorCode.notHandled:
          throw Failure(code: 'sign-in-error', message: 'error: $e');
        case AuthorizationErrorCode.notInteractive:
          throw Failure(code: 'sign-in-error', message: 'error: $e');
        case AuthorizationErrorCode.unknown:
          throw Failure(code: 'sign-in-error', message: 'error: $e');
      }
    } catch (e) {
      throw const Failure(code: '', message: 'Error has occured.');
    }
  }

  Future <Either<Failure, User?>> signInWithApple() async {
    try {
      final user = await signinApple();
      return Right(user);
    } on Failure catch (failure) {
      return Left(failure);
    }
  }

// Future<UserCredential> signInWithApple() async {
//     final appleProvider = AppleAuthProvider(); 
//     return await FirebaseAuth.instance.signInWithProvider(appleProvider);
//   }
//   Future<UserCredential> handleAppleSignIn() async {
//     var auth = await signInWithApple();
//     if(auth.user!=null)
//     {
//       String? displayName = "apple_user";
//       String? email = "apple@apple.com";
//     }
//   }


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

class Failure implements Exception{
    final String code;
    final String message;

    const Failure({required this.code, required this.message});
  }