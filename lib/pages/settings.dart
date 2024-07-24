import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:my_app/main.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            fontSize: 30,
            fontFamily: 'Times New Roman',
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const ScrollView(),
    );
  }
}

class ScrollView extends StatelessWidget {
  const ScrollView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeModel = Provider.of<ThemeModel>(context);
    return SingleChildScrollView(
      child: Column(children: [
        ListTile(
          contentPadding: const EdgeInsets.all(20),
          leading: const Icon(Icons.person_2_rounded),
          title: const Text(
            "Profile",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Arial',
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/profile');
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(20),
          leading: const Icon(Icons.wb_sunny_outlined),
          title: const Text(
            "Dark Mode",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Arial',
            ),
          ),
          onTap: () {
            themeModel.toggleTheme();
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(20),
          leading: const Icon(Icons.favorite_border_outlined),
          title: const Text(
            "Favorites",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Arial',
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, '/favorite');
          },
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(20),
          leading: const Icon(Icons.notifications),
          title: const Text(
            "Notifications",
            style: TextStyle(
              fontSize: 20,
              fontFamily: 'Arial',
            ),
          ),
          onTap: () {},
        ),
      ]),
    );
  }
}
