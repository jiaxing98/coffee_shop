part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {
  const ProductState();

  @override
  List<Object?> get props => [];
}

class ProductPurchaseInitial extends ProductState {}

class ProductPurchaseLoading extends ProductState {}

class ProductPurchaseSuccess extends ProductState {}

class ProductPurchaseFailure extends ProductState {
  final Exception exception;

  const ProductPurchaseFailure({required this.exception});
}
