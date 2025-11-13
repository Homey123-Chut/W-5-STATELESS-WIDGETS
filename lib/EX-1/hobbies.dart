import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'The Hobbies',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey,
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 239, 215, 214),
          title: const Text(
            'My Hobbies',
            style: TextStyle(
              fontSize: 25,
              color: Colors.black,
            ),
          ),
        ),
        body: const Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                color: Colors.green,
                icon: Icons.travel_explore,
                title: 'Travelling',
              ),
              SizedBox(height: 10),
              HobbyCard(
                color: Colors.blueGrey,
                icon: Icons.skateboarding,
                title: 'Skating',
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

class HobbyCard extends StatelessWidget {
  final Color color;
  final IconData icon;
  final String title;

  const HobbyCard({
    super.key,
    this.color = Colors.blue,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 25),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
