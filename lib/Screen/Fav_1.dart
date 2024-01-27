
import 'package:exam_1/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Api/Api.dart';
import '../Api/web.dart';
import '../modal/api_modal.dart';

class LikeScreen2 extends StatelessWidget {
  const LikeScreen2({super.key});



  @override
  Widget build(BuildContext context) {
    ServiceData serviceData = Provider.of<ServiceData>(context);

    return FutureBuilder(
      future: APIHelper.apiHelper.fetchedQuote(),
      builder: (context, snapshot) {
        List<DataModal>? data;
        (snapshot.hasError)
            ? print(snapshot.error)
            : snapshot.hasData
            ? data = snapshot.data
            : const CircularProgressIndicator();

        return (data == null)
            ? Container()
            : GridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 4/5,
              crossAxisSpacing: 2,
              childAspectRatio: 1),
          children: data
              .where((quote) =>
              serviceData.favoriteQuotes.contains(quote.id))
              .map(
                (e) => Card(
              elevation: 10,
              shadowColor: Colors.indigoAccent,
              child: Container(
                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                ),
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      e.id,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      e.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 17),
                    ),
                    const Spacer(),
                    Text(
                      e.description,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          ),
                    ),
                    const Spacer(),
                    const Spacer(),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => WebView(url: e.url),
                                )
                            );
                          },

                          child: Text(
                            e.url,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight:
                                FontWeight.bold),
                          ),
                        ),

                      ],
                    ),
                    Text(
                      e.category,
                      textAlign: TextAlign.center,
                      style:
                      const TextStyle(fontSize: 17),
                    ),
                    const Spacer(),
                    Text(
                      e.language,
                      textAlign: TextAlign.center,
                      style:
                      const TextStyle(fontSize: 17),
                    ),
                    const Spacer(),
                    Text(
                      e.country,
                      textAlign: TextAlign.center,
                      style:
                      const TextStyle(fontSize: 17),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            ),
          )
              .toList(),
        );
      },
    );
  }
}
