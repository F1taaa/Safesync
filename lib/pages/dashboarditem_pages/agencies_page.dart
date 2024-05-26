import 'package:flutter/material.dart';

class AgenciesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agencies'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          buildCard('Police Department', 'assets/images/logo - department2.png'),
          buildCard('Bureau of Fire Department', 'assets/images/logo - department1.png'),
          buildCard('Health Sectors', 'assets/images/logo - department3.png'),
        ],
      ),
    );
  }

  Widget buildCard(String title, String backgroundImage) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.black12),
        ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(title, style: TextStyle(fontSize: 16)),
            ),
          ),
          Image.asset(
            backgroundImage,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
