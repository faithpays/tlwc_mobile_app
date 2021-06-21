import 'dart:io';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VWeb extends StatefulWidget {
// final String title,url;

  const VWeb({Key key}) : super(key: key);
  @override
  _VWebState createState() => _VWebState();
}

class _VWebState extends State<VWeb> {

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  bool isLoading=true;

  final _key = UniqueKey();
   @override
  void initState() {
    super.initState();
    // Enable hybrid composition.
     _launchInBrowser('https://www.facebook.com/groups/185831016795/?ref=br_tf');
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
       // appBar: AppBar(title: Text("hello"),),
        //     body: Stack(
        //       children: [
        //     WebView(
        //       key: _key,
        //         initialUrl: "https://www.facebook.com/groups/185831016795/?ref=br_tf",
        //         javascriptMode: JavascriptMode.unrestricted,
        //    onPageFinished: (finish) {
        //           setState(() {
        //             isLoading = false;
        //           });
        //         },
        //       ),
        //       isLoading ? Center( child: CircularProgressIndicator(),)
        //                 : Stack(),
        //     ],
          
        // ),
      ),
    );
  }
}
