import 'package:coffee_shop/core/const/images.dart';
import 'package:coffee_shop/core/extension/build_context_extension.dart';
import 'package:coffee_shop/router/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Container(
            color: Colors.black,
          ),
          Image.asset(
            Images.onboardingCoffee,
            // fit: BoxFit.fitHeight,
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height / 11,
            left: 16.0,
            right: 16.0,
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: 1.0),
              duration: Duration(seconds: 2),
              curve: Curves.easeInOut,
              builder: (context, value, child) {
                return Opacity(
                  opacity: value,
                  child: child,
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Fall in Love with Coffee in Blissful Delight!",
                    textAlign: TextAlign.center,
                    style: context.textStyle.headlineLarge?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 4.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    "Welcome to our cozy coffee corner, where every cup is a delightful for you.",
                    textAlign: TextAlign.center,
                    style: context.textStyle.bodyLarge?.copyWith(color: Colors.grey.shade500),
                  ),
                  SizedBox(height: 32.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                      backgroundColor: context.colorScheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                    ),
                    onPressed: () {
                      context.goNamed(Routes.home);
                    },
                    child: Text(
                      "Get Started",
                      style: context.textStyle.bodyLarge?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
