import 'package:coffee_shop/domain/models/coffee.dart';

abstract class ProductRepository {
  Future<List<Coffee>> getCoffeeProducts();
}
