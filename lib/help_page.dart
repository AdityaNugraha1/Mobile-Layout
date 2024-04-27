import 'package:flutter/material.dart';
import 'package:tugas4modul7/login_page.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(143, 148, 251, 1),
        title: Text("Bantuan"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Text(
              'Disini adalah pusat bantuan dimana anda dapat menemukan berbagai informasi mengenai aplikasi ini',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            ExpansionTile(
              backgroundColor: Color.fromRGBO(143, 148, 251, .6),
              title: Text(
                'Cara Penggunaan Aplikasi',
                style: TextStyle(color: Colors.white),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    '1. Pilih menu di halaman utama untuk menggunakan fitur.\n'
                        '2. Gunakan tombol di bawah untuk memulai, menghentikan, dan mereset stopwatch.\n'
                        '3. Logout melalui ikon di pojok kanan atas.\n'
                        '4. Untuk fitur lainnya, pilih dari opsi yang tersedia di halaman utama.',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 200),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 50),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => _logout(context),
                child: Text('Logout'),
              ),
            ),
            // ... Add other FAQs similarly
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
    );
  }
}
