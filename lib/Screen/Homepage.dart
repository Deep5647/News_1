import 'package:flutter/material.dart';

import '../Api/Api.dart';
import '../modal/api_modal.dart';

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
    await Apihelper.apiHelper.fetchedPhotos().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(child: Text("News App",style: TextStyle(color: Colors.black),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [

            Expanded(
              flex: 10,
              child: FutureBuilder(
                future: Apihelper.apiHelper.fetchedPhotos(),
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
                        crossAxisCount: 2,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        childAspectRatio: 3 / 4),
                    children: data
                        .map(
                          (e) => Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Text(e.name),
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
    );
  }
}

/*
Expanded(
child:TextField(
onChanged: (val) async {
await Apihelper.apiHelper.fetchedPhotos(val).then((value) {
setState(() {});
});
},
decoration: const InputDecoration(
hintText: "Search",
),
),
),


 */