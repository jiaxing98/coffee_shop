part of 'coffee_bloc.dart';

@immutable
sealed class CoffeeState extends Equatable {
  final List<Coffee> coffee;

  const CoffeeState({required this.coffee});

  @override
  List<Object?> get props => [coffee];
}

final class CoffeeFetchLoading extends CoffeeState {
  const CoffeeFetchLoading() : super(coffee: const []);

  @override
  List<Object?> get props => [];
}

final class CoffeeFetchSuccess extends CoffeeState {
  const CoffeeFetchSuccess({
    required super.coffee,
  });

  @override
  List<Object?> get props => [coffee];
}

final class CoffeeFetchFailure extends CoffeeState {
  final Exception exception;

  const CoffeeFetchFailure({
    required super.coffee,
    required this.exception,
  });

  @override
  List<Object?> get props => [coffee];
}
