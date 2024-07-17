import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_app/WebViewContainer.dart';
import 'package:my_app/navbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:my_app/components/newsdata.dart';
import 'package:my_app/hero_details.dart';
import 'package:firebase_auth/firebase_auth.dart';

//this import is for the gradient text
//import 'dart:ui' as ui;

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
    // final primaryColor = Theme.of(context).primaryColor;
    // final inverseColor = primaryColor.computeLuminance() > 0.5
    //     ? Colors.white
    //     : Colors.black;
    var currentUser = FirebaseAuth.instance.currentUser;
    String? displayName = currentUser?.displayName;

    return Text(
      'Welcome to the Denso Homepage\n${displayName ?? 'Guest'}',
      textAlign: TextAlign.left,
      style: const TextStyle(
        fontSize: 20,
        //fontWeight: FontWeight.bold
        //fontStyle: FontStyle.italic,
        fontFamily: 'Arial',
        //   foreground: Paint()
        // ..shader = ui.Gradient.linear(
        //   const Offset(0, 20),
        //   const Offset(150, 20),
        //   <Color>[
        //     Colors.red,
        //     primaryColor,
        //   ],
        // )
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
  List<Image> imageList = [
    Image.asset('Images/autopart.png',),
    Image.asset('Images/core.png'),
    Image.asset('Images/product.png'),
    Image.asset('Images/news.jpeg'),
  ];
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
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) {
                      return HeroDetails(item: item);
                    }));
                  },
                  child: Hero(
                    tag: 'image_${item.imageName}',
                    child: Container(
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
                                    height: 180,
                                    width: MediaQuery.of(context).size.width,
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
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    item.description,
                                    overflow: TextOverflow.fade,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                    ),
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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

            const SizedBox(height: 20,),
            
            const Text('Helpful Links: ',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 20,
                fontFamily: 'Arial',
              ),
            ),

            //add the next widgets here.
            Padding(
              padding: const EdgeInsets.all(15),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 12, mainAxisSpacing: 12),
                itemCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, '/webviewcontainer',
                          arguments: 'website$index');
                      print((index));
                    },
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          // color: Colors.red,
                        ),
                        child: imageList[index],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
