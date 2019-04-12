class Product {
  Product(
      {this.productFound,
      this.barcode,
      this.name,
      this.image,
      this.ingredients,
      this.quantity,
      this.nutritionImage,
      this.ingredientsImage,
      this.origins,
      this.manufacturingPlaces});

  bool productFound;
  String barcode;
  String name;
  String image;
  String ingredients;
  String quantity;
  String nutritionImage;
  String ingredientsImage;
  String origins;
  String manufacturingPlaces;

  Product.fromJson(Map json) {
    if (json["status"] == 0) {
      this.productFound = false;
    } else {
      this.productFound = true;
      this.barcode = json["code"];
      this.name = json["product"]["product_name"];
      this.ingredients = json["product"]["ingredients_text"];
      this.image = json["product"]["image_url"];
      this.manufacturingPlaces = json["product"]["manufacturing_places"];
      this.nutritionImage = json["product"]["image_nutrition_url"];
      this.ingredientsImage = json["product"]["image_ingredients_url"];
      this.origins = json["product"]["origins"];
      this.quantity = json["product"]["quantity"];
    }
  }

  @override
  String toString() {
    return "$name\n$barcode";
  }
}
