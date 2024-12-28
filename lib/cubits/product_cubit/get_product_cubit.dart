// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:task1/models/product_model.dart';
import 'package:task1/services/productservice.dart';

part 'get_product_cubit_state.dart';

class GetProductCubit extends Cubit<GetProductState> {
  GetProductCubit() : super(GetProductInitial());
  late ProductModel productModel;

  getProduct() async {
    emit(GetProductLoading());
    try {
      List<ProductModel> productlist = await Productservice().getProduct();
      emit(GetProductSuccess(productlist));
    } catch (e) {
      emit(GetProductfailure());
    }
  }
}
