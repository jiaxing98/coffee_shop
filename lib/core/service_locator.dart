import 'package:coffee_shop/core/theme/theme.dart';
import 'package:coffee_shop/data/data_sources/product_data_source.dart';
import 'package:coffee_shop/data/repositories/product_repository_impl.dart';
import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/domain/repositories/product_repository.dart';
import 'package:coffee_shop/mock/product_data_source_mock.dart';
import 'package:coffee_shop/presentation/home/blocs/coffee_bloc.dart';
import 'package:coffee_shop/presentation/product/blocs/product_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt sl = GetIt.instance;

Future<void> initializedApp() async {
  // Initialized SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerSingleton<SharedPreferences>(sharedPreferences);

  // Initialized ThemeCubit
  final defaultTheme = (light: CoffeeShopX.light(), dark: CoffeeShopX.dark());
  final theme = sl.registerSingleton<ThemeCubit>(
      ThemeCubit(sp: sharedPreferences, defaultTheme: defaultTheme));
  theme.loadTheme();

  // Initialized Dio
  sl.registerSingleton<Dio>(Dio());

  // For the sake of mocking
  ProductDSMock(dio: sl.get<Dio>()).mockProductDS();
}

void injectDependencies() {
  _injectDataSources();
  _injectRepositories();
  _injectBlocs();
}

void _injectDataSources() {
  sl.registerSingleton<ProductDataSource>(ProductDataSourceImpl(sl.get<Dio>()));
}

void _injectRepositories() {
  sl.registerSingleton<ProductRepository>(ProductRepositoryImpl(dataSource: sl.get<ProductDataSource>()));
}

void _injectBlocs() {
  // ! singleton

  // ! factory
  sl.registerFactory<CoffeeBloc>(
    () => CoffeeBloc(repository: sl.get<ProductRepository>()),
  );

  sl.registerFactoryParam<ProductBloc, Coffee, void>(
    (coffee, _) => ProductBloc(
        repository: sl.get<ProductRepository>(), selectedCoffee: coffee),
  );
}
