import 'package:flutter/material.dart';
import 'package:aplikasi_flutter_tugas3/sidemenu.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang di Aplikasiku!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Aplikasi ini dibuat untuk memenuhi Tugas ke 3 Praktikum Pemob.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Nama dan NIM',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/team_member1.jpg'),
                ),
                SizedBox(width: 16),
                Text('Fatur Sakti Arrafi'),
              ],
            ),
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage('assets/images/team_member2.jpg'),
                ),
                SizedBox(width: 16),
                Text('H1D022041'),
              ],
            ),
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}