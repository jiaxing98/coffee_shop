import 'package:coffee_shop/data/repositories/product_repository_impl.dart';
import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/domain/repositories/product_repository.dart';
import 'package:coffee_shop/presentation/home/blocs/coffee_bloc.dart';
import 'package:coffee_shop/presentation/product/blocs/product_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void injectDependencies() {
  _injectRepositories();
  _injectBlocs();
}

void _injectRepositories() {
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl());
}

void _injectBlocs() {
  // ! singleton

  // ! factory
  sl.registerFactory<CoffeeBloc>(
    () => CoffeeBloc(repository: sl.get<ProductRepository>()),
  );

  sl.registerFactoryParam<ProductBloc, Coffee, void>(
    (coffee, _) => ProductBloc(repository: sl.get<ProductRepository>(), selectedCoffee: coffee),
  );
}
