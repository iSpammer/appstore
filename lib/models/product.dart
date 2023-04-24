class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final double? rating; // rating can be null
  final List<String> colors;
  final List<String> images;
  final String brandName; // brandName is a string type

  Product({
    required this.id, // id is required
    required this.title, // title is required
    required this.description, // description is required
    required this.price, // price is required
    this.rating,
    required this.colors, // colors is required
    required this.images, // images is required
    required this.brandName, // brandName is required
  });

  // A method to create a Product object from a map
  factory Product.fromMap(String docID, Map<String, dynamic> map) {
    return Product(
      id: docID,
      title: map['title'],
      description: map['description'],
      price: map['price'],
      rating: map['rating'],
      colors: List<String>.from(map['colors']),
      images: List<String>.from(map['images']),
      brandName: map['brandName'], // get the brandName from the map
    );
  }

  // A method to convert a Product object to a map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'price': price,
      'rating': rating,
      'colors': colors,
      'images': images,
      'brandName': brandName, // add the brandName to the map
    };
  }
}
