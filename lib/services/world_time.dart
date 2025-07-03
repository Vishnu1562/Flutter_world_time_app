import 'package:http/http.dart';
import 'dart:convert';

import 'package:intl/intl.dart';

class WorldTime{
  String location = '';
  String time = '';
  String flag = '';
  String url = '';
  bool isDaytime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async{
    try{
      // Response response = await get(Uri.parse('https://api.api-ninjas.com/v1/worldtime?city=$url'));
      Response response = await get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=$url'));

      Map data = jsonDecode(response.body);

      // String datetime = data['datetime'];
      // print(datetime);
      // String offset = data['utc_offset'].substring(1,3);
      //
      // DateTime now = DateTime.parse(datetime);
      // now = now.add(Duration(hours: int.parse(offset)));


      String datetimeString = data['dateTime']; // Use 'dateTime' from your sample response
      // Ensure this key matches the actual API response

      // The datetimeString from the API is already the local time for the zone
      DateTime now = DateTime.parse(datetimeString);

      isDaytime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm().format(now);
    }
    catch(e){
      print('caught error: $e');
      time = 'could not get time data';
    }


  }
}


