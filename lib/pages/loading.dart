import 'package:flutter/material.dart';

import '../services/world_time.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  String time = 'loading';

void setUpWorldTime() async {
  WorldTime instance = WorldTime(location: 'Berlin', flag: 'uk.png', url: '/Berlin');
  await instance.getTime();
  setState(() {
    time = instance.time;
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
      body: Padding(padding: EdgeInsets.all(50),
        child: Text(time),
      ),
    );
  }
}
