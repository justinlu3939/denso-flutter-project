import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future<List<Map<String, dynamic>>> getFromDoc() async {
  var currentUser = FirebaseAuth.instance.currentUser;
  //get the id tocken - same as the user's email
  String? currentEmail = currentUser?.email;

  DocumentReference docRef = FirebaseFirestore.instance.collection('documents').doc('$currentEmail');
  DocumentSnapshot docSnap = await docRef.get();

  if(docSnap.exists) {
    print('returning the users information');
    Map<String, dynamic> data = docSnap.data() as Map<String, dynamic>;
    return [data]; //receive the data in a future builder
  }
  else {
    //if the doc doesn't exists
    print('this user and user information does not exist');
    return [];
  }
}