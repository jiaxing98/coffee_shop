part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {
  const ProductEvent();
}

class ProductPurchase extends ProductEvent {
  final String id;
  final CoffeeSize size;

  const ProductPurchase({required this.id, required this.size});
}
