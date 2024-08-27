import 'package:evaluation_app/features/presentation/bloc/grocery_bloc.dart';
import 'package:evaluation_app/features/presentation/bloc/grocery_event.dart';
import 'package:evaluation_app/features/presentation/pages/details_page.dart';
import 'package:evaluation_app/features/presentation/pages/home_page.dart';
import 'package:evaluation_app/features/presentation/pages/splash_screen.dart';
import 'package:evaluation_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroceryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GroceryBloc>(
          create: (context) =>
              locator<GroceryBloc>()..add(LoadAllGroceriesEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
