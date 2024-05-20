import 'dart:typed_data';

class ProductModel {
  String? name, description;
  int? favorite, cart, id, quantity, price;
  Uint8List? image;

  ProductModel({
    this.name,
    this.description,
    this.favorite,
    this.cart,
    this.id,
    this.quantity,
    this.price,
    this.image,
  });
}
