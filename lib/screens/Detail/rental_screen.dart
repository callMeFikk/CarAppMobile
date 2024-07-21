import 'package:final_mobile/model/car.dart';
import 'package:final_mobile/screens/Detail/payment_screen.dart';
import 'package:flutter/material.dart';

class RentalScreen extends StatelessWidget {
  final Car car;

  const RentalScreen({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rent car'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CarInfoCard(car: car),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  InfoSection(
                    title: 'Terms & Conditions',
                    content: 'Terms and conditions details go here.',
                  ),
                  InfoSection(
                    title: 'Personal Information & Documents',
                    content: 'Personal information and documents go here.',
                  ),
                  PriceBreakupSection(),
                ],
              ),
            ),
            ProceedToPayButton(),
          ],
        ),
      ),
    );
  }
}

class CarInfoCard extends StatelessWidget {
  final Car car;

  const CarInfoCard({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  car.image,
                  width: 50,
                  height: 50,
                ),
                SizedBox(width: 8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${car.brand} ${car.model}',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text('₹${car.price} / Day',
                        style: TextStyle(color: Colors.red)),
                  ],
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Divider(),
            Text('Starting Date & Time: Feb 14 | 10:00 AM'),
            Text('Ending Date & Time: Feb 16 | 05:00 PM'),
            Divider(),
            Text(
                'Delivery Location: 28/5, Trustpuram, Kodambakkam, Chennai-24'),
            Text('Return Location: 28/5, Trustpuram, Kodambakkam, Chennai-24'),
            Divider(),
            Text('Renter: Dinesh Kumar D'),
            Text('Rent Type: Self Driving'),
          ],
        ),
      ),
    );
  }
}

class InfoSection extends StatelessWidget {
  final String title;
  final String content;

  InfoSection({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ExpansionTile(
        title: Text(title),
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}

class PriceBreakupSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Price Breakup',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),
            Divider(),
            PriceItem(label: 'Car Rent Charges', amount: '₹4,500'),
            PriceItem(label: 'Fees & Taxes', amount: '₹450'),
            Divider(),
            PriceItem(label: 'Total Amount', amount: '₹4,950', isTotal: true),
          ],
        ),
      ),
    );
  }
}

class PriceItem extends StatelessWidget {
  final String label;
  final String amount;
  final bool isTotal;

  PriceItem({required this.label, required this.amount, this.isTotal = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
          Text(
            amount,
            style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal),
          ),
        ],
      ),
    );
  }
}

class ProceedToPayButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromARGB(255, 0, 149, 255), // Text color
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PaymentOptionsScreen()),
          );
        },
        child: Text('Proceed to Pay'),
      ),
    );
  }
}
