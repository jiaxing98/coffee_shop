import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:coffee_shop/presentation/home/widgets/filter_group.dart';
import 'package:coffee_shop/presentation/home/widgets/location_info.dart';
import 'package:coffee_shop/presentation/home/widgets/promotion_carousel.dart';
import 'package:coffee_shop/presentation/home/widgets/search_coffee.dart';
import 'package:flutter/material.dart';

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
    appbarHeight = context.mqSize.height / 2.8;
  }

  @override
  void dispose() {
    _controller.removeListener(_onScroll);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _controller,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: appbarHeight,
            backgroundColor: context.colorScheme.primary,
            flexibleSpace: FlexibleSpaceBar(
              title: AnimatedOpacity(
                opacity: _showTitle ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Text(
                  "KO-Hii",
                  style: context.textStyle.displaySmall?.copyWith(color: Colors.white),
                ),
              ),
              titlePadding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
              background: Container(
                height: appbarHeight,
                padding: EdgeInsets.fromLTRB(16.0, context.padding.top, 16.0, 0.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black87, context.colorScheme.background],
                    stops: [0.8, 0.2],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: Column(
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
            delegate: FilterGroup(height: 50.0),
          ),
          SliverList.list(
            children: List.generate(
              100,
              (index) {
                return Text("nice$index");
              },
            ),
          ),
        ],
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
