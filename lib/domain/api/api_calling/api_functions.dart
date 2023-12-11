
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_project/domain/models/products_model.dart';



Future<dynamic>login(userName,password)async{
  Uri url = Uri.parse('https://fakestoreapi.com/auth/login');

  final response = await http.post(url
  ,body: {
    'username' : userName,
    'password' : password
    
  });

  return response;
}


Future<List<ProductsModel>>fetchAllProducts()async{
  String url = "https://fakestoreapi.com/products";
  final response = await http.get(Uri.parse(url));
  if(response.statusCode == 200){
    final data = json.decode(response.body);
    List<dynamic>products = data;
    return products.map((json) =>ProductsModel.fromJson(json)).toList();
  }else{
    throw Exception('Could Not Fetch Products');
  }
}
