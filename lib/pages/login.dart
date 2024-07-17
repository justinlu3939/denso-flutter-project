import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_app/auth_serviceGoogle.dart';
import 'package:my_app/components/my_button.dart';
import 'package:my_app/components/my_textfield.dart';
import 'package:my_app/components/square_tile.dart';
import 'package:my_app/auth.dart';
//import 'package:flutter/gestures.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  //void signUserIn() {}
  // void signUserIn(BuildContext context) {
  //   Navigator.pushNamed(context, '/landingpage');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey[300],
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'Images/Denso-Logo.png',
                  height: 250,
                  width: 250,
                  //fit: BoxFit.cover, //this is for 'Images/DENSO.png'
                ),

                const SizedBox(height: 20),

                // welcome back, you've been missed!
                Text(
                  'Welcome back!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                MyTextField(
                  controller: usernameController,
                  hintText: 'Username',
                  obscureText: false,
                ),

                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                        onTap: () async {
                          Navigator.pushNamed(context, '/forgetpw');
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                // MyButton(
                //   onTap: signUserIn,
                // ),
                MyButton(
                  onTap: () async {
                    await Auth().signin(
                      email: usernameController.text, 
                      password: passwordController.text, 
                      context: context
                    );
                  }, 
                ),

                const SizedBox(height: 20),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                //google + apple sign in buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(
                      onTap: () => AuthServicegoogle(context).signInWithGoogle(),
                      imagePath: 'Images/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(
                      onTap: () {
                        
                      },
                      imagePath: 'Images/apple.png')
                  ],
                ),

                const SizedBox(height: 10),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    InkWell(
                      onTap: () async {
                        Navigator.pushNamed(context, '/signup');
                      },
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Text(
                          'Register now',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
