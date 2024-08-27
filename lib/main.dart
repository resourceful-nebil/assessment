import 'package:evaluation_app/app.dart';
import 'package:evaluation_app/injection_container.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(GroceryApp());
  
}


