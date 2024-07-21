
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage("images/uin.png"),
              ),
              SizedBox(height: 8),
              Text(
                'Team 7 Mobile',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Profile'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(Icons.favorite),
                title: Text('Wishlist'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
              
                },
              ),
              ListTile(
                leading: Icon(Icons.question_answer),
                title: Text('FAQs'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: Icon(Icons.policy),
                title: Text('Policy'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help and Support'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                 
                },
              ),
              ListTile(
                leading: Icon(Icons.thumb_up),
                title: Text('Rate our App'),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                 
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
