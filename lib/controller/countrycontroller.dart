import 'package:demo/model/countryModel.dart';
import 'package:demo/utility/constent.dart';
import 'package:demo/utility/webservice_manager.dart';

class CountryController{
  Future<List<CountryModel>> fetchCountry() async {
    var region = Constants.prefs.getString("region");
    List<CountryModel> country;
    WebserviceManager wsm = new WebserviceManager();
    List<dynamic> response = await wsm.makeGetRequest(region);
    country = List<CountryModel>.from(response.map((json) => CountryModel.fromJson(json)));
    return country;
  }
}