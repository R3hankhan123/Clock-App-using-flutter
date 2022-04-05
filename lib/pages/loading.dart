import 'package:world_time/service/world_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setupWorldTime() async {
    WorldTime instance =
        WorldTime(url: 'Asia/Kolkata', flag: 'india.png', location: 'Kolkata');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isDaytime': instance.isDaytime
    });
  }

  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.lightBlue[900],
        body: const Center(
          child: SpinKitHourGlass(
            color: Colors.white,
            size: 150.0,
          ),
        ));
  }
}
