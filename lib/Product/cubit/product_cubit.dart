import 'package:bloc/bloc.dart';
import '../Database/entity_model/product_model.dart';
import '../Database/repo/database_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductStateLoading()) {
    init();
  }
  final DatabaseRepo db = DatabaseRepo();
  List<ProductModel> products = [];

  Future<void> init() async {
    emit(ProductStateLoading());
    await db.initDB();
    products = await db.getAllProducts();
    if (products.isEmpty) {
      emit(ProductStateEmpty());
    } else {
      emit(ProductStateLoaded());
    }
  }

  Future<void> addItemToFavorite(int id, int value) async {
    db.updateFavorite(value, id);
    await db.getFavoriteProducts();
    init();
    emit(ProductStateLoaded());
  }

  Future<void> addItemToCart(int id, bool value, int quantity) async {
    db.updateCart(id, value, quantity);
    init();
    emit(ProductStateLoaded());
  }

  Future<void> updateQuantity(ProductModel product, int quantity) async {
    await db.updateQuantity(product, quantity);
    init();
    emit(ProductStateLoaded());
  }


  Future<void> increaseProductQuantity(ProductModel product) async {
    if (product.quantity != null) {
      product.quantity = product.quantity! + 1;
      await db.newQuantity(product);
      emit(ProductStateLoaded());
    }
  }

  Future<void> decreaseProductQuantity(ProductModel product) async {
    if (product.quantity != null && product.quantity! > 1) {
      product.quantity = product.quantity! - 1;
      await db.newQuantity(product);
      emit(ProductStateLoaded());
    }
  }
}
