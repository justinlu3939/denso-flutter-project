class ProductData {
  String name;
  String description;
  String image;
  String arguments;

  ProductData({
    required this.name,
    required this.description,
    required this.image,
    required this.arguments,
  });
}

List<ProductData> getProductData() {
  return [
    ProductData(
      name: 'Air Filter', 
      description: 'These filters are used to to clean the air that circulates through your heating and cooling system.', 
      image: 'Images/airfilter.png',
      arguments: 'airfilter'),
    ProductData(name: 'Cabin Air Filter', 
    description: 'These filters are used to help keep the vehicle air clean and fresh.', 
    image: 'Images/cabinfilter.png',
    arguments: 'cabinfilter'),
    ProductData(name: 'Oil Filter', 
    description: 'These filters are used helps remove contaminants from your car engine\'s oil that can accumulate over time as the oil keeps your engine clean.', 
    image: 'Images/oilfilter.png',
    arguments: 'oilfilter'),
  ];
}