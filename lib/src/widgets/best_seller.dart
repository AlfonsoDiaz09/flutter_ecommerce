
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/services/api_services.dart';
import 'package:flutter_ecommerce/src/widgets/flayers.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices().bestSeller(),
      builder: (contex, AsyncSnapshot snap) {
        if (snap.hasData) {
          final bestSellerList = snap.data['products'] as List;

          return Flayers(
            title: 'Lo más vendido', 
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2
              ),
              itemCount: bestSellerList.length,
              itemBuilder: (contex, i) {
                return SizedBox(
                  child: Image(
                    image: NetworkImage(
                      bestSellerList[i]['thumbnail']
                    )
                  )
                );
              },
            ),
          );
        }
        return const SizedBox();
      }
    );
  }
}