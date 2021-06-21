import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tlwc_app/screen/about/pastor.dart';
import 'package:tlwc_app/screen/about/prayer.dart';
import 'package:tlwc_app/util/style.dart';
import 'package:tlwc_app/widgets/drawer.dart';
import 'package:tlwc_app/widgets/imageTop.dart';
import 'package:url_launcher/url_launcher.dart';



class MoreScreen extends StatefulWidget {
  @override
  _MoreScreenState createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    Future<void> _launchInBrowser(String url) async {
      if (await canLaunch(url)) {
        await launch(
          url,
        );
      } else {
        throw 'Could not launch $url';
      }
    }

    return SafeArea(
      child: Scaffold(
        drawer: NaviationDrawer(),
        endDrawerEnableOpenDragGesture: false,
        key: _scaffoldKey,
        body: Column(
          children: [
           
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
            SizedBox(
              height: 10,
            ),
            Text(
              "About Us",
              style: kHeadingText1,
            ),
            SizedBox(height: 10),
            CardContainer(
              // onTap: () {
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (_) => WebViewPlug(url: "https://tlwc.faithpays.org/our-mission/", title: "Our Learship",)));
              // },
              color: Colors.deepOrangeAccent,
              title: "OUR BELIEFS",
              icon: FontAwesomeIcons.church,
              // url: "https://tlwc.faithpays.org/our-mission/",
              width: width,
              onTap: () {
                _launchInBrowser("https://tlwc.faithpays.org/our-mission/");
              },
            ),
            SizedBox(height: 10),
            CardContainer(
              color: Colors.blueGrey,
              title: "OUR PASTOR",
              icon: Icons.person,
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => ProfileApp()));
              },
              // url: "https://tlwc.faithpays.org/our-leadership/",
              width: width,
            ),
            SizedBox(height: 10),
            CardContainer(
              color: Colors.deepOrangeAccent,
              title: "OUR HISTORY",
              icon: FontAwesomeIcons.infoCircle,
              //url: "https://tlwc.faithpays.org/services/church-history/",
              width: width,
              onTap: () {
                _launchInBrowser(
                    "https://tlwc.faithpays.org/services/church-history/");
               
              },
            ),
            SizedBox(height: 10),
           
            CardContainer(
              color: Colors.blueGrey,
              //url: "https://tlwc.faithpays.org/prayers-request/",
              title: "PRAYER REQUEST",
              width: width,
              icon: FontAwesomeIcons.pray,
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) => ContentScreen(
                              imgUrl: "images/home.jpeg",
                              titleName: "Prayer Request",
                              urlTitle: "Submit A Prayer",
                              substitle:
                                  "Are you seeking prayer? Let's pray for you",
                              url:
                                  "https://tlwc.faithpays.org/prayers-request/",
                            )));
              },
            )
          ],
        ),
      ),
    );
  }
}

class CardContainer extends StatelessWidget {
  const CardContainer({
    Key key,
    @required this.width,
    this.title,
    this.color,
    this.onTap,
    this.icon,
  }) : super(key: key);

  final double width;
  final String title;
  final Color color;
  final Function onTap;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          width: width,
          height: 50,
          decoration: BoxDecoration(
            color: color,
          ),
          child: Center(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: kButtonTextStyle,
              ),
            ],
          ))),
    );
  }
}
