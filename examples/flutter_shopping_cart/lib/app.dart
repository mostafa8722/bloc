import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_cart/cart/cart.dart';
import 'package:flutter_shopping_cart/catalog/catalog.dart';
import 'package:flutter_shopping_cart/shopping_repository.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.shoppingRepository}) : super(key: key);

  final ShoppingRepository shoppingRepository;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CatalogBloc(
            shoppingRepository: shoppingRepository,
          )..add(CatalogStarted()),
        ),
        BlocProvider(
          create: (_) => CartBloc(
            shoppingRepository: shoppingRepository,
          )..add(CartStarted()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Bloc Shopping Cart',



        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (_) => CatalogPage(),
          '/cart': (_) => CartPage(),
        },
      ),
    );
  }
}
