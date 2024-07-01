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

class WelcomeText extends StatelessWidget {
  const WelcomeText({super.key});
  @override
  Widget build(BuildContext context) {
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

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                    padding: EdgeInsets.only(left: 20), child: WelcomeText())),
            const SizedBox(height: 20),
            //insert the carouself here
            CarouselSlider(
              items: dataList.map((item) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    //color: Theme.of(context).primaryColor,
                    color: Colors.red[400],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                item.imageName,
                                fit: BoxFit.cover,
                                height: 190,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.title,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                item.description,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 300,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    activeIndex = index;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),
            // buildIndictor(),
            AnimatedSmoothIndicator(
              activeIndex: activeIndex,
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
