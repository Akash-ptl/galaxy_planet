import 'package:flutter/material.dart';
import 'package:galaxy_planet/pages/home_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(
        useMaterial3: true,
      ),
    ),
  );
}
