import 'package:bloc/bloc.dart';
import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository _repository;
  ProductBloc({
    required ProductRepository repository,
    required Coffee selectedCoffee,
  })  : _repository = repository,
        super(ProductPurchaseInitial()) {
    on<ProductPurchase>(_purchaseProduct);
  }

  Future<void> _purchaseProduct(ProductPurchase event, Emitter<ProductState> emit) async {
    emit(ProductPurchaseLoading());

    try {
      await _repository.buyCoffee(event.id);
      emit(ProductPurchaseSuccess());
    } on Exception catch (ex) {
      emit(ProductPurchaseFailure(exception: ex));
    }
  }
}
