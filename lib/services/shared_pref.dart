import 'package:shared_preferences/shared_preferences.dart';

class Shared {
  static  String connect = 'connect';
  static  SharedPreferences? _prefs;
  static  init()async  
  {
  

  _prefs =  await SharedPreferences.getInstance();

  }
  static setConnect( bool value) async{
   await _prefs!.setBool(connect, value );
  }
  static getConnect()  =>  _prefs!.getBool(connect) ?? false;
}