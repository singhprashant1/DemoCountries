import 'package:demo/model/countryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'SizedBox.dart';
import 'countriespredisplay.dart';

class CountryDetail extends StatefulWidget {
  final CountryModel locdetails;
  const CountryDetail({Key key, this.locdetails}) : super(key: key);
  @override
  _CountryDetailState createState() => _CountryDetailState();
}

class _CountryDetailState extends State<CountryDetail> {
  CountryModel locdetails;
  @override
  void initState() {
    super.initState();
    this.locdetails = widget.locdetails;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CountriesPreDisplay()),
        );
        return true;
      },
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Country Detail"),
          ),
          body: Stack(
            fit: StackFit.expand,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 5,
                    ),
                    Container(
                        child: RichText(
                      text: TextSpan(
                        text: locdetails.region.toString(),
                        style: TextStyle(
                            color: Colors.black,
                              fontSize: 20,
                            backgroundColor:
                                const Color(0xFF0E3311).withOpacity(0.2)),
                        children: <TextSpan>[
                          TextSpan(
                            text: '/',
                            style: TextStyle(
                                color: Colors.black,
                                  fontSize: 20,
                                backgroundColor:
                                    const Color(0xFF0E3311).withOpacity(0.2)),
                          ),
                          TextSpan(
                            text: locdetails.name.toString(),
                            style: TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                backgroundColor:
                                    const Color(0xFF0E3311).withOpacity(0.2)),
                          ),
                        ],
                      ),
                    )),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 5,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.network(
                            '${locdetails.flag}',
                            width: SizeConfig.blockSizeHorizontal * 10,
                            height: SizeConfig.blockSizeVertical * 10,
                            fit: BoxFit.fill,
                          ),
                          SizedBox(
                            width: SizeConfig.blockSizeHorizontal * 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: locdetails.name.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: '(',
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10)),
                                    TextSpan(
                                      text: locdetails.cioc.toString(),
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 10),
                                    ),
                                    TextSpan(
                                      text: ')',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                              Text(locdetails.capital.toString(),
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12)),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: SizeConfig.blockSizeVertical * 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Demonym",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(locdetails.demonym.toString()),
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Calling Code",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text('+' + locdetails.numbercode.toString()),
                              ],
                            ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Currency",
                                  style: TextStyle(color: Colors.grey),
                                ),
                                Text(locdetails.currencySymbol[0].toString() +
                                    locdetails.currency[0].toString()),
                              ],
                            )),
                        Container(
                            margin: const EdgeInsets.all(15.0),
                            padding: const EdgeInsets.all(12.0),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "population",
                                  style: TextStyle(color: Colors.grey),
                                ),
                      
                                Text(locdetails.population.toString()),
                              ],
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
