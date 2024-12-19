import 'package:coffee_shop/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardPage extends StatefulWidget {
  final Widget child;

  const DashboardPage({super.key, required this.child});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: SafeArea(
        child: TabBar(
          controller: _controller,
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          indicatorColor: Colors.transparent,
          onTap: _onChangedTab,
          tabs: [
            Tab(
              icon:
                  _controller.index == 0 ? const Icon(Icons.home) : const Icon(Icons.home_outlined),
            ),
            Tab(
              icon: _controller.index == 1
                  ? const Icon(Icons.favorite)
                  : const Icon(Icons.favorite_outline),
            ),
            Tab(
              icon: _controller.index == 2
                  ? const Icon(Icons.local_mall)
                  : const Icon(Icons.local_mall_outlined),
            ),
            Tab(
              icon: _controller.index == 3
                  ? const Icon(Icons.notifications)
                  : const Icon(Icons.notifications_outlined),
            ),
          ],
        ),
      ),
    );
  }

  void _onChangedTab(int index) {
    setState(() {
      switch (index) {
        case 0:
          context.goNamed(Routes.home);
        // case 1:
        //   context.goNamed(Routes.reload);
        // case 2:
        //   context.goNamed(Routes.profile);
        // case 3:
        //   context.goNamed(Routes.account);
        default:
          context.goNamed(Routes.home);
      }
    });
  }
}
