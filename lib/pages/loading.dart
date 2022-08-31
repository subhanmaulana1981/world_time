import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart'
;
class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  /*void getData() async {

    var url = Uri.https('jsonplaceholder.typicode.com', 'todos/1');
    Response response = await get(url);
    Map data = jsonDecode(response.body);
    print('Response status: ${response.statusCode}');
    print('Response body: ${data}');
    print('title = ${data['title']}');

  }*/

  /*void getTime() async {

    var url = Uri.https('worldtimeapi.org', 'api/timezone/Asia/Jakarta');
    Response response = await get(url);

    print("Response status: ${response.statusCode}");

    Map data = jsonDecode(response.body);
    // print("Response body: ${data}");

    // print(data);

    // Get properties from the data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].toString().substring(1, 3);
    print("DateTime = ${datetime}" );
    print("Offset = ${offset}");

    // Create DatetTime object
    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));
    print("Now = ${now}");

  }*/

  // String time = "Loading";
  void setupWorldTime() async {

    WorldTime instance = WorldTime(
        location: "Jakarta",
        flag: "indonesia.png",
        url: "Asia/Jakarta");

    await instance.getTime();

    /*setState(() {
      time = instance.time!;
    });*/

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDayTime
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("Inisialisasi");

    // getData();

    // getTime();

    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    print("Building");

    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: const SpinKitRotatingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
