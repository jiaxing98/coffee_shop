import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/presentation/product/widgets/select_size.dart';

abstract class ProductRepository {
  Future<List<Coffee>> getCoffeeProducts();
  Future<void> buyCoffee(String id, CoffeeSize size);
}
