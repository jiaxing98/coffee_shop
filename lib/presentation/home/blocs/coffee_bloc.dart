import 'package:bloc/bloc.dart';
import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/domain/repositories/product_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'coffee_event.dart';
part 'coffee_state.dart';

class CoffeeBloc extends Bloc<CoffeeEvent, CoffeeState> {
  final ProductRepository _repository;

  CoffeeBloc({required ProductRepository repository})
      : _repository = repository,
        super(const CoffeeFetchLoading()) {
    on<CoffeeFetch>(_fetchCoffee);
    on<CoffeeFilter>(_filterCoffee);
  }

  List<Coffee> coffee = [];

  Future<void> _fetchCoffee(CoffeeFetch event, Emitter<CoffeeState> emit) async {
    emit(const CoffeeFetchLoading());
    try {
      final coffee = await _repository.getCoffeeProducts();
      this.coffee = coffee;
      emit(CoffeeFetchSuccess(coffee: coffee));
    } on Exception catch (ex) {
      emit(CoffeeFetchFailure(coffee: state.coffee, exception: ex));
    }
  }

  Future<void> _filterCoffee(CoffeeFilter event, Emitter<CoffeeState> emit) async {
    if (state is! CoffeeFetchSuccess) return;

    event.filters.isEmpty
        ? emit(CoffeeFetchSuccess(coffee: coffee))
        : emit(
            CoffeeFetchSuccess(
                coffee: coffee.where((e) => event.filters.contains(e.type)).toList()),
          );
  }
}
