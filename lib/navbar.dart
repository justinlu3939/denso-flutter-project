import 'dart:collection';
// ignore_for_file: prefer_const_constructors, unused_import

//do not uncomment line 5. this for some reason prevents debugging
//import 'dart:nativewrappers/_internal/vm/lib/internal_patch.dart';

import 'package:flutter/material.dart';
import 'package:my_app/main.dart';
//this is for the
import 'package:provider/provider.dart';

//this is the import that will allow for webpage viewing
import 'package:webview_flutter/webview_flutter.dart';

import 'package:my_app/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cached_network_image/cached_network_image.dart';

//this code is for creating the side bar for the app.
class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    var currentUser = FirebaseAuth.instance.currentUser;
    String? displayPhoto = currentUser?.photoURL;
    // final themeModel = Provider.of<ThemeModel>(context);
    //drawer is the code that creates the hamburger menu and sidebar itself
    return Drawer(
      //all the elements are fit into one giant column
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //this expanded widget wraps all the tiles on the top of the navbar and the username, email and pictures, etc. together
          Expanded(
            //list view is a scrollable widget of widgets.
            child: ListView(
              //gets rid of the empty space
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: SelectableText("DENSO Products and Services",
                  style: TextStyle(
                    color: Colors.black,
                  ),),
                  accountEmail: SelectableText('248-350-7500',
                  style: TextStyle(
                    color: Colors.black,
                  ),),
                  //here is the link for denso image: https://www.econdev.dublinohiousa.gov/2020/wp-content/uploads/2019/08/denso-big.png
                  currentAccountPicture: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: CircleAvatar(
                      child: ClipOval(
                        child: 
                        CachedNetworkImage(
                          imageUrl: displayPhoto ?? 'https://picsum.photos/id/12/2500/1667',
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          imageBuilder: (context, imageProvider) {
                            return Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  image: DecorationImage(image: imageProvider, fit: BoxFit.cover)
                                ),
                              );
                            },
                          )
                        //   Image.network(
                        //   displayPhoto ?? 'https://picsum.photos/id/12/2500/1667',
                        //   width: 90,
                        //   height: 90,
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      // image: NetworkImage(
                      //     'https://oflutter.com/wp-content/uploads/2021/02/profile-bg3.jpg'),
                      image: AssetImage('Images/background.avif'),
                    ),
                  ),
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.perm_device_info),
                  title: Text("About DENSO"),
                  onTap: () {
                    //Navigator.of(context).pushNamed('/webviewcontainer');
                    Navigator.pushNamed(context, '/webviewcontainer',
                        arguments: 'About');
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.home),
                  title: Text('Home page'),
                  onTap: () {
                    
                    if (currentRoute == '/landingpage') {
                      // If already on the home page, pop the current route
                      Navigator.pop(context);
                    } else {
                      // Otherwise, navigate to the home page
                      Navigator.pushNamed(context, '/landingpage');
                    }
                  }
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.car_crash_outlined),
                  title: Text('Products and Services'),
                  onTap: () {
                    if (currentRoute == '/itemlist') {
                      // If already on the home page, pop the current route
                      Navigator.pop(context);
                    } else {
                      // Otherwise, navigate to the home page
                      Navigator.pushNamed(context, '/itemlist');
                    }
                  },
                ),
                ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Icon(Icons.settings),
                  title: Text('Settings'),
                  onTap: () {
                    Navigator.pushNamed(context, '/settings');
                  },
                ),
              ],
            ),
          ),
          //this is seperate from the expanded widget's,
          //the container includes the settings list tile so that it may populate from the bottom of the page
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: ListTile(
              leading: Icon(Icons.power_settings_new),
              title: Text("Log out"),
              onTap: () async {
                await Auth().signout(context: context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
