import 'package:exam_1/Screen/Fav_1.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class LikeScreen extends StatelessWidget {
  const LikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ServiceData serviceData = Provider.of<ServiceData>(context);

    return Container(

      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
            icon: const Icon(
              Icons.home_outlined,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Favorite",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(

          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  flex: 10,
                  child: LikeScreen2(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
