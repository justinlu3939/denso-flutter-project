import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/components/filterItemData.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends State<Favorites> {
  @override
  Widget build(BuildContext context) {
    List<ProductData> products = getProductData();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Favorites',
          //this changes the font, etc. of a text directly
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        shadowColor: Colors.black12,
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: Hive.box('favorites').listenable(), 
        builder: (context, box, child){
          List<ProductData> favoriteProducts = products.where((product) {
            final index = products.indexOf(product);
            return box.get(index) != null;
          }).toList();
          return ListView.builder(
            itemCount: favoriteProducts.length,
            itemBuilder: (context, index) {
              final product = favoriteProducts[index];
              final isFavorite = box.get(products.indexOf(product)) != null;
                return ListTile(
                contentPadding: const EdgeInsets.all(20),
                leading: Image.asset(product.image, width: 90, height: 90,),
                title: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 20,
                    fontFamily: 'Times New Roman',
                  ),
                ),
                subtitle: Text(product.description),
                //tileColor: Colors.blue,
                hoverColor: Colors.red,
                focusColor: Colors.white,
                trailing: IconButton(onPressed: () async {
                  ScaffoldMessenger.of(context).clearSnackBars();
                  if(isFavorite) {
                    await box.delete(index);
                    const snacky = SnackBar(content: Text('Removed from Favorites'), backgroundColor: Colors.red,);
                    ScaffoldMessenger.of(context).showSnackBar(snacky);
                  }
                  else {
                    await box.put(index, product.name);
                    const snacky = SnackBar(content: Text('Added to Favorites'), backgroundColor: Colors.blue,);
                    ScaffoldMessenger.of(context).showSnackBar(snacky);
                  }
                } ,
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border_outlined), color: Colors.red,),
                onTap: () {
                  Navigator.pushNamed(context, '/webviewcontainer',
                                      arguments: product.arguments);
                },
              );
            }
          );
        }
      ),
    );
  }
}