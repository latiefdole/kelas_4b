import 'package:flutter/material.dart';
import 'sidebar.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          DashboardCard(
            title: 'Sales',
            value: '100K',
            icon: Icons.attach_money,
            color: Colors.blue,
          ),
          DashboardCard(
            title: 'Orders',
            value: '50',
            icon: Icons.shopping_cart,
            color: Colors.orange,
          ),
          DashboardCard(
            title: 'Users',
            value: '500',
            icon: Icons.person,
            color: Colors.green,
          ),
          DashboardCard(
            title: 'Messages',
            value: '10',
            icon: Icons.message,
            color: Colors.red,
          ),
          // Add more DashboardCard widgets as needed
        ],
      ),
      drawer: Sidebar(),
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color color;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.all(16),
      child: ListTile(
        leading: Icon(
          icon,
          size: 40,
          color: color,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(value),
      ),
    );
  }
}
