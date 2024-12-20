import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  @override
  Future<List<Coffee>> getCoffeeProducts() async {
    await Future.delayed(Duration(seconds: 1));

    return [
      Coffee(
        id: "1",
        name: "Iced Latte",
        description: "Chill",
        imageUrl:
            "https://images.unsplash.com/photo-1461023058943-07fcbe16d735?q=80&w=2938&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        type: CoffeeType.white,
        price: 12.0,
        rating: 4.8,
      ),
      Coffee(
        id: "2",
        name: "Flat White",
        description: "Smooth",
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1673545518947-ddf3240090b1?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        type: CoffeeType.white,
        price: 12.0,
        rating: 4.7,
      ),
      Coffee(
        id: "3",
        name: "Cappuccino",
        description: "Deep Foam",
        imageUrl:
            "https://images.unsplash.com/photo-1495774856032-8b90bbb32b32?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        type: CoffeeType.white,
        price: 12.0,
        rating: 4.8,
      ),
      Coffee(
        id: "4",
        name: "Caffe Mocha",
        description: "Chocolaty",
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1674327105074-46dd8319164b?q=80&w=2940&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        type: CoffeeType.chocolate,
        price: 14.0,
        rating: 4.7,
      ),
      Coffee(
        id: "5",
        name: "Espresso",
        description: "Strong Flavor",
        imageUrl:
            "https://plus.unsplash.com/premium_photo-1675435644687-562e8042b9db?q=80&w=2849&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        type: CoffeeType.black,
        price: 10.0,
        rating: 4.6,
      ),
      Coffee(
        id: "6",
        name: "Iced Americano",
        description: "Refreshing",
        imageUrl:
            "https://images.unsplash.com/photo-1531835207745-506a1bc035d8?q=80&w=2787&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
        type: CoffeeType.black,
        price: 10.0,
        rating: 4.8,
      )
    ];
  }
}
