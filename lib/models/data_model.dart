class DataModel {
  final String title;
  final String imageName;
  final String platform;
  DataModel(
    this.title,
    this.imageName,
    this.platform,
  );
}

List<DataModel> dataList = [
  // DataModel("Captain America", "assets/images/image.png", 300.8),
  // DataModel("Iron Man", "assets/images/fashion2.png", 245.2),
  DataModel("Captain America", "assets/images/image.png", "Facebook"),
  DataModel("Iron Man", "assets/images/image2.png", "Instagram"),
  DataModel("Hulk", "assets/images/image3.png", "Youtube"),
];
