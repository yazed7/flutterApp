part of 'delete_cubit.dart';

sealed class DeleteState {}

final class DeleteInitial extends DeleteState {}

class DeleteProductLoading extends DeleteState {}

class DeleteProductSuccess extends DeleteState {}

class DeleteProductError extends DeleteState {
  final String message;

  DeleteProductError(this.message);
}
