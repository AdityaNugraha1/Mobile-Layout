import 'dart:async';
import 'package:flutter/material.dart';

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
            Navigator.push(context, MaterialPageRoute(builder: (context) => BilanganPrimaPage()));
          }),
          OptionItem(title: 'Luas dan Keliling Segitiga', onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SegitigaPage()));
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

class BilanganPrimaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilangan Prima'),
      ),
      body: Center(
        child: Text('Halaman Bilangan Prima'),
      ),
    );
  }
}

class SegitigaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Luas dan Keliling Segitiga'),
      ),
      body: Center(
        child: Text('Halaman Luas dan Keliling Segitiga'),
      ),
    );
  }
}

class SitusRekomendasiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situs Rekomendasi'),
      ),
      body: Center(
        child: Text('Halaman Situs Rekomendasi'),
      ),
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
      ),
      body: Center(
        child: Text('Halaman Favorite'),
      ),
    );
  }
}

class TimerPage extends StatefulWidget {
  @override
  _TimerPageState createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  Stopwatch _stopwatch = Stopwatch();
  Timer? _timer;
  List<String> _lapTimes = [];

  void _startStopwatch() {
    if (!_stopwatch.isRunning) {
      _stopwatch.start();
      _timer = Timer.periodic(Duration(milliseconds: 100), (timer) {
        setState(() {});
      });
    }
  }

  void _stopStopwatch() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      _timer?.cancel();
    }
  }

  void _resetStopwatch() {
    _stopwatch.reset();
    _lapTimes.clear();
    setState(() {});
  }

  void _recordLapTime() {
    final String formattedTime = _formattedTime();
    setState(() {
      _lapTimes.insert(0, formattedTime);
    });
  }

  void _removeLapTime(int index) {
    setState(() {
      _lapTimes.removeAt(index);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formattedTime() {
    final int milliseconds = _stopwatch.elapsed.inMilliseconds % 1000;
    final int seconds = _stopwatch.elapsed.inSeconds % 60;
    final int minutes = _stopwatch.elapsed.inMinutes % 60;
    final int hours = _stopwatch.elapsed.inHours;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}.${(milliseconds / 100).floor().toString().padLeft(1, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                _formattedTime(),
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Monospace',
                ),
              ),
            ),
          ),
          Container(
            height: 200,
            child: ListView.builder(
              itemCount: _lapTimes.length,
              itemBuilder: (context, index) => ListTile(
                title: Text('Lap ${_lapTimes.length - index}'),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(_lapTimes[index]),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () => _removeLapTime(index),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: _startStopwatch,
                  tooltip: 'Start',
                  child: Icon(Icons.play_arrow),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _stopStopwatch,
                  tooltip: 'Stop',
                  child: Icon(Icons.stop),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _resetStopwatch,
                  tooltip: 'Reset',
                  child: Icon(Icons.refresh),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: _stopwatch.isRunning ? _recordLapTime : null,
                  tooltip: 'Lap',
                  child: Icon(Icons.flag),
                ),
              ],
            ),
          ),
        ],
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