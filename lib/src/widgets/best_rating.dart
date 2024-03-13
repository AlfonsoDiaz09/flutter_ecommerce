
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce/src/services/api_services.dart';
import 'package:flutter_ecommerce/src/widgets/flayers.dart';

class BestRating extends StatelessWidget {
  const BestRating({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiServices().bestRating(),
      builder: (context, AsyncSnapshot snap) {
        if (snap.hasData) {
          List bestRatingList = snap.data['products'] as List;
          bestRatingList = bestRatingList.where((e) => e['rating'] >= 4.7).toList();

          return Flayers(
            title: 'Mejor Calificado', 
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: bestRatingList.length,
              itemBuilder: (context, i) {
                return Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 120.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                              bestRatingList[i]['thumbnail']
                            )
                          )
                        ),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(8)
                            ),
                            child: Text(
                              '⭐ ${bestRatingList[i]["rating"].toString()}',
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        bestRatingList[i]['description']
                      ),
                    )
                  ],
                );
              }
            )
          );
        }
        return const SizedBox();
      }
    );
  }
}