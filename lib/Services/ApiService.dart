import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio();

  getHttp(String category) async {
    try {
      late Response response;
      if (category != "All") {
        response =         
            await dio.get('https://fakestoreapi.com/products/category/${category}');
      } else {
        response = await dio.get('https://fakestoreapi.com/products');
      }
      return response.data;
    } catch (e) {
      print(e);
      print("erooooooooooooooooooooooooooooooooooooooooooooooooooooooooor");
      print(e);
      return [];
    }
    ;
  }
}
