import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_app/firestoreget.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Profile',
          //this changes the font, etc. of a text directly
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        shadowColor: Colors.black12,
        centerTitle: true,
      ),
      body: ScrollView(),
    );
  }
}

class ScrollView extends StatelessWidget {
  const ScrollView({super.key});

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;
    String? displayPhoto = currentUser?.photoURL;

    //use this to replace name and email above
    //add a doc reference check and grabber here for name and email
    //this will replace the email and name

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(displayPhoto ?? 'https://picsum.photos/id/12/2500/1667'),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 20,),

            //for these make sure you can grab the emails and names from the firebase docs based on the IDs
            FutureBuilder<List<Map<String, dynamic>>>(
              future: getFromDoc(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  var userData = snapshot.data!.first;
                  String displayName = userData['name'];
                  String email = userData['email'];
                  return Column(
                    children: [
                      Text(
                      displayName,
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      email,
                      style: const TextStyle(fontSize: 20),
                    ),
                    ],
                  );
                }
                else {
                  return const Text('error');
                }
              },
            ),
            const SizedBox(height: 20,),
            SizedBox(
              width: 250,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/editprofile');
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    side: BorderSide.none,
                    shape: const StadiumBorder(),
                  ),
                child: const Text('Edit Profile', style: TextStyle(color: Colors.white),),
              ),
            ),
            // const SizedBox(height: 20,),
            // const Divider(height: 1.0, thickness: 10,),
            const SizedBox(height: 20,)
          ],
        ),
      ),
    );
  }
}