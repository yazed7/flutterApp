import 'dart:typed_data';

import 'package:sqflite/sqflite.dart';

import '../entity_model/product_model.dart';

class DatabaseRepo {
  late Database db;

  Future<void> initDB() async {
    db = await openDatabase(
      '${await getDatabasesPath()}/ProductsDB.db',
      version: 1,
      onCreate: _onCreate,
      onUpgrade: (db, int oldVersion, int newVersion) async {
        await db.execute('''DROP TABLE product''');
        await _onCreate(db, newVersion);
      },
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''CREATE TABLE product(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
          name TEXT NOT NULL,
          image BLOB,
          description TEXT,
          quantity INTEGER,
          price INTEGER,
          favorite INTEGER,
          cart INTEGER)''');
  }

  Future<List<ProductModel>> getAllProducts() async {
    List<Map> maps = await db.query('product', columns: [
      'id',
      'name',
      'image',
      'description',
      'quantity',
      'price',
      'favorite',
      'cart'
    ]);
    List<ProductModel> products = [];
    if (maps.isNotEmpty) {
      for (var i = 0; i < maps.length; i++) {
        Map map = maps[i];
        Uint8List? imageData = map['image'] != null
            ? Uint8List.fromList(map['image'] as List<int>)
            : null;
        ProductModel product = ProductModel(
          id: map['id'],
          name: map['name'],
          image: imageData,
          description: map['description'],
          quantity: map['quantity'],
          price: map['price'],
          favorite: map['favorite'],
          cart: map['cart'],
        );
        products.add(product);
      }
    }
    return products;
  }

  Future<List<ProductModel>> getFavoriteProducts() async {
    List<Map> maps = await db.query('product',
        where: 'favorite = ?',
        whereArgs: [
          1
        ],
        columns: [
          'id',
          'name',
          'image',
          'description',
          'quantity',
          'price',
          'favorite',
          'cart'
        ]);
    List<ProductModel> favProducts = [];
    if (maps.isNotEmpty) {
      for (var i = 0; i < maps.length; i++) {
        Map map = maps[i];
        Uint8List? imageData = map['image'] != null
            ? Uint8List.fromList(map['image'] as List<int>)
            : null;
        ProductModel product = ProductModel(
          id: map['id'],
          name: map['name'],
          image: imageData,
          description: map['description'],
          quantity: map['quantity'],
          price: map['price'],
          favorite: map['favorite'],
          cart: map['cart'],
        );
        favProducts.add(product);
      }
    }
    return favProducts;
  }

  Future<List<ProductModel>> getCartProducts() async {
    List<Map> maps = await db.query('product', where: 'cart = ?', whereArgs: [
      1
    ], columns: [
      'id',
      'name',
      'image',
      'description',
      'quantity',
      'price',
      'favorite',
      'cart'
    ]);
    List<ProductModel> cartProducts = [];
    if (maps.isNotEmpty) {
      for (var i = 0; i < maps.length; i++) {
        Map map = maps[i];
        Uint8List? imageData = map['image'] != null
            ? Uint8List.fromList(map['image'] as List<int>)
            : null;
        ProductModel product = ProductModel(
          id: map['id'],
          name: map['name'],
          image: imageData,
          description: map['description'],
          quantity: map['quantity'],
          price: map['price'],
          favorite: map['favorite'],
          cart: (map['cart'] == 1) ? 1 : 0,
        );
        cartProducts.add(product);
      }
    }
    return cartProducts;
  }

  Future<int> updateQuantity(ProductModel product, int quantity) async {
    return await db.update(
      'product',
      {'quantity': quantity},
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  void updateCart(int id, bool value, int quantity) {
    db.update(
      'product',
      {
        'cart': value ? 1 : 0,
        'quantity': quantity,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  updateFavorite(int fav, int id) {
    db.update(
      'product',
      {
        'favorite': fav,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteProduct(int id) async {
    return await db.delete(
      'product',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> newQuantity(ProductModel product) async {
    return await db.update(
      'product',
      {
        'quantity': product.quantity,
      },
      where: 'id = ?',
      whereArgs: [product.id],
    );
  }

  Future<ProductModel> insertProductToDB(ProductModel productModel) async {
    int id = await db.insert('product', {
      'name': productModel.name,
      'description': productModel.description,
      'quantity': productModel.quantity,
      'price': productModel.price,
      'image': productModel.image?.toList(),
      'favorite': 0,
      'cart': 0,
    });
    productModel.id = id;
    return productModel;
  }

  Future<void> deleteAllCartProducts() async {
    print('Deleting all products from the cart in DatabaseRepo...');

    await initDB();
    await db.update(
      'product',
      {'cart': 0},
    );
    print('All products deleted from the cart in DatabaseRepo.');
  }
}
