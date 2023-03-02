import 'package:flutter/material.dart';
import 'package:insert_update_delete/screen/home/provider/home_proivder.dart';
import 'package:insert_update_delete/screen/home/view/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/' : (context) => HomeScreen(),
        },
      ),
    ),
  );
}
