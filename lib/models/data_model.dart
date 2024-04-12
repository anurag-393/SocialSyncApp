class DataModel {
  final String title;
  final String imageName;
  final double price;
  DataModel(
    this.title,
    this.imageName,
    this.price,
  );
}

List<DataModel> dataList = [
  // DataModel("Captain America", "assets/images/image.png", 300.8),
  // DataModel("Iron Man", "assets/images/fashion2.png", 245.2),
  DataModel("Captain America", "assets/images/image.png", 168.2),
  DataModel("Iron Man", "assets/images/image2.png", 136.7),
  DataModel("Hulk", "assets/images/image3.png", 136.7),
];
