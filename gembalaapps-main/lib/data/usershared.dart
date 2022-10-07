import 'package:mbech/Services/Servverify.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Usershared {
  static getSharedPreferences() async {
    SharedPreferences? prefs;
    prefs = await SharedPreferences.getInstance();
  }

  static saveintvalue(int userId) async {
    SharedPreferences? prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.setInt('id', userId);
  }

  static saveVerifyString(String? verify) async {
    if (verify != null) {
      SharedPreferences? prefs;
      prefs = await SharedPreferences.getInstance();
      prefs.setString('VERIFY', verify);
      print("verify save : $verify");
    }
  }

  static saveVerify(Verif? verify) async {
    if (verify != null) {
      var value = verify.toJson().toString();
      SharedPreferences? prefs;
      prefs = await SharedPreferences.getInstance();
      prefs.setString('VERIFY', value);
      print("verify save : $value");
    }
  }

  static getVerify() async {
    SharedPreferences? prefs;
    prefs = await SharedPreferences.getInstance();
    return prefs.getString('VERIFY');
  }

  static String? getVerify2(SharedPreferences prefs) {
    var result = prefs.getString('VERIFY');
    print("Data result : $result");
    return result;
  }

  static getintvalue() async {
    SharedPreferences? prefs;
    prefs = await SharedPreferences.getInstance();
    return prefs.getInt('id');
  }

  static deleteValue() async {
    SharedPreferences? prefs;
    prefs = await SharedPreferences.getInstance();
    prefs.remove("id");
  }

  static checkKey() async {
    SharedPreferences? prefs;
    prefs = await SharedPreferences.getInstance();
    bool haskey = prefs.containsKey('id');
    print("haskey: $haskey");
  }
}
