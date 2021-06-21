import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class InputWeb extends StatefulWidget {
  final String url;

  const InputWeb({Key key, this.url}) : super(key: key);
  @override
  _InputWebState createState() => _InputWebState();
}

class _InputWebState extends State<InputWeb> {
 // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // int _page = 0;
  // GlobalKey _bottomNavigationKey = GlobalKey();
  int selectedIndex = 0;
  final flutterInputWebin = FlutterWebviewPlugin();
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
    flutterInputWebin.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
              children: [ WebviewScaffold(
          
          
          
         // backgroundColor: Colors.white,
          
            javascriptChannels: jsChannels,
            url: widget.url,
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
