import 'package:bloc/bloc.dart';
import 'package:restaurant/Admin/ProductView/cubit/productview_state.dart';
import 'package:restaurant/Product/Database/entity_model/product_model.dart';
import 'package:restaurant/Product/Database/repo/database_repo.dart';

class ProductViewCubit extends Cubit<ProductViewState> {
  final DatabaseRepo databaseRepo = DatabaseRepo();

  ProductViewCubit() : super(ProductViewStateLoading()) {
    fetchProducts();
  }

  List<ProductModel> products = [];

  Future<void> fetchProducts() async {
    emit(ProductViewStateLoading());
    await databaseRepo.initDB();
    products = await databaseRepo.getAllProducts();
    if (products.isEmpty) {
      emit(ProductViewStateEmpty());
    } else {
      emit(ProductViewStateLoaded());
    }
  }

  Future<void> deleteProduct(ProductModel product) async {
    await databaseRepo.deleteProduct(product.id!);
    products.remove(product);
    emit(ProductViewStateLoaded());
  }
}
