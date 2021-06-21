import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationScreen extends StatefulWidget {
  @override
  _DonationScreenState createState() => _DonationScreenState();
}

class _DonationScreenState extends State<DonationScreen> {
  @override
  void initState() {
    _launchInBrowser();
    super.initState();
  }

 _launchInBrowser() async {
    const url = "https://tlwc.faithpays.org/donations/together-it-is-possible-we-can-and-are-making-a-difference-4-2/?customize_changeset_uuid=cb67539b-1ff1-4938-b915-7df65f5cec94&customize_autosaved=on";
    if (await canLaunch(url)) {
      await launch(
        url,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
   // const String toLaunch = 'https://www.cylog.org/headers/';
    return Container();
  }
}
