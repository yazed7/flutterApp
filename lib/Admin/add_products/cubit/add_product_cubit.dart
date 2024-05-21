
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant/Product/Database/entity_model/product_model.dart';
import 'package:restaurant/Product/Database/repo/database_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  final DatabaseRepo _db;

  AddProductCubit()
      : _db = DatabaseRepo(),
        super(AddProductInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  late XFile? image;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> addProduct() async {
    if (formKey.currentState!.validate()) {
      emit(AddProductLoading());
      final product = ProductModel(
        name: nameController.text,
        description: descriptionController.text,
        price: int.parse(priceController.text),
        image: await image!.readAsBytes(),
        favorite: 0,
        cart: 0,
        quantity: 1,
      );
      await _db.initDB();
      await _db.insertProductToDB(product);
      emit(AddProductSuccess());
    }
  }

  Future<void> pickImage() async {
    final ImagePicker imagePicker = ImagePicker();
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    emit(AddProductImageSelected());
  }

  String? nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a product name';
    }
    return null;
  }

  String? descriptionValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a product description';
    }
    return null;
  }

  String? priceValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a product price';
    }
    return null;
  }
}
