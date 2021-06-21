import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class WebViewPlug extends StatefulWidget {
  //final String url, title;

  const WebViewPlug({Key key, }) : super(key: key);
  @override
  _WebViewPlugState createState() => _WebViewPlugState();
}

class _WebViewPlugState extends State<WebViewPlug> {
 // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // int _page = 0;
  // GlobalKey _bottomNavigationKey = GlobalKey();
  int selectedIndex = 0;
  final flutterWebViewPlugin = FlutterWebviewPlugin();
  final Set<JavascriptChannel> jsChannels = [
    JavascriptChannel(
        name: 'Print',
        onMessageReceived: (JavascriptMessage message) {
          print(message.message);
        }),
  ].toSet();
  @override
  void dispose() {
    super.dispose();
    flutterWebViewPlugin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
              children: [ WebviewScaffold(
          
          
          
         // backgroundColor: Colors.white,
          
            javascriptChannels: jsChannels,
            url: 'https://tlwc.faithpays.org/',
            mediaPlaybackRequiresUserGesture: false,
            // appBar: AppBar(
            //   title: Text('TLWC'),
            // ),
            withZoom: true,
            withLocalStorage: true,
            hidden: true,
            initialChild: Container(
            
              //color: Colors.redAccent,
              child: Center(
                child: SpinKitWave(
                        size: 50,
                        itemBuilder: (_, int index) {
                          return DecoratedBox(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: index.isEven
                                    ? Colors.white
                                    : Colors.orangeAccent.withOpacity(0.5)),
                          );
                        },
                      ),
              ),
            ),
          
        ),
              ],
      ),
    );
  }
}
