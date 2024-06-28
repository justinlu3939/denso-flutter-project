import 'package:flutter/material.dart';
import 'package:my_app/navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:my_app/components/data.dart';

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
            style: TextStyle(
              fontSize: 20, 
              //fontWeight: FontWeight.bold
              //fontStyle: FontStyle.italic,
            ),
          );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    int activeIndex = 0;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: WelcomeText())),
            const SizedBox(height: 20),
            //insert the carouself here
            CarouselSlider(
              items: [1, 2, 3, 4].map((i) {
                return Container(
                  //this makes each container widget width fit the entire screen
                  width: MediaQuery.of(context).size.width,
                  //this sets the space between each of the container widgets
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    //use the color gray to check the size of the widgets
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    //child: Text("text: $i"),
                    child: ClipRect(
                      //borderRadius: BorderRadius.circular(20),
                      child: Image.asset('Images/example$i.jpg', fit: BoxFit.cover,)),
                  ),
                );
              }).toList(),
                options: CarouselOptions(height: 250,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  activeIndex = index;
                },
              ),
            ),
            const SizedBox(height: 20),
            // buildIndictor(),
            AnimatedSmoothIndicator(activeIndex: activeIndex, 
              count: 4, 
              effect: const WormEffect(
                dotColor: Colors.red,
                activeDotColor: Colors.green,
                dotWidth: 10,
                dotHeight: 10,
                spacing: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}