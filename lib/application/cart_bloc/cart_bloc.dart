import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/application/cart_bloc/cart_event.dart';
import 'package:mini_project/application/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartIncrementEvent>((event, emit) {
      Map<String,dynamic>tempQty = state.productsQuantity;
      Map<String,dynamic>tempPrice = state.productsPrice;
      Map<String,dynamic>tempImg = state.productsImage;

   
      tempQty[event.title] = (tempQty[event.title]??0)+1;
      tempImg[event.title] = event.image;
      tempPrice[event.title] = event.price;
       emit(CartState(count: state.count+1,productsQuantity: tempQty,productsImage: tempImg,productsPrice: tempPrice));
    });

    on<CartDecrementEvent>((event, emit){
      Map<String,dynamic>tempQty = state.productsQuantity;
      Map<String,dynamic>tempPrice = state.productsPrice;
      Map<String,dynamic>tempImg = state.productsImage;

      tempQty[event.title] = tempQty[event.title]-1;
      if(tempQty[event.title]<=0){
        tempQty.remove(event.title);
      }
       emit(CartState(count: state.count-1,productsQuantity: tempQty,productsImage: tempImg,productsPrice: tempPrice));
    });
  }

  
}
