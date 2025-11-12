
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Activity 1',
    home: Scaffold(
      body: Column(
        children: [
          Container(
              height: 100,
              color: Colors.white,
            ),
            Container(
              height: 200,
              color: Colors.blue,
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 100,
                    color: Colors.green,
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  color: Colors.pinkAccent,
                ),
              ],
            ),
            
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                ),
                SizedBox(width: 20),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                ),
                SizedBox(width: 20),
                Container(
                  height: 100,
                  width: 100,
                  color: Colors.yellow,
                ),
              ],
            ),

            SizedBox(height: 20),

            Expanded(
              child: Container(
                color: Colors.pink,
              ),
            ),
          ],
        ),
    ),
  ));
}
