class Item {
  String code;
  String name;
  String imageURI;
  String currentPrice;
  String previousPrice;
  String description;

  Item(
      {this.code,
      this.name,
      this.imageURI,
      this.currentPrice,
      this.previousPrice,
      this.description});

  factory Item.fromJson(Map<String, dynamic> parsedJson) {
    return Item(
        code: parsedJson['code'],
        name: parsedJson['name'],
        imageURI: parsedJson['imageURI'],
        currentPrice: parsedJson['costPrice'],
        previousPrice: parsedJson['sellPrice'],
        description: parsedJson['id']);
  }
}
