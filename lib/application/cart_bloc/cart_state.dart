 class CartState {
  final int count;
  CartState({required this.count});
}

class CartInitialState extends CartState {
  CartInitialState():super(count: 0);
}

