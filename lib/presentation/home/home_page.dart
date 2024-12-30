import 'package:coffee_shop/core/extensions/build_context.dart';
import 'package:coffee_shop/core/service_locator.dart';
import 'package:coffee_shop/presentation/home/blocs/coffee_bloc.dart';
import 'package:coffee_shop/presentation/home/widgets/coffee_grid.dart';
import 'package:coffee_shop/presentation/home/widgets/filter_group.dart';
import 'package:coffee_shop/presentation/home/widgets/location_info.dart';
import 'package:coffee_shop/presentation/home/widgets/promotion_carousel.dart';
import 'package:coffee_shop/presentation/home/widgets/search_coffee.dart';
import 'package:coffee_shop/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final ScrollController _controller;
  late final double appbarHeight;
  late bool _showTitle;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _controller.addListener(_onScroll);

    _showTitle = false;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appbarHeight = context.mqSize.height / 3;
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (ctx) => sl.get<CoffeeBloc>()..add(CoffeeFetch()),
      child: BlocBuilder<CoffeeBloc, CoffeeState>(
        builder: (context, state) {
          return Scaffold(
            body: RefreshIndicator(
              onRefresh: () async => context.read<CoffeeBloc>().add(CoffeeFetch()),
              child: CustomScrollView(
                controller: _controller,
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    expandedHeight: appbarHeight,
                    backgroundColor: context.colorScheme.primary,
                    flexibleSpace: FlexibleSpaceBar(
                      title: AnimatedOpacity(
                        opacity: _showTitle ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 500),
                        child: Text(
                          "KO-Hii",
                          style: context.textStyle.displaySmall?.copyWith(color: Colors.white),
                        ),
                      ),
                      titlePadding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                      background: Container(
                        height: appbarHeight,
                        padding: EdgeInsets.fromLTRB(16.0, context.padding.top, 16.0, 0.0),
                        decoration: BoxDecoration(
                          color: context.colorScheme.secondary,
                        ),
                        child: const Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            LocationInfo(address: "Puchong, Selangor"),
                            SearchCoffee(),
                            PromotionCarousel(),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    pinned: true,
                    delegate: FilterGroup(
                      height: 50.0,
                      onTap: (filters) {
                        context.read<CoffeeBloc>().add(CoffeeFilter(filters: filters));
                      },
                    ),
                  ),
                  switch (state) {
                    CoffeeFetchSuccess() => CoffeeGrid(
                        coffee: state.coffee,
                        onTap: (coffee) {
                          context.pushNamed(Routes.product, extra: coffee);
                        },
                      ),
                    CoffeeFetchLoading() || CoffeeFetchFailure() => CoffeeGrid.loading(),
                  },
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _onScroll() {
    final position = _controller.position;
    setState(() {
      _showTitle = position.pixels > (appbarHeight - kToolbarHeight);
    });
  }
}
