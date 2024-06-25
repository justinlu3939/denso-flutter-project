import 'package:flutter/material.dart';
import 'package:my_app/navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';

//might potentially use this dependency
//import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: const Text('Homepage'),
        centerTitle: true,
      ),
      body: const HomePage(),
    );
  }
}

class WelcomeText extends StatelessWidget
{
  const WelcomeText({super.key});
  @override
  Widget build(BuildContext context)
  {
    return const Text(
            'Welcome to the Denso Homepage\nname of client',
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const WelcomeText(),
            const SizedBox(height: 20),
            CarouselSlider(
              items: [1, 2, 3, 4].map((i) {
                return Container(
                  //this makes each container widget width fit the entire screen
                  width: MediaQuery.of(context).size.width,
                  //this sets the space between each of the container widgets
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    //use the color gray to check the size of the widgets
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text("text: $i"),
                  ),
                );
              }).toList(),
              options: CarouselOptions(height: 250),
            )
          ],
        ),
      ),
    );
  }
}

//https://www.denso.com/global/en/news/newsroom/2024/20240613-g01
