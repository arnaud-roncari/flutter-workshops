import 'package:cookie_clicker/bloc/core_bloc.dart';
import 'package:cookie_clicker/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CoreBloc(),
        child: const HomePage(),
      ),
    );
  }
}
