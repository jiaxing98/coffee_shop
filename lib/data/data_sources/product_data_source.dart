import 'package:coffee_shop/data/entities/coffee_entity.dart';
import 'package:coffee_shop/data/requests/buy_coffee_request.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'product_data_source.g.dart';

abstract class ProductDataSource {
  Future<List<CoffeeEntity>> getCoffeeProducts();

  Future<void> buyCoffee(BuyCoffeeRequest request);
}

@RestApi(baseUrl: "https://jsonplaceholder.typicode.com/")
abstract class ProductDataSourceImpl extends ProductDataSource {
  factory ProductDataSourceImpl(Dio dio, {String baseUrl}) = _ProductDataSourceImpl;

  @override
  @GET('/coffee')
  Future<List<CoffeeEntity>> getCoffeeProducts();

  @override
  @POST('/coffee')
  Future<void> buyCoffee(@Body() BuyCoffeeRequest request);
}