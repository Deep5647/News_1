import 'package:exam_1/Api/Api.dart';
import 'package:exam_1/Api/web.dart';
import 'package:exam_1/modal/api_modal.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';



class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();

    getData();
  }

  getData() async {
    await APIHelper.apiHelper.fetchedQuote().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    ServiceData serviceData = Provider.of<ServiceData>(context);
    serviceData.getData();
    serviceData.loadFavorites();
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.pinkAccent.shade200.withOpacity(0.7),
            Colors.deepPurple.shade300.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.white.withOpacity(0.8),
        appBar: AppBar(
          backgroundColor: Colors.purpleAccent,
          title: const Text(
            "News App",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).pushNamed('LikeScreen');
            },
              icon: const Icon( Icons.favorite_outline,
                ),

            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(

                flex: 10,
                child: FutureBuilder(
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
                      gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 4/5,
                          crossAxisSpacing: 2,
                          childAspectRatio: 1),
                      children: data
                          .map(
                            (e) => Card(
                          elevation: 10,
                          shadowColor: Colors.indigoAccent,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            alignment: Alignment.bottomCenter,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  e.id,
                                  style: const TextStyle(
                                    color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                const Spacer(),
                                Text(
                                  e.description,
                                  textAlign: TextAlign.center,
                                  style:
                                  const TextStyle(fontSize: 17,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
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
                                            color: Colors.white,
                                            fontStyle: FontStyle.italic
                                            ,

                                            fontSize: 18,
                                            fontWeight:
                                            FontWeight.bold),
                                      ),
                                    ),

                                  ],
                                ),
                                const Spacer(),
                                Text(
                                  e.category,
                                  textAlign: TextAlign.center,
                                  style:
                                  const TextStyle(fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  e.language,
                                  textAlign: TextAlign.center,
                                  style:
                                  const TextStyle(fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  e.country,
                                  textAlign: TextAlign.center,
                                  style:
                                  const TextStyle(fontSize: 17,
                                    color: Colors.white,
                                  ),
                                ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    FloatingActionButton(
                                      mini: true,
                                      onPressed: () {
                                        if (serviceData
                                            .isFavorite(e.id)) {
                                          serviceData
                                              .removeFromFavorites(
                                              e.id);
                                        } else {
                                          serviceData
                                              .addToFavorites(e.id);
                                        }
                                      },
                                      child: Icon(
                                        serviceData
                                            .isFavorite(e.id)
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                          .toList(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
