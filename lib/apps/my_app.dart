import 'package:calculate/pages/porvider/provider_calculate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProviderCalculate>(
      create: (context) => ProviderCalculate(),
      child: MaterialApp(
        home: const HomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
