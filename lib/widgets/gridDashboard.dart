import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class GridDashboard extends StatelessWidget {
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

  Items item1 = new Items(
      url: "http://tlwc.faithpays.org/events/",
      title: "Events",
      img: "images/calendar.png");

  Items item3 = new Items(
    url:
        'https://www.google.com/maps/dir/51+Richfield+Ave,+Winnipeg,+MB+R2M+2R9,+Canada/51+Richfield+Ave,+Winnipeg,+MB+R2M+2R9,+Canada/@49.8372503,-97.1599737,12z/data=!3m1!4b1!4m14!4m13!1m5!1m1!1s0x52ea76515b5e9ea5:0xada8c08305b2e0ea!2m2!1d-97.0899337!2d49.8371607!1m5!1m1!1s0x52ea76515b5e9ea5:0xada8c08305b2e0ea!2m2!1d-97.0899337!2d49.8371607!3e2',
    title: "Locate Us",
    img: "images/map.png",
  );
  Items item4 = new Items(
    url: 'https://tlwc.faithpays.org/services/church-history/',
    title: "Church Activity",
    img: "images/festival.png",
  );
  Items item5 = new Items(
    url: 'https://tlwc.faithpays.org/ministries/',
    title: "Ministries",
    img: "images/todo.png",
  );

  @override
  Widget build(BuildContext context) {
    // int index = 3;
    List<Items> myList = [
      item1,
      item3,
      item4,
      item5,
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              _launchInBrowser(data.url);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (_) => InputWeb(
              //               url: data.url,
              //             )));

              print(data.title);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(data.img, width: 42),
                  SizedBox(height: 14),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class AboutGrid extends StatelessWidget {
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

  Items item1 = new Items(
      url: "https://tlwc.faithpays.org/ministries/tlwc-kids-ministry/",
      title: "TLWC Kids Ministries ",
      img: "images/c.png");

  Items item3 = new Items(
    url: 'https://tlwc.faithpays.org/ministries/young-adult-ministry/',
    title: "Youth Ministry",
    img: "images/b.png",
  );
  Items item4 = new Items(
    url: 'https://tlwc.faithpays.org/ministries/young-adult-ministry/',
    title: "Young Adult Ministry",
    img: "images/e.png",
  );
  Items item5 = new Items(
    url: 'https://tlwc.faithpays.org/ministries/women-ministry/',
    title: "Women's Ministry",
    img: "images/d.png",
  );

  Items item6 = new Items(
      url: "https://tlwc.faithpays.org/services/mens-ministries/",
      title: "Men's Ministry",
      img: "images/c.png");

  Items item7 = new Items(
    url: 'https://tlwc.faithpays.org/drama/',
    title: "Drama Ministry",
    img: "images/b.png",
  );
  Items item8 = new Items(
    url: 'https://tlwc.faithpays.org/ministries/marriage-family-ministry/',
    title: "Marriage Ministries",
    img: "images/a.png",
  );
  // Items item9 = new Items(
  //   url: 'https://tlwc.faithpays.org/ministries/',
  //   title: "Drama Ministries",
  //   img: "images/d.png",
  // );

  @override
  Widget build(BuildContext context) {
    // int index = 3;
    List<Items> myList = [
      item1,
      item3,
      item4,
      item5,
      item6,
      item7,
      item8,
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              _launchInBrowser(data.url);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => InputWeb(url: data.url,)));

              print(data.title);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset(data.img, width: 50),
                  SizedBox(height: 14),
                  Center(
                    child: Text(
                      data.title,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Text(
                  //   data.subtitle,
                  //   style: GoogleFonts.openSans(
                  //     textStyle: TextStyle(
                  //       color: Colors.white38,
                  //       fontSize: 10,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(height: 14),
                  // Text(
                  //   data.event,
                  //   style: GoogleFonts.openSans(
                  //     textStyle: TextStyle(
                  //       color: Colors.white70,
                  //       fontSize: 11,
                  //       fontWeight: FontWeight.w600,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class StreamGrid extends StatelessWidget {
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

  Items item1 = new Items(
      url: "https://www.facebook.com/groups/185831016795/?ref=br_tf'",
      title: "Facebook Live ",
      icon: FontAwesomeIcons.facebookSquare);

  Items item2 = new Items(
    url: 'https://www.youtube.com/user/TLWC51',
    title: "YouTube Live",
    icon: FontAwesomeIcons.youtubeSquare
  );

  @override
  Widget build(BuildContext context) {
    // int index = 3;
    List<Items> myList = [
      item1,
      item2,
    ];
    var color = 0xff453658;
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: myList.map((data) {
          return GestureDetector(
            onTap: () {
              _launchInBrowser(data.url);
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => InputWeb(url: data.url,)));

              print(data.title);
            },
            child: Container(
              decoration: BoxDecoration(
                color: Color(color),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //Image.asset(data.img, width: 50),
                  FaIcon(data.icon, size: 40, color: Colors.white,),
                  SizedBox(height: 14),
                  Center(
                    child: Text(
                      data.title,
                      style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class Items {
  IconData icon;
  String url;
  String title;
  String img;
  Items({this.title, this.img, this.url, this.icon});
}
