import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4modul7/area_calculator_page.dart';
import 'package:tugas4modul7/bilangan_prima_page.dart';
import 'package:tugas4modul7/daftar_anggota_page.dart';
<<<<<<< HEAD
import 'package:tugas4modul7/favorite_page.dart';
import 'package:tugas4modul7/login_page.dart';
=======
>>>>>>> bcce19c4b1ee81255aa2c0ec50cb852ed9422712
import 'package:tugas4modul7/situs_rekomendasi_page.dart';
import 'package:tugas4modul7/timer_page.dart';
import 'package:tugas4modul7/help_page.dart';

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
<<<<<<< HEAD
      appBar: AppBar(
        title: Text('M7'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));

              await prefs.remove('favorit');
            },
          ),
        ],
      ),
=======
>>>>>>> bcce19c4b1ee81255aa2c0ec50cb852ed9422712
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
        selectedItemColor: Color.fromRGBO(143, 148, 251, 1),
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
        backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Violet theme for AppBar
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          _buildOptionItem(
            title: 'Daftar Anggota',
            color: Colors.white,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => DaftarAnggotaPage()));
            },
          ),
          _buildOptionItem(
            title: 'Bilangan Prima',
            color: Colors.white,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => BilanganPrima()));
            },
          ),
          _buildOptionItem(
            title: 'Luas dan Keliling Segitiga',
            color: Colors.white,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AreaCalculator()));
            },
          ),
          _buildOptionItem(
            title: 'Situs Rekomendasi',
            color: Colors.white,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SitusRekomendasiPage()));
            },
          ),
          _buildOptionItem(
            title: 'Favorite',
            color: Colors.white,
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
            color: Color.fromRGBO(143, 148, 251, 1), // Light violet background color
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
              color: color, // Text color changed to white
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