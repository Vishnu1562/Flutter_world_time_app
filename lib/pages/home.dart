import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    // data = data.isNotEmpty ? data : ModalRoute.of(context)!.settings.arguments as Map;

    if (data.isEmpty) {
      final routeArgs = ModalRoute.of(context)?.settings.arguments;
      if (routeArgs is Map) {
        data = routeArgs;
      } else {
        // Handle the case where arguments are not as expected.
        // You might want to set default data or show an error.
        // For now, let's ensure 'data' is at least an empty map
        // to prevent further null errors on 'data' itself.
        data = {};
      }
    }

    // Now, safely access 'isDaytime' and provide a default if null
    bool isDaytime = data['isDaytime'] as bool? ?? false; // Default to false if null or not a bool
    String bgImage = isDaytime ? 'day.jpg' : 'night.jpg';
    Color? bgColor = isDaytime ? Colors.blue : Colors.black12;


    // String bgImage = data['isDaytime'] ? 'day.jpg': 'night.jpg';
    // Color? bgColor = data['isDaytime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120,0,0),
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDaytime': result['isDaytime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[300],
                  ),
                  label: Text(
                      'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[300],
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 28,
                        letterSpacing: 2,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
