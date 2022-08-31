import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime(location: "London", flag: "uk.png", url: "Europe/London"),
    WorldTime(location: "Athens", flag: "greece.png", url: "Europe/Berlin"),
    WorldTime(location: "Cairo", flag: "egypt.png", url: "Africa/Cairo"),
    WorldTime(location: "Nairobi", flag: "kenya.png", url: "Africa/Nairobi"),
    WorldTime(location: "Chicago", flag: "usa.png", url: "America/Chicago"),
    WorldTime(location: "New York", flag: "usa.png", url: "America/New_York"),
    WorldTime(location: "Seoul", flag: "south_korea.png", url: "Asia/Seoul"),
    WorldTime(location: "Jakarta", flag: "indonesia.png", url: "Asia/Jakarta"),

  ];

  void updateTime(index) async {

    WorldTime instance = locations[index];
    await instance.getTime();

    // Navigate to HomeScreen
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDayTime,
    });

  }

  /*void getData() async {

    // Simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), () {
      return "Subhan";
    });

    // Simulate network request for a biographi for that username
    String bio = await Future.delayed(Duration(seconds: 2), () {
      return "Vegan, drummer and instrument collector";
    });

    // print("$username adalah $bio");

  }*/

  /*@override
  void initState() {
    super.initState();

    print("Inisialisasi");

    // getData();

    // print("Some other statement");

  }*/

  @override
  Widget build(BuildContext context) {

    print("Building");

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: const Text("Choose a location"),
        centerTitle: true,
        elevation: 10,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 1.0,
                  horizontal: 4.0
              ),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location as String),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/${locations[index].flag}"),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
