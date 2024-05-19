part of 'cart_cubit.dart';

sealed class CartState {}

final class CartInitial extends CartState {}

final class CartStateLoading extends CartState {}

final class CartStateLoaded extends CartState {}

final class CartStateEmpty extends CartState {}
