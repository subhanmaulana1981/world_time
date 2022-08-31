import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  late String? location;
  late String time;
  late String? flag;
  late String? url;
  bool isDayTime = true;

  WorldTime({ this.location, this.flag, this.url });

  Future<void> getTime() async {

    try {
      Response response =
      await get(Uri.https('worldtimeapi.org', 'api/timezone/$url'));
      Map data = jsonDecode(response.body);

      // Get properties from the data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);

      // Create DatetTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // A Ternary Operator
      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      time = DateFormat.jm().format(now);

    } catch(e) {
      // print("Pesan error: $e");
      time = "Tidak dapat mengambil data waktu";
    }

  }
}
