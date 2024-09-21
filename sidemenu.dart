import 'package:flutter/material.dart';
import 'package:aplikasi_flutter_tugas3/about_page.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero, // Remove default padding
        children: [
          const DrawerHeader(
            child: Text(
              'Aplikasi Tugas ke 3', // Replace with your app name
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Beranda'),
            onTap: () => Navigator.pop(context), // Close drawer on tap
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Tentang'),
            onTap: () {
              Navigator.pop(context); // Close drawer first
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AboutPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}