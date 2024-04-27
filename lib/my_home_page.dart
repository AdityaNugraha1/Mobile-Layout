import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas4modul7/bilangan_prima_page.dart';
import 'package:tugas4modul7/hitung_segitiga_page.dart';
import 'package:tugas4modul7/situs_rekomendasi_page.dart';
import 'package:tugas4modul7/stopwatch_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      const MainOptionsPage(),
      TimerPage(),
      const HelpPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {

            },
          ),
        ],
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Utama'),
          BottomNavigationBarItem(icon: Icon(Icons.stop), label: 'Stopwatch'),
          BottomNavigationBarItem(icon: Icon(Icons.help), label: 'Bantuan'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}

class MainOptionsPage extends StatelessWidget {
  const MainOptionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Halaman Utama'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          _buildOptionItem(
            title: 'Daftar Anggota',
            color: Colors.blue,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DaftarAnggotaPage()));
            },
          ),
          _buildOptionItem(
            title: 'Bilangan Prima',
            color: Colors.blue,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BilanganPrima()));
            },
          ),
          _buildOptionItem(
            title: 'Luas dan Keliling Segitiga',
            color: Colors.blue,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AreaCalculator()));
            },
          ),
          _buildOptionItem(
            title: 'Situs Rekomendasi',
            color: Colors.blue,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SitusRekomendasiPage()));
            },
          ),
          _buildOptionItem(
            title: 'Favorite',
            color: Colors.blue,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage()));
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem({required String title, required Color color, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}

class OptionItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const OptionItem({required this.title, required this.onTap, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: onTap,
    );
  }
}

class DaftarAnggotaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota'),
      ),
      body: Center(
        child: Text(
            '1. 123210100 - Yeheskiel Pambuko Aji\n'
            '2. 123210111 - Faza Denandra\n'
            '3. 123210164 - Muhammad Aditya Nugraha',
        ),
      ),
    );
  }
}

class HelpPage extends StatelessWidget {
  const HelpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
              ),
            ),
            SizedBox(height: 20),
            ExpansionTile(
              title: Text(
                'Cara Penggunaan Aplikasi',
                style: TextStyle(color: Colors.orange),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    '1. Pilih menu di halaman utama untuk menggunakan fitur.\n'
                        '2. Gunakan tombol di bawah untuk memulai, menghentikan, dan mereset stopwatch.\n'
                        '3. Logout melalui ikon di pojok kanan atas.\n'
                        '4. Untuk fitur lainnya, pilih dari opsi yang tersedia di halaman utama.',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            // ... Tambahkan FAQ lainnya dengan pola yang sama
          ],
        ),
      ),
    );
  }
}

