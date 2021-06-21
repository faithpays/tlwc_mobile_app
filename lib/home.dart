import 'package:ff_navigation_bar/ff_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tlwc_app/hompage.dart';
import 'package:tlwc_app/screen/connect.dart';
import 'package:tlwc_app/screen/livestream.dart';
import 'package:tlwc_app/screen/ministries.dart';
import 'package:tlwc_app/screen/more.dart';
import 'package:tlwc_app/widgets/drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  int selectedIndex = 0;
Future<void> _launchInBrowser(String url) async {
    //const url = "https://tlwc.faithpays.org/donations/together-it-is-possible-we-can-and-are-making-a-difference-4-2/?customize_changeset_uuid=cb67539b-1ff1-4938-b915-7df65f5cec94&customize_autosaved=on";
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }
  
   List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
   ConnectScreen(),
    Ministries(),
    LiveStreamScreen(),
    MoreScreen(),
  ];

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NaviationDrawer(),
      endDrawerEnableOpenDragGesture: false,
      key: _scaffoldKey,

     

      bottomNavigationBar: FFNavigationBar(
        theme: FFNavigationBarTheme(
          barBackgroundColor: Colors.white,
          selectedItemBorderColor: Colors.transparent,
          selectedItemBackgroundColor: Colors.green,
          selectedItemIconColor: Colors.white,
          selectedItemLabelColor: Colors.black,
          showSelectedItemShadow: false,
       //   itemWidth: 50,
        //  barHeight: 65,
        ),
        selectedIndex: selectedIndex,
        onSelectTab: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: [
          FFNavigationBarItem(
            iconData: Icons.home,
            label: 'Home',
            selectedBackgroundColor: Colors.deepOrangeAccent,
          ),
          FFNavigationBarItem(
            
            iconData: FontAwesomeIcons.link,
            label: 'Connect',
            selectedBackgroundColor: Colors.deepOrangeAccent,
          ),
          FFNavigationBarItem(
            iconData: FontAwesomeIcons.church,
            label: 'Ministries',
            selectedBackgroundColor: Colors.deepOrangeAccent,
          ),
          FFNavigationBarItem(
            iconData: Icons.live_tv,
            label: 'LiveStream',
            selectedBackgroundColor: Colors.deepOrangeAccent,
          ),
          FFNavigationBarItem(
            iconData: Icons.menu,
            label: 'More',
            selectedBackgroundColor: Colors.deepOrangeAccent,
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body:  _widgetOptions.elementAt(selectedIndex),  
      
   
    );
  }
}
