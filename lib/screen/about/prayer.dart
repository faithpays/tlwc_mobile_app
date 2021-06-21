import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tlwc_app/util/style.dart';
import 'package:url_launcher/url_launcher.dart';

class ContentScreen extends StatefulWidget {
  final String url;
  final String imgUrl;
  final String substitle;
  final String urlTitle;
  final String titleName;

  const ContentScreen(
      {Key key,
      this.url,
      this.imgUrl,
      this.substitle,
      this.urlTitle,
      this.titleName})
      : super(key: key);
  @override
  _ContentScreenState createState() => _ContentScreenState();
}

class _ContentScreenState extends State<ContentScreen> {
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: Text(widget.titleName),
        ),
        body: Column(
          children: [
            Container(
              height: height / 4,
              width: width,

              decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(widget.imgUrl), fit: BoxFit.cover),
                //border: Border.all(color: Colors.blueAccent)
              ),
              // child: Text("My Awesome Border"),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              widget.titleName,
              style: kHeadingText1,
            ),
            SizedBox(height: 10),
            Text(
              widget.substitle,
              style: kBodyText4,
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                _launchInBrowser(widget.url);

                // ViewWeb(
                //       url: url,
                //       title: title,
                //     ),
              },
              child: CardContainer(
                color: Colors.deepOrangeAccent,
                title: widget.urlTitle,
                url: widget.url,
                icon: FontAwesomeIcons.pray,
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

class CardContainer extends StatefulWidget {
  const CardContainer({Key key, this.title, this.url, this.color, this.icon})
      : super(key: key);

  final String title, url;
  final Color color;
  final IconData icon;

  @override
  _CardContainerState createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 100,
        decoration: BoxDecoration(
          color: widget.color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              widget.title,
              style: kButtonTextStyle,
            ),
          ],
        ));
  }
}
