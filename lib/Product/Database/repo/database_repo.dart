import 'package:sqflite/sqflite.dart';

import '../entity_model/product_model.dart';

class DatabaseRepo {
  late Database db;

  Future<void> initDB() async {
    db = await openDatabase(
      '${await getDatabasesPath()}/productDB.db',
      version: 1,
      onCreate: _onCraete,
      onUpgrade: (db, int oldVersion, int newVersion) async {
        await db.execute('''DROP TABLE product''');
        await _onCraete(db, newVersion);
      },
    );
  }

  _onCraete(db, version) async {
    await db.execute('''CREATE TABLE product(
          id INTEGER PRIMARY KEY AUTOINCREMENT,
             name TEXT NOT NULL,
             image TEXT,
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
        ProductModel product = ProductModel(
          id: map['id'],
          name: map['name'],
          image: map['image'],
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
    List<ProductModel> favproducts = [];
    if (maps.isNotEmpty) {
      for (var i = 0; i < maps.length; i++) {
        Map map = maps[i];
        ProductModel product = ProductModel(
          id: map['id'],
          name: map['name'],
          image: map['image'],
          description: map['description'],
          quantity: map['quantity'],
          price: map['price'],
          favorite: map['favorite'],
          cart: map['cart'],
        );
        favproducts.add(product);
      }
    }
    return favproducts;
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
    List<ProductModel> cartproducts = [];
    if (maps.isNotEmpty) {
      for (var i = 0; i < maps.length; i++) {
        Map map = maps[i];
        ProductModel product = ProductModel(
          id: map['id'],
          name: map['name'],
          image: map['image'],
          description: map['description'],
          quantity: map['quantity'],
          price: map['price'],
          favorite: map['favorite'],
          cart: (map['cart'] == 1) ? 1 : 0,
        );
        cartproducts.add(product);
      }
    }
    return cartproducts;
  }

  Future<ProductModel> insertProduct(ProductModel productModel) async {
    int id = await db.insert('product', {
      'name': productModel.name,
      'description': productModel.description,
      'quantity': productModel.quantity,
      'price': productModel.price,
      'image': productModel.image,
      'favorite': 0,
      'cart': 0,
    });
    productModel.id = id;
    return productModel;
  }

  Future<int> newQuantity(ProductModel product) async {
    int qnt = await db.update(
      'product',
      {
        'quantity': product.quantity,
      },
      where: 'id = ?',
      whereArgs: [product.id],
    );
    return qnt;
  }

  void updateCart(int id, bool value) {
    db.update(
      'product',
      {
        'cart': value ? 1 : 0,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  void updateFavorite(int fav, int id) {
    db.update(
      'product',
      {
        'favorite': fav,
      },
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<int> deleteProduct(ProductModel product) async {
    int id = await db.delete(
      'product',
      where: 'id = ?',
      whereArgs: [product.id],
    );
    return id;
  }
}
