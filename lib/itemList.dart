import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_app/navbar.dart';

//this is the import that will allow for webpage viewing
//import 'package:webview_flutter/webview_flutter.dart';

class MyItemList extends StatelessWidget {
  const MyItemList({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text(
          title,
          //this changes the font, etc. of a text directly
          style: const TextStyle(
            fontSize: 40,
            color: Colors.red,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
          ),
        ),
        shadowColor: Colors.black12,
        centerTitle: true,
      ),
      body: const ScrollView(),
    );
  }
}

class ScrollView extends StatelessWidget {
  const ScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/ac.jpg'),
            title: const Text(
              'A/C & Engine Cooling',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the A/C compressors, radiators, expansion devices, evaporators, etc.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //Navigator.pushNamed(context, routeName);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/Wires.webp'),
            title: const Text(
              'Direct Ignition Coils and Wires',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the ignition wires sets and direct ignition coils'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //Navigator.pushNamed(context, routeName);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/airfilter.webp'),
            title: const Text(
              'Filters',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the oil filters, carbon air filters and air filters.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //Navigator.pushNamed(context, routeName);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/sensors.webp'),
            title: const Text(
              'Oxygen & A/F Sensors',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the Oxygen and A/F sensors.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //Navigator.pushNamed(context, routeName);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/sparkplug.webp'),
            title: const Text(
              'Spark Plugs',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Browse spark plugs found in the OE-Type, TT and High Performance Series.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //Navigator.pushNamed(context, routeName);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/rotator.webp'),
            title: const Text(
              'Rotating Electrical',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the starters and rotators.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //Navigator.pushNamed(context, routeName);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/heavyduty.png'),
            title: const Text(
              'Heavy Duty Products',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Visit DENSO heavy duty to find car parts tailored to your needs.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //Navigator.pushNamed(context, routeName);
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/everyitem.webp'),
            title: const Text(
              'All Items',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Can\'t find what you are looking for? Browse the catalog for all the items.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              //Navigator.pushNamed(context, routeName);
              log(1);
            },
          ),
        ]
      ),
    );
  }
}
