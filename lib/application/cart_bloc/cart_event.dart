

abstract class CartEvent {}

class CartIncrementEvent extends CartEvent {
  final String title;
  final String price;
  final String image;

  CartIncrementEvent({required this.title, required this.price, required this.image});
  
}

class CartDecrementEvent extends CartEvent{
  final String title;

  CartDecrementEvent({required this.title});
  
}
