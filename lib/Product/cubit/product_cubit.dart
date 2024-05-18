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
    //   name: 'DOUBLE MUSHROOM SWISS',
    //   image: 'assets/images/product_02.png',
    //   description: '''
    //        Can't get enough of that heavenly creamy taste? Go for double the goodness! Melted Swiss cheese on two flame-grilled beef patties, topped with BK's special mushroom sauce, served on a sesame seed bun. Twice the velvety goodness in every bite.
    //         ''',
    //   price: 145,
    //   favorite: 0,
    //   cart: 0,
    // ));
    // await db.deleteProduct(ProductModel(id: 15));
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

  void addItemtoCart(int id, int value) {
    db.updateCart(value, id);
    init();
    emit(ProductStateLoaded());
  }
}
