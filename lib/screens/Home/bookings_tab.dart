import 'package:final_mobile/screens/Detail/payment_screen.dart';
import 'package:flutter/material.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Bookings'),
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          decoration: BoxDecoration(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: carModels.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16.0,
            mainAxisSpacing: 16.0,
            childAspectRatio: 0.75,
          ),
          itemBuilder: (context, index) {
            return CarModelCard(
              imagePath: carModels[index]['imagePath']!,
              title: carModels[index]['title']!,
            );
          },
        ),
      ),
    );
  }
}

final List<Map<String, String>> carModels = [
  {'imagePath': 'images/fortuner.png', 'title': 'Fortuner \nBookings'},
  {'imagePath': 'images/pajero.png', 'title': 'Pajero \nBookings'},
  {'imagePath': 'images/honda-crv.png', 'title': 'Honda CR-V \nBookings'},
  {'imagePath': 'images/honda-jaz.png', 'title': 'Honda Jazz \nBookings'},
  {'imagePath': 'images/xenia.png', 'title': 'Xenia \nBookings'},
  {'imagePath': 'images/Brio.png', 'title': 'Brio \nBookings'},
  {
    'imagePath': 'images/Suzuki-Ertiga.png',
    'title': 'Suzuki Ertiga \nBookings'
  },
  {'imagePath': 'images/Avansa.png', 'title': 'Avanza \nBookings'},
  {'imagePath': 'images/Agya.png', 'title': 'Agya \nBookings'},
  {'imagePath': 'images/pickup.png', 'title': 'Pickup \nBookings'},
];

class CarModelCard extends StatelessWidget {
  final String imagePath;
  final String title;

  const CarModelCard({
    required this.imagePath,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentOptionsScreen(),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.asset(imagePath,
                  fit: BoxFit.cover, height: 120, width: double.infinity),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
