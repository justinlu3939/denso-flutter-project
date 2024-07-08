//this is to provide a better model for the products in the item list when doing the favorites page
//in favorites, it will be easier to get the items from this page rather than typing it from scratch
//if you proceed with adding this to your project, make sure you create another dart file that provides the blueprint for each of the list tiles in itemList.dart
class DataModel{
  final String title;
  final String imageName;
  final String description;
  DataModel(
    this.title,
    this.imageName,
    this.description,
  );
}

List<DataModel> dataList = [
  DataModel('A/C & Engine Cooling', 'Images/example1.jpg', 'description'),
  DataModel('Article 2', 'Images/example2.jpg', 'description'),
  DataModel('Article 3', 'Images/example3.jpg', 'description'),
  DataModel('Article 4', 'Images/example4.jpg', 'description'),
  DataModel('Article 4', 'Images/example4.jpg', 'description'),
  DataModel('Article 4', 'Images/example4.jpg', 'description'),
  DataModel('Article 4', 'Images/example4.jpg', 'description'),
];