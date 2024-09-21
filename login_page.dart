import 'package:flutter/material.dart';
import 'package:aplikasi_flutter_tugas3/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
  }

  Widget _buildInput(String placeholder, bool isPassword) {
    return TextField(
      controller: isPassword ? _passwordController : _usernameController,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }

  void _showLoginSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Berhasil Masuk!'),
          content: const Text('Selamat Datang Kembali!'),
          actions: [
            TextButton(
              child: const Text('Menuju Beranda'),
              onPressed: () {
                _saveUsername();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
            ),
          ],
        );
      },
    );
  }

  void _showLoginErrorDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Login Error'),
          content: const Text('Invalid username or password.'),
          actions: [
            TextButton(
              child: const Text('Try Again'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            Image.asset(
              'assets/images/app_logo.png', 
              width: 100.0,
              height: 100.0,
            ),
            const SizedBox(height: 20.0),
            _buildInput('Masukkan Username', false),
            const SizedBox(height: 16.0),
            _buildInput('Masukkan Kata Sandi', true),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (_usernameController.text == 'admin' &&
                    _passwordController.text == 'admin') {
                  _showLoginSuccessDialog();
                } else {
                  _showLoginErrorDialog();
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50.0),
              ),
              child: const Text('Masuk'),
            ),
          ],
        ),
      ),
    );
  }
}