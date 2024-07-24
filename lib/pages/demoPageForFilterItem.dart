import 'package:flutter/material.dart';

class demoPage extends StatelessWidget{
  const demoPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Filter',
          //this changes the font, etc. of a text directly
          style: TextStyle(
            fontSize: 40,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic,
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
  const ScrollView({Key? key}) : super(key: key);

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
            onTap: () {
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'airfilter');
            },
            onLongPress: () {
              print('1');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/cabinfilter.png', width: 90, height: 90,),
            title: const Text(
              'Cabin Air Filter',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('These filters are used to help keep the vehicle air clean and fresh.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'cabinfilter');
            },
            onLongPress: () {
              print('2');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/oilfilter.png', width: 90, height: 90,),
            title: const Text(
              'Oil Filter',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('These filters are used helps remove contaminants from your car engine\'s oil that can accumulate over time as the oil keeps your engine clean.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'oilfilter');
            },
            onLongPress: () {
              print('3');
            },
          ),
        ]
      )
    );
  }
}