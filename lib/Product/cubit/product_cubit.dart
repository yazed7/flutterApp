import 'package:bloc/bloc.dart';

import '../Database/entity_model/product_model.dart';
import '../Database/repo/database_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductStateLoading()) {
    init();
  }
  List<ProductModel> products = [];
  DatabaseRepo db = DatabaseRepo();
  Future<void> init() async {
    emit(ProductStateLoading());
    await db.initDB();
    // await db.insertProduct(ProductModel(
    //   name: 'CHEESEBURGER',
    //   image: 'assets/images/product_01.png',
    //   description: '''
    //        You can’t go wrong with our cheeseburger, a signature flame-grilled beef patty topped with a simple layer of melted American cheese, crinkle cut pickles, yellow mustard, and ketchup on a toasted sesame seed bun.
    //         ''',
    //   price: 130,
    //   favorite: 0,
    //   cart: 0,
    // ));
    await db.deleteProduct(ProductModel(id: 10));
    products = await db.getAllProducts();

    if (products.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  void addItemtoFavorite(int id, int value) {
    db.updateFavorite(value, id);
    init();
    emit(ProductStateLoaded());
  }

  void addItemtoCart(int id) async {
    db.updateCart(1, id);
    emit(ProductStateLoaded());
  }
}
