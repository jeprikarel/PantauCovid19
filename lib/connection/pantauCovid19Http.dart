import 'package:pantaucovid19/connection/HttpConnection.dart';
import 'package:pantaucovid19/model/countryApiModel.dart';
import 'package:pantaucovid19/model/indonesiaModel.dart';
import 'package:pantaucovid19/model/provinceApiModel.dart';
import 'package:pantaucovid19/model/valueApiModel.dart';
import 'package:pantaucovid19/res/environment.dart';

class PantauCovid19Http extends HttpConnection {
  Future<Indonesia> getStatusIndonesia() async {
    print(await get(endpoint + "indonesia/"));
    return Indonesia.fromJson((await get(endpoint + "indonesia/")).first);
  }

  Future<List<ProvinceApi>> getStatusProvinsi() async {
    List<ProvinceApi> output = (await get(endpoint + "indonesia/provinsi/"))
        .map((item) {
          var output = ProvinceApi.fromJson(item);
          return output;
        })
        .toList()
        .cast<ProvinceApi>();
    return output;
  }

  Future<List<CountryApi>> getStatusDunia() async {
    return (await get(endpoint)).map((item) => CountryApi.fromJson(item)).toList().cast<CountryApi>();
  }

  Future<ValueApi> getSembuh() async {
    return ValueApi.fromJson(await get(endpoint + "sembuh/"));
  }

  Future<ValueApi> getPositif() async {
    return ValueApi.fromJson(await get(endpoint + "positif/"));
  }

  Future<ValueApi> getMeninggal() async {
    return ValueApi.fromJson(await get(endpoint + "meninggal/"));
  }
}
