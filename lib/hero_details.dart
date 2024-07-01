import 'package:flutter/material.dart';
import 'package:my_app/components/data.dart';

class HeroDetails extends StatelessWidget{
  final DataModel dataList;
  const HeroDetails ({super.key, required this.dataList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(dataList.title),
      ),

      body: Hero(
        tag: dataList.imageName,
        child: Column(
          children: [
            Image.asset(dataList.imageName),
            const SizedBox(height: 20),
            Text(dataList.description),
          ],
        ),
        ),
    );
    
  }
}