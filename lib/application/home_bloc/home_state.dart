import 'package:mini_project/domain/models/products_model.dart';

abstract class HomeState{}

class HomeInitialState extends HomeState{}

class HomeProductsLoadingState extends HomeState{}

class HomeProductsLoadedState extends HomeState{
  final List<ProductsModel> allProducts;

  HomeProductsLoadedState({required this.allProducts});
}

class HomeProductsLoadingFailedState extends HomeState{
  final String errorMessage;

  HomeProductsLoadingFailedState({required this.errorMessage});
  
}