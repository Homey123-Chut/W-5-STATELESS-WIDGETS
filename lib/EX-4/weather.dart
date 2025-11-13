import 'package:flutter/material.dart';

enum WeatherCondition {
  cloudy(image: 'assets/cloudy.png'),
  sunny(image: 'assets/sunny.png'),
  sunnyCloudy(image: 'assets/sunnyCloudy.png'),
  veryCloudy(image: 'assets/veryCloudy.png');

  final String image;

  const WeatherCondition({
    required this.image,
  });
}

class City {
  final String name;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final WeatherCondition condition;
  final List<Color> gradientColors;

  const City({
    required this.name,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.condition,
    required this.gradientColors,
  });
}

void main() {
  runApp(
    MaterialApp(
      title: 'Weather Forecast',
      debugShowCheckedModeBanner: false,
      home: WeatherApp(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  final List<City> cities = const [
    City(
      name: 'PhnomPenh',
      minTemp: 10.0,
      maxTemp: 30.0,
      currentTemp: 12.2,
      condition: WeatherCondition.cloudy,
      gradientColors: [Color(0xFFD8B4FE), Color(0xFFC084FC)],
    ),
    City(
      name: 'Paris',
      minTemp: 10.0,
      maxTemp: 40.0,
      currentTemp: 22.2,
      condition: WeatherCondition.sunnyCloudy,
      gradientColors: [Color(0xFF6EE7B7), Color(0xFF34D399)],
    ),
    City(
      name: 'Rome',
      minTemp: 10.0,
      maxTemp: 40.0,
      currentTemp: 45.2,
      condition: WeatherCondition.sunny,
      gradientColors: [Color(0xFFFDA4AF), Color(0xFFFB7185)],
    ),
    City(
      name: 'Toulouse',
      minTemp: 10.0,
      maxTemp: 40.0,
      currentTemp: 45.2,
      condition: WeatherCondition.cloudy,
      gradientColors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
    ),
  ];

  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[300],

        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          
        ),
        
        actions: [
          IconButton(
            icon: Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: cities.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 16),
            child: WeatherCard(city: cities[index]),
          );
        },
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final City city;

  const WeatherCard({
    super.key,
    required this.city,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      shadowColor: Colors.black26,
      borderRadius: BorderRadius.circular(20),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: city.gradientColors,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Image.asset(
                    city.condition.image,
                    
                  ),
                ),
                SizedBox(width: 16),
               
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        city.name,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Min ${city.minTemp.toStringAsFixed(1)}°C',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                      Text(
                        'Max ${city.maxTemp.toStringAsFixed(1)}°C',
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${city.currentTemp.toStringAsFixed(1)}°C',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          
          Positioned(
            right: -30,
            top: -20,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white10,
              ),
            ),
          ),
          Positioned(
            right: 20,
            bottom: -40,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
