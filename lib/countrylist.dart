import 'package:demo/model/countryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'SizedBox.dart';

class CountryList extends StatefulWidget {
   final CountryModel country;
  const CountryList({Key key, this.country}) : super(key: key);
  @override
  _CountryListState createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {
 CountryModel country;
  @override
  void initState() {
    super.initState();
     this.country = widget.country;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      // height: 100,
      // width: 100,
      child: GestureDetector(
        child: ListTile(
          title: Text(country.name,),
          trailing: SvgPicture.network(
              '${country.flag}',
              // width: 300.0,
              width: SizeConfig.blockSizeHorizontal * 5,
              height: SizeConfig.blockSizeVertical * 5,
              fit: BoxFit.fill,
            ),
        ),
        onTap: (){
          
        },
      ),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //       Container(
      //         // color: Colors.orange,
      //         child: Center(
      //           child: Text(
      //             country.name,
      //             style: TextStyle(
      //                 color: Colors.black, fontWeight: FontWeight.bold),
      //           ),
      //         ),
      //       ),
      //       SvgPicture.network(
      //       '${country.flag}',
      //       // width: 300.0,
      //       width: SizeConfig.blockSizeHorizontal * 5,
      //       height: SizeConfig.blockSizeVertical * 5,
      //       fit: BoxFit.fill,
      //     ),
      //   ],
      // ),
    );
  }
}
