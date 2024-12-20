part of 'coffee_bloc.dart';

@immutable
sealed class CoffeeEvent {}

class CoffeeFetch extends CoffeeEvent {}

class CoffeeFilter extends CoffeeEvent {
  final List<CoffeeType> filters;

  CoffeeFilter({required this.filters});
}
