import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

void checkForDoc() async { 
  //get current user email (this is also the id for each entry)
  var currentUser = FirebaseAuth.instance.currentUser;
  String? currentEmail = currentUser?.email;
  //get the doc ref based on the id number
  DocumentReference docRef = FirebaseFirestore.instance.collection('documents').doc('$currentEmail');
  DocumentSnapshot docSnap = await docRef.get();
  //check if the doc reference to that id exists
  if(docSnap.exists) {
    print('The user exists: ${currentUser?.email}');
    //do nothing else except print statements
    // Access the data as a Map
    Map<String, dynamic> data = docSnap.data() as Map<String, dynamic>;

    // Assuming 'name' and 'email' are fields in your document
    String name = data['name'];
    String email = data['email'];

    print('Name: $name');
    print('Email: $email');
  }
  else {
      // Create Firestore entry - the user id is user.email
      // this is for google
      await FirebaseFirestore.instance.collection('documents').doc('$currentEmail').set({
        'name': currentUser?.displayName ?? 'Guest',
        'email': currentEmail ?? 'Guest email',
        //password cannot be read from google accounts. (this also includes apple)
      });
  }
}