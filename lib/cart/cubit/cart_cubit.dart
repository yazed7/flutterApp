import 'package:bloc/bloc.dart';

import '../../Product/Database/entity_model/product_model.dart';
import '../../Product/Database/repo/database_repo.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartStateLoading()) {
    init();
  }
  List<ProductModel> products = [];
  DatabaseRepo db = DatabaseRepo();
  Future<void> init() async {
    emit(CartStateLoading());
    await db.initDB();

    products = await db.getCartProducts();

    if (products.isEmpty) {
      emit(CartStateEmpty());
    } else {
      emit(CartStateLoaded());
    }
  }

  void addItemtoCart(int id, bool value) async {
    db.updateCart(id, value);
    init();
    emit(CartStateLoaded());
  }

  void updatequantity(int id, int quantity) async {
    db.newQuantity(ProductModel(id: id, quantity: quantity));
    init();
    emit(CartStateLoaded());
  }
}
