part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {
  const ProductEvent();
}

class ProductPurchase extends ProductEvent {
  final String id;

  const ProductPurchase({required this.id});
}
