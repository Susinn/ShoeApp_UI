
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppreal/confiq/app_router.dart';

import 'package:shoppreal/screens/screens.dart';
import 'blocs/cart/cart_bloc.dart';
import 'blocs/whislist/whishlist_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WhishlistBloc()..add(StartWishlist()),
        ),
        BlocProvider(
          create: (context) => CartBloc()..add(CartStarted()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: (settings) => AppRouter.onGenerateRoute(settings),
        initialRoute: SplashScreen.routeName,
        debugShowCheckedModeBanner: false,
        title: 'SHOEAPP',
        theme: ThemeData.dark().copyWith(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 91, 94, 123))),
        home: const HomeScreen(),
      ),
    );
  }
}
