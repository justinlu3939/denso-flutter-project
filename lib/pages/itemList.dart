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
            leading: Image.asset('Images/AC-Compressor-web.webp', width: 90, height: 90,),
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
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'AC');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/Wires.webp', width: 90, height: 90,),
            title: const Text(
              'Electrical Components',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the Alternatives, Relays and Starters'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'ecomp');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/ignition.webp', width: 90, height: 90,),
            title: const Text(
              'Engines',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the ignitors for engines here.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'engine');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/airfilter.webp', width: 90, height: 90,),
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
              //this is gonna connect to the demo page instead. no webview
              Navigator.pushNamed(context, '/demoPage');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/fuelsystem.webp', width: 90, height: 90,),
            title: const Text(
              'Fuel System',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the fuel system components and fuel pumps here.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'fuel');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/sparkplug.webp'),
            title: const Text(
              'Industrial Plugs',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the industrial plugs DENSO has to offer here.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'plug');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/sensors.webp'),
            title: const Text(
              'Sensors',
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
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'sensor');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/wiper.webp'),
            title: const Text(
              'Wiper Blades',
              style: TextStyle(
                fontSize: 20,
                fontFamily: 'Times New Roman',
              ),
            ),
            subtitle: const Text('Check out the wiper bladess here.'),
            //tileColor: Colors.blue,
            hoverColor: Colors.red,
            focusColor: Colors.white,
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'wiper');
            },
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(20),
            leading: Image.asset('Images/heavyduty.webp'),
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
              Navigator.pushNamed(context, '/webviewcontainer',
                        arguments: 'heavyproduct');
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
              Navigator.pushNamed(context, '/webviewcontainer',
                                  arguments: 'allproduct');
            },
          ),
        ]
      ),
    );
  }
}
