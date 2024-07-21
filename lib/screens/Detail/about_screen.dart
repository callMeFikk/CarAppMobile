import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 80.0,
              backgroundImage: AssetImage('images/uin.png'),
            ),
            SizedBox(height: 20.0),
            Text(
              'Team 7 Pemrograman Mobile',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              'Mahasiswa Teknik Informatka 2021',
              style: TextStyle(
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              '(Muh Fikri@uin-alauddin.ac.id)',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '(Fitri@uin-alauddin.ac.id)',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '(Nurul Indah@uin-alauddin.ac.id)',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
            Text(
              '(Siti Aisyah@uin-alauddin.ac.id)',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
