import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: ListView(
          children: [
            Row(
              children: [
                Icon(Icons.account_circle,size: 30,),
                Text('루이'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.account_circle,size: 30,),
                Text('오드'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.account_circle,size: 30,),
                Text('하루'),
              ],
            ),
          ],
        ),
        bottomNavigationBar: const BottomNav(),
      ),
    );
  }
}

class BottomNav extends StatelessWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: const [
          Icon(Icons.phone),
          Icon(Icons.message),
          Icon(Icons.contact_page),
        ],
      ),
    );
  }
}

