import 'package:flutter/material.dart';
import 'package:aplikasi_flutter_tugas3/sidemenu.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var username;

  Future<void> _loadUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    username = prefs.getString('username') ?? 'Guest'; // Set default to "Guest" if username is not found
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Beranda',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selamat Datang, $username!',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Ini adalah Beranda pribadimu. Jelajahi fitur kami dan temukan peluang baru.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            // Add more content here, such as user-specific recommendations or recent activity
          ],
        ),
      ),
      drawer: const Sidemenu(),
    );
  }
}