
import 'package:e_tourism/features/main_view/home/ads/presentation/pages/Ads.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: const [
        Ads(),
        SizedBox(height: 10,),
        Text("data"),
    ],
    ));
  }
}
