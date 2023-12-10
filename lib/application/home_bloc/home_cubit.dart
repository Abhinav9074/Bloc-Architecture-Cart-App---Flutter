import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/application/home_bloc/home_state.dart';
import 'package:mini_project/domain/api/api_calling/api_functions.dart';
import 'package:mini_project/domain/models/products_model.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeInitialState()){
    emit(HomeProductsLoadingState());
    fetchProducts();
  }

  void fetchProducts()async{
    try{
      // print(await fetchAllProducts());
      List<ProductsModel> allProducts = await fetchAllProducts();
      emit(HomeProductsLoadedState(allProducts: allProducts));
    }catch(e){
      emit(HomeProductsLoadingFailedState(errorMessage: e.toString()));
    }

  }
}