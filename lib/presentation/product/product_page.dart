import 'package:coffee_shop/core/extensions/build_context.dart';
import 'package:coffee_shop/core/extensions/intl_currency.dart';
import 'package:coffee_shop/core/service_locator.dart';
import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/presentation/product/blocs/product_bloc.dart';
import 'package:coffee_shop/presentation/product/widgets/product_description.dart';
import 'package:coffee_shop/presentation/product/widgets/product_info.dart';
import 'package:coffee_shop/presentation/product/widgets/purchase_bottom_sheet.dart';
import 'package:coffee_shop/presentation/product/widgets/select_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';

class ProductPage extends StatefulWidget {
  final Coffee coffee;

  const ProductPage({super.key, required this.coffee});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  CoffeeSize? selectedSize;

  bool get canPurchase => selectedSize != null;

  @override
  Widget build(BuildContext context) {
    final height = context.mqSize.height / 4;
    final width = context.mqSize.width;
    final coffee = widget.coffee;

    return BlocProvider(
      create: (context) => sl.get<ProductBloc>(param1: coffee),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Details",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          foregroundColor: context.colorScheme.onSecondary,
          backgroundColor: context.colorScheme.secondary,
        ),
        body: BlocConsumer<ProductBloc, ProductState>(
          listener: _handleListener,
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(16.0),
                    children: [
                      Hero(
                        tag: coffee.id,
                        child: Container(
                          height: height,
                          width: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          clipBehavior: Clip.hardEdge,
                          child: Image.network(
                            coffee.imageUrl,
                            fit: BoxFit.fitWidth,
                            errorBuilder: (ctx, ex, stacktrace) {
                              return const Icon(Icons.image);
                            },
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductInfo(coffee: coffee),
                          const Divider(height: 32.0),
                          ProductDescription(description: coffee.description),
                          const SizedBox(height: 16.0),
                          SelectSize(
                            selectedSize: selectedSize,
                            onSizeSelected: (size) {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                PurchaseBottomSheet(
                  price: widget.coffee.price.inMYR,
                  onPurchase: canPurchase
                      ? () => context.read<ProductBloc>().add(ProductPurchase(id: widget.coffee.id, size: selectedSize!))
                      : null,
                )
              ],
            );
          },
        ),
      ),
    );
  }

  void _handleListener(BuildContext context, ProductState state) {
    switch (state) {
      case ProductPurchaseLoading():
        context.loaderOverlay.show();

      case ProductPurchaseSuccess():
        context.loaderOverlay.hide();
        context.scaffold.clearSnackBars();
        context.scaffold.showSnackBar(
          SnackBar(
            content: Text("${widget.coffee.name} has been ordered successfully."),
          ),
        );

      case ProductPurchaseFailure():
        context.loaderOverlay.hide();
        context.scaffold.clearSnackBars();
        context.scaffold.showSnackBar(
          SnackBar(
            content: Text("Failed to order ${widget.coffee.name}."),
          ),
        );

      default:
        break;
    }
  }
}
