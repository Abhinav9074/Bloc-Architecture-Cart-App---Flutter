 class CartState {
  final int count;
  final Map<String,dynamic>productsQuantity;
  final Map<String,dynamic>productsPrice;
  final Map<String,dynamic>productsImage;
  CartState({required this.count,required this.productsQuantity,required this.productsPrice,required this.productsImage});
}

class CartInitialState extends CartState {
  CartInitialState():super(count: 0,productsQuantity: {},productsImage: {},productsPrice: {});
}

