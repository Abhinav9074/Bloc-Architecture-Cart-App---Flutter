import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_project/application/cart_bloc/cart_event.dart';
import 'package:mini_project/application/cart_bloc/cart_state.dart';

class CartBloc extends Bloc<CartIncrementEvent, CartState> {
  CartBloc() : super(CartInitialState()) {
    on<CartIncrementEvent>((event, emit) {
       emit(CartState(count: state.count+1));
    });
  }
}
