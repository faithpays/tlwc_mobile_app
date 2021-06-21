import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tlwc_app/home.dart';
import 'package:tlwc_app/widgets/onboarding.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new HomePage()));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => new OnBoardingPage()));
    }
  }

  @override
  // ignore: override_on_non_overriding_member
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: double.infinity,
          // color: Colors.grey,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/2.jpeg'), fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              Spacer(),
              Center(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  },
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
              SizedBox(height: 80),
            ],
          )),
    );
  }
}
