import 'package:bloc/bloc.dart';

import '../../../Product/Database/entity_model/product_model.dart';
import '../../../Product/Database/repo/database_repo.dart';
part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  FavoriteCubit() : super(FavoriteStateLoading()) {
    init();
  }

  List<ProductModel> products = [];
  DatabaseRepo db = DatabaseRepo();
  Future<void> init() async {
    emit(FavoriteStateLoading());
    await db.initDB();

    products = await db.getFavoriteProducts();

    if (products.isEmpty) {
      emit(FavoriteStateEmpty());
    } else {
      emit(FavoriteStateLoaded());
    }
  }

  void addItemtoFavorite(int id, int value) {
    db.updateFavorite(value, id);
    init();
    emit(FavoriteStateLoaded());
  }


}
