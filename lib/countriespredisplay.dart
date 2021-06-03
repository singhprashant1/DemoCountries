import 'package:demo/controller/countrycontroller.dart';
import 'package:demo/homepage.dart';
import 'package:demo/model/countryModel.dart';
import 'package:flutter/material.dart';

import 'SizedBox.dart';
import 'countries.dart';

class CountriesPreDisplay extends StatefulWidget {
  @override
  _CountriesPreDisplayState createState() => _CountriesPreDisplayState();
}

class _CountriesPreDisplayState extends State<CountriesPreDisplay> {
  Future<List<CountryModel>> locationDetailslist;
  CountryController locController = new CountryController();
  @override
  void initState() {
    super.initState();
    locationDetailslist = locController.fetchCountry();
    // usertype = UserType().getdata();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Countries"),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: FutureBuilder<List<CountryModel>>(
            future: locationDetailslist,
            builder: (context, snapshot) {
              if (snapshot.hasError) print(snapshot.error);
              return snapshot.hasData
                  ? new Countries(country: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }
}