import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'The hobbies',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 237, 216, 223),
          title: Text('My Hobbies',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
                ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                title: 'Travelling',
                icon: Icons.travel_explore,
                backgroundColor: Colors.green,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color backgroundColor;

  const HobbyCard({
    super.key,
    required this.title,
    required this.icon,
    this.backgroundColor = Colors.blue,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 25),
            SizedBox(width: 20),
            Text(title,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}