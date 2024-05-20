import 'package:bloc/bloc.dart';

import '../../Product/Database/entity_model/product_model.dart';
import '../../Product/Database/repo/database_repo.dart';

part 'delete_state.dart';

class DeleteCubit extends Cubit<DeleteState> {
  final DatabaseRepo _db;
  DeleteCubit()
      : _db = DatabaseRepo(),
        super(DeleteInitial());

  Future<void> deleteProduct(int id) async {
    emit(DeleteProductLoading());
    final product = ProductModel(
      id: id,
    );
    _db.initDB();
    await _db.deleteProductfromDB(product);
    emit(DeleteProductSuccess());
  }
}
