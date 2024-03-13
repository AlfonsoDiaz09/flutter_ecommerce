
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/services/api_services.dart';

class PromoBanner extends StatefulWidget {
  const PromoBanner({super.key});

  @override
  State<PromoBanner> createState() => _PromoBannerState();
}

class _PromoBannerState extends State<PromoBanner> {
  final _controller = PageController(
    initialPage: 0,
    viewportFraction: 0.85
  );

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: ApiServices().productsBanner(),
      builder: (context, AsyncSnapshot snap) {
        if (snap.hasData){
          final productList = snap.data['products'] as List;
          return SizedBox(
            height: 250.0,
            child: PageView.builder(
              controller: _controller,
              padEnds: false,
              itemCount: productList.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          productList[i]['thumbnail']
                        )
                      )
                    ),
                  ),
                );
              }
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}