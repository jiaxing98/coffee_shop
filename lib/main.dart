import 'package:coffee_shop/core/bloc_observer.dart';
import 'package:coffee_shop/core/service_locator.dart';
import 'package:coffee_shop/core/theme/theme_cubit.dart';
import 'package:coffee_shop/router/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';

Future<void> main() async {
  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();
  await initializedApp();
  injectDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl.get<ThemeCubit>()),
      ],
      child: GlobalLoaderOverlay(
        overlayWidgetBuilder: (_) {
          return const Center(
            child: SpinKitWanderingCubes(
              color: Colors.white,
              size: 50.0,
            ),
          );
        },
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              routerConfig: router,
              themeMode: state.mode,
              theme: state.theme.light,
              darkTheme: state.theme.dark,
            );
          },
        ),
      ),
    );
  }
}
