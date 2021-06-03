import 'dart:ffi';

class CountryModel {
  String name;
  String flag;
  String demonym;
  String numbercode;
  List<String> currency;
  String population;
  String capital;
  String region;
  String cioc;
  List<String> currencySymbol;

  CountryModel(
      {this.currency,
      this.demonym,
      this.flag,
      this.name,
      this.numbercode,
      this.population,
      this.capital,
      this.currencySymbol,
      this.region,
      this.cioc
      });

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    var list = json['currencies'] as List;
    List<String> currence = list.map((i) => i["name"].toString()).toList();
    List<String> symbol = list.map((i) => i["symbol"].toString()).toList();
    return CountryModel(
        name: json['name'],
        flag: json['flag'],
        demonym: json['demonym'],
        numbercode: json['numericCode'],
        population: json['population'].toString(),
        capital: json['capital'],
        region: json['region'],
        cioc: json['cioc'],
        currency: currence,
        currencySymbol: symbol);
  }
}
