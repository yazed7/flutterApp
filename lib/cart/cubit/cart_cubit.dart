import 'package:bloc/bloc.dart';

import '../../Product/Database/entity_model/product_model.dart';
import '../../Product/Database/repo/database_repo.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartStateLoading()) {
    init();
  }
    double totalPrice = 0.0;
  
  double getTotalPrice() {
    for (var product in products) {
      totalPrice += (product.price! * (product.quantity ?? 1));
    }
    return totalPrice;
  }

  List<ProductModel> products = [];
  DatabaseRepo db = DatabaseRepo();
  Future<void> init() async {
    emit(CartStateLoading());
    await db.initDB();

    products = await db.getCartProducts();
    getTotalPrice();
    if (products.isEmpty) {
      emit(CartStateEmpty());
    } else {
      emit(CartStateLoaded());
    }
  }

  Future<void> addItemToCart(int id, bool value, int quantity) async {
    db.updateCart(id, value, quantity);
    init();
    emit(CartStateLoaded());
  }

  void updatequantity(int id, int quantity) async {
    db.newQuantity(ProductModel(id: id, quantity: quantity));
    init();
    emit(CartStateLoaded());
  }
}
