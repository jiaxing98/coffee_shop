import 'package:coffee_shop/domain/models/coffee.dart';
import 'package:coffee_shop/presentation/dashboard_page.dart';
import 'package:coffee_shop/presentation/home/home_page.dart';
import 'package:coffee_shop/presentation/onboarding_page.dart';
import 'package:coffee_shop/presentation/product/product_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: Routes.onboarding,
  routes: <RouteBase>[
    GoRoute(
      path: Routes.onboarding,
      name: Routes.onboarding,
      builder: (context, state) {
        return const OnboardingPage();
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return DashboardPage(child: child);
      },
      routes: [
        GoRoute(
            path: Routes.home,
            name: Routes.home,
            parentNavigatorKey: _shellNavigatorKey,
            builder: (context, state) {
              return const HomePage();
            },
            routes: [
              GoRoute(
                path: Routes.product,
                name: Routes.product,
                parentNavigatorKey: _rootNavigatorKey,
                builder: (context, state) {
                  final coffee = state.extra as Coffee;
                  return ProductPage(coffee: coffee);
                },
              )
            ]
            // pageBuilder: (context, state) => CustomTransitionPage(
            //   key: state.pageKey,
            //   child: const HomePage(),
            //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
            //     const begin = Offset(0.0, 1 / 0);
            //     const end = Offset.zero;
            //     const curve = Curves.easeInOut;
            //
            //     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            //     var offsetAnimation = animation.drive(tween);
            //
            //     return SlideTransition(
            //       position: offsetAnimation,
            //       child: child,
            //     );
            //   },
            // ),
            ),
      ],
    ),
  ],
);

abstract final class Routes {
  static const String onboarding = "/onboarding";

  static const String home = "/";
  static const String product = "/product";
}
