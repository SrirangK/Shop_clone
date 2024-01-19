import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_clone/cart_provider.dart';
import 'package:shop_clone/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Shopping App",
        home:  const Homepage(),
        theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          primaryColor: Colors.yellow,
          inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize:16
            ),
            prefixIconColor: Color.fromRGBO(119, 119, 119, 1),
          ),
          textTheme: TextTheme(
            titleLarge: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold
            ),
            titleMedium: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
            bodySmall: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16
            )
          ),
          useMaterial3: true,
          appBarTheme:const  AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20,color: Colors.black),
          )
        ),
      ),
    );
  }
}



