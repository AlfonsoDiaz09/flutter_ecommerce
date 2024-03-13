
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/src/services/api_services.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.0,
      child: FutureBuilder(
        future: ApiServices().categories(),
        builder: (context, AsyncSnapshot snap) {
          if (snap.hasData) {
            final categorieList = snap.data as List;
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0
              ),
              itemCount: categorieList.length,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 3.0
                  ),
                  child: Container(
                    width: 180.0,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        snap.data[i],
                        style: const TextStyle(
                          color: Colors.white
                        ),
                      ),
                    ),
                  ),
                );
              }
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }
}