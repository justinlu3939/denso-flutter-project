import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Editprofile extends StatelessWidget {
  Editprofile({super.key});
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      resizeToAvoidBottomInset: true,
      //bottomNavigationBar: _signin(context),
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
         padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
          child: Column(
            children: [
              Center(
                child: Text(
                  'Edit Profile',
                  style: GoogleFonts.raleway(
                    textStyle: const TextStyle(
                      // color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 32
                    )
                  ),
                ),
              ),
              const SizedBox(height: 80,),
               _name(),
               const SizedBox(height: 20,),
               _password(),
               const SizedBox(height: 50,),
               _editProfile(context),
            ],
          ),
      ),
      )
    );
  }

  Widget _name() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Name',
          style: GoogleFonts.raleway(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 16
            )
          ),
        ),
        const SizedBox(height: 16,),
        TextField(
          controller: _nameController,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            hintText: 'John Doe',
            hintStyle: const TextStyle(
              color: Color(0xff6A6A6A),
              fontWeight: FontWeight.normal,
              fontSize: 14
            ),
            fillColor: const Color(0xffF7F7F9) ,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14)
            )
          ),
        )
      ],
    );
  }

  Widget _password() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Password',
          style: GoogleFonts.raleway(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 16
            )
          ),
        ),
        const SizedBox(height: 16,),
        TextField(
          controller: _passwordController,
          obscureText: true,
          style: const TextStyle(color: Colors.black),
          decoration: InputDecoration(
            filled: true,
            hintText: '******',
            hintStyle: const TextStyle(
              color: Color(0xff6A6A6A),
              fontWeight: FontWeight.normal,
              fontSize: 14
            ),
            fillColor: const Color(0xffF7F7F9) ,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14)
            )
          ),
        )
      ],
    );
  }

  Widget _editProfile(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    return SizedBox(
              width: 250,
              height: 70,
              child: ElevatedButton(
                onPressed: () async {
                  //may not update firestore
                  if(_nameController.text.isNotEmpty) {
                    await currentUser?.updateDisplayName(_nameController.text);
                    //make a write to the 'name' section to the firestore
                    await FirebaseFirestore.instance.collection('documents').doc(currentUser?.email).update({'name': _nameController.text});
                    print('changed names'); //this does change the name but would need to be reloaded
                  }
                  if(_passwordController.text.isNotEmpty) {
                    await currentUser?.updatePassword(_passwordController.text);
                  }
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                child: const Text('Make Changes', style: TextStyle(color: Colors.white),),
              ),
            );
  }
}