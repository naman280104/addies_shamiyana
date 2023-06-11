import 'package:shared_preferences/shared_preferences.dart';

class SharedPref{

  static addStringToSF(String s1,String s2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(s1, s2);
  }
  static addIntToSF(String s1,int s2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(s1, s2);
  }

  static addDoubleToSF(String s1,double s2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setDouble(s1, s2);
  }
  static addBoolToSF(String s1,bool s2) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(s1, s2);
  }






  static getStringValuesSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String stringValue = prefs.getString(s)?? "";
    return stringValue;
  }
  static getBoolValuesSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return bool
    bool boolValue = prefs.getBool(s)?? false;
    return boolValue;
  }
  static getIntValuesSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return int
    int intValue = prefs.getInt(s)?? 0;
    return intValue;
  }
  static getDoubleValuesSF(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return double
    double doubleValue = prefs.getDouble(s)?? 0.0;
    return doubleValue;
  }






  static removeValues(String s) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("s");

  }

  static checkValue(String s)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool checkVal = prefs.containsKey(s);
    return checkVal;
  }

}