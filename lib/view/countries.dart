import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utility/SizedBox.dart';
import '../controller/countrycontroller.dart';
import 'countrydetail.dart';
import '../model/countryModel.dart';

class Countries extends StatefulWidget {
  final List<CountryModel> country;
  const Countries({Key key, this.country}) : super(key: key);

  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  List<CountryModel> country = [];
  // int _currentIndex = 0;

  List<Widget> cardList = [];
  @override
  void initState() {
    super.initState();
    this.country = widget.country;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      child: Stack(
        fit: StackFit.expand,
        children: [
          ListView.builder(
              itemCount: country.length,
              itemBuilder: (context, index) {
                CountryModel country1 = country[index];
                return GestureDetector(
                  child: Card(
                    color: Colors.lightBlue[100],
                    child: ListTile(
                      title: Text(
                        country1.name,
                      ),
                      trailing: SvgPicture.network(
                        '${country1.flag}',
                        // width: 300.0,
                        width: SizeConfig.blockSizeHorizontal * 5,
                        height: SizeConfig.blockSizeVertical * 5,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  onTap: () {
                    //  print('current index' + .toString());
                    print('current index ' + country1.name.toString());
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CountryDetail(locdetails: country1)));
                  },
                );
              })
        ],
      ),
    );
  }
}
