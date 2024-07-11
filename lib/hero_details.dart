import 'package:flutter/material.dart';
import 'package:my_app/components/newsdata.dart';

class HeroDetails extends StatelessWidget{
  final DataModel item;
  const HeroDetails ({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),

      body: Hero(
        tag: item.imageName,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(item.imageName,
              width: MediaQuery.of(context).size.width,
              height: 400,
              ),
              const SizedBox(height: 10),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  item.description,
                  maxLines: 6,
                  overflow: TextOverflow.fade,
                  ),
                ),
              const SizedBox(height: 10,),
              Container(
                margin: const EdgeInsets.only(left: 30, right: 30),
                child: InkWell(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, '/webviewcontainer', arguments: item.websiteCode);
                    },
                    child: const Text(
                      'Click here to see more.',
                      style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.underline,
                      ),
                      ),
                  ),
                  ),
              ),
            ],
          ),
        ),
        ),
    );
    
  }
}