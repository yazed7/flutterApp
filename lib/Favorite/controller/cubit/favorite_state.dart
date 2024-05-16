part of 'favorite_cubit.dart';

sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}

final class FavoriteStateLoading extends FavoriteState {}

final class FavoriteStateLoaded extends FavoriteState {}

final class FavoriteStateEmpty extends FavoriteState {}
