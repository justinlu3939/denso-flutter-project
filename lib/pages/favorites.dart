import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  final _firebase = FirebaseFirestore.instance;

  @override
  void initState(){
    super.initState();
    //getFavorites();
    getUserData("wow");
  }

  void getFavorites() async {
    await _firebase.collection("documents").get().then((event){
      for (var doc in event.docs)
      {
        print("${doc.id} => ${doc.data()}");
      }
    });
  }

  void getUserData(String uid) async {
    DocumentReference docRef = _firebase.collection('documents').doc(uid);
    DocumentSnapshot doc = await docRef.get();

    if(doc.exists) {
      print('Information - ${doc.data()}');
    }
    else {
      print('nothing exists');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Favorites',
          //this changes the font, etc. of a text directly
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
        shadowColor: Colors.black12,
        centerTitle: true,
      ),
      
      // if (_firebase.collection. == null)
      // {
      //   body: const Placeholder(),
      // }
      // else {
      //   body: ScrollView();
      // }
      body: const Placeholder(),
    );
  }
}

class ScrollView extends StatelessWidget {
  const ScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/airfilter.png', width: 90, height: 90,),
            title: const Text(
              'Air Filter',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('These filters are used to to clean the air that circulates through your heating and cooling system.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}