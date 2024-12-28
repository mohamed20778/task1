part of 'get_product_cubit.dart';

@immutable
sealed class GetProductState {}

final class GetProductInitial extends GetProductState {}

final class GetProductLoading extends GetProductState {}

// ignore: must_be_immutable
final class GetProductSuccess extends GetProductState {
  List<ProductModel> productlist;
  GetProductSuccess(this.productlist);
}

final class GetProductfailure extends GetProductState {}
