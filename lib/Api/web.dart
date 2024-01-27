import 'package:exam_1/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';


class WebView extends StatelessWidget {
  final String url;

  const WebView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Web View'),
        centerTitle: true,
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Provider.of<ServiceData>(context, listen: false)
                  .goBack();
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Provider.of<ServiceData>(context, listen: false)
                  .reloadWebView();
            },
          ),
          IconButton(
            icon: const Icon(Icons.home_outlined),
            onPressed: () {
              Provider.of<ServiceData>(context, listen: false)
                  .goHome(url);
            },
          ),
          IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      'Add BookMark',
                    ),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [

                        InkWell(

                          child: Card(
                            elevation: 8,
                            margin:
                            const EdgeInsets.only(top: 15),
                            child: Container(
                              margin: const EdgeInsets.all(10),
                              child: const Text("BookMark"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () {
              Provider.of<ServiceData>(context, listen: false)
                  .goForward();
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<ServiceData>(
          builder: (context, catProvider, child) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Container(
                  //   // margin: const EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //     borderRadius: const BorderRadius.all(
                  //       Radius.circular(20),
                  //     ),
                  //     color: Colors.transparent.withOpacity(
                  //       0.020,
                  //     ),
                  //   ),
                  //   height: 50,
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       IconButton(
                  //         icon: const Icon(Icons.arrow_back),
                  //         onPressed: () {
                  //           Provider.of<ServiceData>(context, listen: false)
                  //               .goBack();
                  //         },
                  //       ),
                  //       IconButton(
                  //         icon: const Icon(Icons.refresh),
                  //         onPressed: () {
                  //           Provider.of<ServiceData>(context, listen: false)
                  //               .reloadWebView();
                  //         },
                  //       ),
                  //       IconButton(
                  //         icon: const Icon(Icons.home_outlined),
                  //         onPressed: () {
                  //           Provider.of<ServiceData>(context, listen: false)
                  //               .goHome(url);
                  //         },
                  //       ),
                  //       IconButton(
                  //         icon: const Icon(Icons.bookmark_border),
                  //         onPressed: () {
                  //           showDialog(
                  //             context: context,
                  //             builder: (context) {
                  //               return AlertDialog(
                  //                 title: const Text(
                  //                   'Add BookMark',
                  //                 ),
                  //                 content: Column(
                  //                   mainAxisSize: MainAxisSize.min,
                  //                   children: [
                  //                     TextField(
                  //                       onSubmitted: (val) {
                  //                         catProvider
                  //                             .textControllerModel.titleTxt;
                  //                       },
                  //                       controller: catProvider
                  //                           .textControllerModel.titleTxt,
                  //                       keyboardType: TextInputType.text,
                  //                       decoration: const InputDecoration(
                  //                         hintText: 'Enter your Title',
                  //                         border: OutlineInputBorder(
                  //                           borderRadius: BorderRadius.all(
                  //                             Radius.circular(10),
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                     InkWell(
                  //                       onTap: () {
                  //                         Provider.of<ServiceData>(context,
                  //                             listen: false)
                  //                             .addBookmark(url);
                  //                         Navigator.of(context).pop();
                  //                       },
                  //                       child: Card(
                  //                         elevation: 8,
                  //                         margin:
                  //                         const EdgeInsets.only(top: 15),
                  //                         child: Container(
                  //                           margin: const EdgeInsets.all(10),
                  //                           child: const Text("BookMark"),
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               );
                  //             },
                  //           );
                  //         },
                  //       ),
                  //       IconButton(
                  //         icon: const Icon(Icons.arrow_forward),
                  //         onPressed: () {
                  //           Provider.of<ServiceData>(context, listen: false)
                  //               .goForward();
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),



                  Container(
                    color: Colors.transparent,
                    height: 785,
                    child: InAppWebView(
                      initialUrlRequest: URLRequest(
                        url: WebUri(url),
                      ),
                      onWebViewCreated: (InAppWebViewController controller) {
                        catProvider.setWebViewController(controller);
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
