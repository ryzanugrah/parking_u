import 'package:dio/dio.dart';
import 'package:parking_u/models/riwayat_model.dart';
import 'package:parking_u/utils/const.dart';
import 'package:parking_u/utils/shared_prefs.dart';

class RiwayatService {
  static Future getRiwayat(String riwayatID) async {
    try {
      String token = await SharedPref.getToken();
      print(token);
      
      Response res = await Dio().get(
        '${Const.baseUrl}/riwayat/$riwayatID',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );
      print(res.data);
      return RiwayatModel.fromJson(res.data);
    } catch (e) {
      print('catch error');
      print(e.toString());
    }
  }
}