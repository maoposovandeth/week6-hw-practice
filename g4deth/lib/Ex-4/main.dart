import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(backgroundColor: Colors.lightBlue.shade200),
        body: ListView(
          padding: EdgeInsets.all(15),
          children: [
            WeatherCard(
              city: 'Phnom Penh',
              min: 10.0,
              max: 30.0,
              current: 12.2,
              image: 'assets2/cloudy.png',
              colors: [Colors.purpleAccent, Colors.purple.shade200],
            ),
            WeatherCard(
              city: 'Paris',
              min: 10.0,
              max: 40.0,
              current: 22.2,
              image: 'assets2/sunnyCloudy.png',
              colors: [Colors.tealAccent, Colors.green.shade200],
            ),
            WeatherCard(
              city: 'Rome',
              min: 10.0,
              max: 40.0,
              current: 45.2,
              image: 'assets2/sunny.png',
              colors: [Colors.pinkAccent, Colors.red.shade300],
            ),
            WeatherCard(
              city: 'Toulouse',
              min: 10.0,
              max: 40.0,
              current: 45.2,
              image: 'assets2/veryCloudy.png',
              colors: [Colors.orange, Colors.orange.shade200],
            ),
          ],
        ),
      ),
    ),
  );
}

class WeatherCard extends StatelessWidget {
  final String city;
  final double min;
  final double max;
  final double current;
  final String image;
  final List<Color> colors;

  WeatherCard({
    required this.city,
    required this.min,
    required this.max,
    required this.current,
    required this.image,
    required this.colors,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 15),
      child: PhysicalModel(
        color: Colors.white,
        elevation: 6,
        shadowColor: Colors.black,
        borderRadius: BorderRadius.circular(15),
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 110,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: colors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -40,
                top: 10,
                child: Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white.withOpacity(0.15),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.white,
                      child: Image.asset(image, width: 35),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            city,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Min $min°C',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                          Text(
                            'Max $max°C',
                            style: TextStyle(color: Colors.white, fontSize: 11),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '$current°C',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
