import 'package:dio/dio.dart';
import 'package:task1/models/product_model.dart';

class Productservice {
  String url = 'https://api.escuelajs.co/api/v1/products';
  final dio = Dio();
  List<dynamic>? data;
  List<ProductModel> productlist = [];
  Future<List<ProductModel>> getProduct() async {
    var response = await dio.get(url);
    try {
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        for (int i = 0; i < data.length; i++) {
          productlist.add(ProductModel.fromjson(data[i]));
        }
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      print('Error: $e');
    }
    return productlist;
  }
}
