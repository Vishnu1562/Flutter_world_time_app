import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


void setUpWorldTime() async {
  WorldTime instance = WorldTime(location: 'Berlin', flag: 'uk.png', url: '/Berlin');
  await instance.getTime();
  Navigator.pushReplacementNamed(context, '/home', arguments: {
    'location': instance.location,
    'flag': instance.flag,
    'time': instance.time,
    'isDayTime': instance.isDaytime,
  });
}

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Center(
        child: SpinKitHourGlass(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
