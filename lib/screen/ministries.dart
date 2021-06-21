import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tlwc_app/widgets/gridDashboard.dart';
import 'package:tlwc_app/widgets/drawer.dart';
import 'package:tlwc_app/widgets/imageTop.dart';

class Ministries extends StatefulWidget {
  @override
  _MinistriesState createState() => _MinistriesState();
}

class _MinistriesState extends State<Ministries> {
  
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        drawer: NaviationDrawer(),
        endDrawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        body: Column(
          children: <Widget>[
            //SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "TLWC",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Changing Life and Attitude",
                        style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      _scaffoldKey.currentState.openDrawer();
                    },
                    alignment: Alignment.topCenter,
                    icon: Image.asset("images/menu.png", width: 24),
                  )
                ],
              ),
            ),
            ImageTop(height: height, width: width),
            SizedBox(height: 10),
            // ignore: todo
            //TODO Grid Dashboard
            AboutGrid()
          ],
        ),
      ),
    );
  }
}
