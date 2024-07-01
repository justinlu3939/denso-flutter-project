import 'package:flutter/material.dart';
import 'package:my_app/components/data.dart';

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
        child: Column(
          children: [
            Image.asset(item.imageName,
            width: MediaQuery.of(context).size.width,
            height: 400,
            ),
            const SizedBox(height: 20),
            Text(item.description),
          ],
        ),
        ),
    );
    
  }
}