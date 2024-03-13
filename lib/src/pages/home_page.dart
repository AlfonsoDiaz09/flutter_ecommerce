
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/widgets/best_rating.dart';
import 'package:flutter_ecommerce/src/widgets/best_seller.dart';
import 'package:flutter_ecommerce/src/widgets/categories.dart';
import 'package:flutter_ecommerce/src/widgets/promo_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        children: const [
          PromoBanner(),
          Categories(),
          BestSeller(),
          BestRating()
        ],
      ),
    );
  }
}