import 'package:coffee_shop/core/exceptions/entity_exception.dart';
import 'package:coffee_shop/data/data_sources/product_data_source.dart';
import 'package:coffee_shop/data/requests/buy_coffee_request.dart';
import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/domain/repositories/product_repository.dart';
import 'package:coffee_shop/presentation/product/widgets/select_size.dart';
import 'package:flutter_lorem/flutter_lorem.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductDataSource _dataSource;

  ProductRepositoryImpl({
    required ProductDataSource dataSource,
  }) : _dataSource = dataSource;

  @override
  Future<List<Coffee>> getCoffeeProducts() async {
    final response = await _dataSource.getCoffeeProducts();
    return response
        .map((e) {
          try {
            return Coffee.fromEntity(e);
          } on InvalidEntityException catch (ex) {
            return null;
          }
        })
        .whereType<Coffee>()
        .toList();

    // await Future.delayed(Duration(seconds: 1));
    //
    // return [
    //   Coffee(
    //     id: "1",
    //     name: "Iced Latte",
    //     shortDescription: "Chill",
    //     description: lorem(words: 40),
    //     imageUrl:
    //         "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?q=80&w=2938&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    //     type: CoffeeType.white,
    //     price: 12.0,
    //     rating: 4.8,
    //     ratingCount: 2300,
    //   ),
    //   Coffee(
    //     id: "2",
    //     name: "Flat White",
    //     shortDescription: "Smooth",
    //     description: lorem(words: 40),
    //     imageUrl:
    //         "https://images.unsplash.com/photo-1499571883643-44e68963973d?q=80&w=2560&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    //     type: CoffeeType.white,
    //     price: 12.0,
    //     rating: 4.7,
    //     ratingCount: 2100,
    //   ),
    //   Coffee(
    //     id: "3",
    //     name: "Cappuccino",
    //     shortDescription: "Deep Foam",
    //     description: lorem(words: 40),
    //     imageUrl:
    //         "https://images.unsplash.com/photo-1495774856032-8b90bbb32b32?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    //     type: CoffeeType.white,
    //     price: 12.0,
    //     rating: 4.8,
    //     ratingCount: 2600,
    //   ),
    //   Coffee(
    //     id: "4",
    //     name: "Caffe Mocha",
    //     shortDescription: "Chocolaty",
    //     description: lorem(words: 40),
    //     imageUrl:
    //         "https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    //     type: CoffeeType.chocolate,
    //     price: 14.0,
    //     rating: 4.7,
    //     ratingCount: 2400,
    //   ),
    //   Coffee(
    //     id: "5",
    //     name: "Espresso",
    //     shortDescription: "Strong Flavor",
    //     description: lorem(words: 40),
    //     imageUrl:
    //         "https://plus.unsplash.com/premium_photo-1675435644687-562e8042b9db?q=80&w=2849&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    //     type: CoffeeType.black,
    //     price: 10.0,
    //     rating: 4.6,
    //     ratingCount: 2500,
    //   ),
    //   Coffee(
    //     id: "6",
    //     name: "Iced Americano",
    //     shortDescription: "Refreshing",
    //     description: lorem(words: 40),
    //     imageUrl:
    //         "https://images.unsplash.com/photo-1595520519770-15d19939e648?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    //     type: CoffeeType.black,
    //     price: 10.0,
    //     rating: 4.8,
    //     ratingCount: 2900,
    //   )
    // ];
  }

  @override
  Future<void> buyCoffee(String id, CoffeeSize size) async {
    final request = BuyCoffeeRequest(
      id: id,
      size: switch (size) {
        CoffeeSize.s => 0,
        CoffeeSize.m => 1,
        CoffeeSize.l => 2,
      },
    );
    await _dataSource.buyCoffee(request);
  }
}
