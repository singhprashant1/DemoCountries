import 'package:demo/utility/constent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utility/SizedBox.dart';
import 'countries.dart';
import 'countriespredisplay.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: SafeArea(
        child: Scaffold(
            body: Stack(
          fit: StackFit.expand,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Select a region",
                  style: TextStyle(color: Colors.grey, fontSize: 20),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 5),
                MaterialButton(
                  height: 52,
                  minWidth: 323,
                  color: Colors.purple[900],
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Text(
                    "Asia",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    Constants.prefs.setString("region", "asia");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CountriesPreDisplay()),
                    );
                  },
                  splashColor: Colors.blue,
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 5),
                MaterialButton(
                  height: 52,
                  minWidth: 323,
                  color: Colors.purple[900],
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0),
                  ),
                  child: Text(
                    "Europe",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    Constants.prefs.setString("region", "europe");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CountriesPreDisplay()),
                    );
                  },
                  splashColor: Colors.blue,
                ),
              ],
            )
          ],
        )),
      ),
    );
  }

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you want to exit an App'),
              actions: <Widget>[
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }
}
