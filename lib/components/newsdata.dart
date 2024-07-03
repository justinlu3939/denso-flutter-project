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
  DataModel('Article 1', 'Images/example1.jpg', 'description'),
  DataModel('Article 2', 'Images/example2.jpg', 'description'),
  DataModel('Article 3', 'Images/example3.jpg', 'description'),
  DataModel('Article 4', 'Images/example4.jpg', 'description'),
];