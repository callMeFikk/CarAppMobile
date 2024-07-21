import 'package:final_mobile/screens/Home/car_home_screen.dart';
import 'package:flutter/material.dart';

class PaymentOptionsScreen extends StatefulWidget {
  @override
  _PaymentOptionsScreenState createState() => _PaymentOptionsScreenState();
}

class _PaymentOptionsScreenState extends State<PaymentOptionsScreen> {
  String _selectedPaymentMethod = 'BRI';
  List<CardModel> _cards = [
    CardModel(
      id: '1',
      title: 'BRI',
      subtitle: '** ** ** 1234',
      imagePath: 'images/bri.png',
    ),
    CardModel(
      id: '2',
      title: 'BNI',
      subtitle: '** ** ** 5678',
      imagePath: 'images/bni.png',
    ),
    CardModel(
      id: '3',
      title: 'BCA',
      subtitle: '** ** ** 9012',
      imagePath: 'images/bca.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Options'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('Preferred Payment'),
            ..._cards.map((card) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(card.imagePath),
                    radius: 20,
                  ),
                  title: Text(card.title),
                  subtitle: Text(card.subtitle),
                  trailing: Radio(
                    value: card.title,
                    groupValue: _selectedPaymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _selectedPaymentMethod = value!;
                      });
                    },
                  ),
                  onTap: () {
                    setState(() {
                      _selectedPaymentMethod = card.title;
                    });
                  },
                )),
            _buildSectionTitle('Credit & Debit Cards'),
            ListTile(
              title: Text(
                '+ Add New Card',
                style: TextStyle(color: Colors.blueAccent),
              ),
              onTap: () {
                _showAddCardDialog(context);
              },
            ),
            _buildSectionTitle('More Payment Options'),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blueAccent,
                padding: EdgeInsets.symmetric(vertical: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CarHomeScreen()),
                );
              },
              child: Text('Proceed to Pay'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.black87,
        ),
      ),
    );
  }

  void _showAddCardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add New Card'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Your form fields can go here
              Text('Form fields for adding a new card'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () {
                setState(() {
                  _cards.add(
                    CardModel(
                      id: DateTime.now().toString(),
                      title: 'New Card',
                      subtitle: '** ** ** 0000',
                      imagePath: 'images/default_card.png',
                    ),
                  );
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}

class CardModel {
  final String id;
  final String title;
  final String subtitle;
  final String imagePath;

  CardModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imagePath,
  });
}
