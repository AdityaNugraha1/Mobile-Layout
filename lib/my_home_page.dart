import 'package:flutter/material.dart';
import 'package:tugas4modul7/area_calculator_page.dart';
import 'package:tugas4modul7/bilangan_prima_page.dart';
import 'package:tugas4modul7/daftar_anggota_page.dart';
import 'package:tugas4modul7/favorite_page.dart';
import 'package:tugas4modul7/situs_rekomendasi_page.dart';
import 'package:tugas4modul7/timer_page.dart';

List<Map<String, String>> favoriteSites = [];


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
        title: Text('M7'),
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
        selectedItemColor: Colors.amber[800],
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
        title: Text('Main Options Page'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          OptionItem(title: 'Daftar Anggota', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => DaftarAnggotaPage()));
          }),
          OptionItem(title: 'Bilangan Prima', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => BilanganPrima()));
          }),
          OptionItem(title: 'Luas dan Keliling Segitiga', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => AreaCalculator()));
          }),
          OptionItem(title: 'Situs Rekomendasi', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SitusRekomendasiPage()));
          }),
          OptionItem(title: 'Favorite', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritePage()));
          }),
        ],
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
        child: Text(
          'Cara penggunaan aplikasi:\n\n'
              '1. Pilih menu di halaman utama untuk menggunakan fitur.\n'
              '2. Gunakan tombol di bawah untuk memulai, menghentikan, dan mereset stopwatch.\n'
              '3. Logout melalui ikon di pojok kanan atas.\n'
              '4. Untuk fitur lainnya, pilih dari opsi yang tersedia di halaman utama.',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}