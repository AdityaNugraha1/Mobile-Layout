import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

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
class Triangle {
  double base;
  double height;
  double side1;
  double side2;

  Triangle(this.base, this.height, this.side1, this.side2);

  double calculateArea() {
    return 0.5 * base * height;
  }

  double calculatePerimeter() {
    return base + side1 + side2;
  }
}

class AreaCalculator extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  final baseController = TextEditingController();
  final heightController = TextEditingController();
  final side1Controller = TextEditingController();
  final side2Controller = TextEditingController();
  double area = 0.0;
  double perimeter = 0.0;
  String dropdownValue = 'Luas';
  final int maxDigits = 15;

  @override
  void initState() {
    super.initState();
    baseController.addListener(() => validateInput(baseController));
    heightController.addListener(() => validateInput(heightController));
    side1Controller.addListener(() => validateInput(side1Controller));
    side2Controller.addListener(() => validateInput(side2Controller));
  }

  @override
  void dispose() {
    baseController.dispose();
    heightController.dispose();
    side1Controller.dispose();
    side2Controller.dispose();
    super.dispose();
  }

  void validateInput(TextEditingController controller) {
    if (controller.text.length > maxDigits) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Input melebihi batas maksimal $maxDigits digit.'),
          duration: Duration(seconds: 2),
        ),
      );
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  Widget buildAreaFields() {
    return Column(
      children: <Widget>[
        TextField(
          controller: baseController,
          decoration: InputDecoration(
            labelText: 'Alas',
            hintText: 'Masukkan Alas Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        SizedBox(height: 10),
        TextField(
          controller: heightController,
          decoration: InputDecoration(
            labelText: 'Tinggi',
            hintText: 'Masukkan Tinggi Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
    );
  }

  Widget buildPerimeterFields() {
    return Column(
      children: <Widget>[
        TextField(
          controller: baseController,
          decoration: InputDecoration(
            labelText: 'Sisi 1',
            hintText: 'Masukkan Sisi Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        SizedBox(height: 10),
        TextField(
          controller: side1Controller,
          decoration: InputDecoration(
            labelText: 'Sisi 2',
            hintText: 'Masukkan Sisi Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        SizedBox(height: 10),
        TextField(
          controller: side2Controller,
          decoration: InputDecoration(
            labelText: 'Sisi 3',
            hintText: 'Masukkan Sisi Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
    );
  }

  void resetFields() {
    baseController.clear();
    heightController.clear();
    side1Controller.clear();
    side2Controller.clear();
    setState(() {
      area = 0.0;
      perimeter = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Luas and Keliling Segitiga', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Luas', 'Keliling']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 16)),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: dropdownValue == 'Luas' ? buildAreaFields() : buildPerimeterFields(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Hitung $dropdownValue', style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    setState(() {
                      double base = double.parse(baseController.text);
                      if (dropdownValue == 'Luas') {
                        double height = double.parse(heightController.text);
                        Triangle triangle = Triangle(base, height, 0, 0);
                        area = triangle.calculateArea();
                      } else {
                        double side1 = double.parse(side1Controller.text);
                        double side2 = double.parse(side2Controller.text);
                        Triangle triangle = Triangle(base, 0, side1, side2);
                        perimeter = triangle.calculatePerimeter();
                      }
                    });
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Reset', style: TextStyle(fontSize: 16)),
                  onPressed: resetFields,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              dropdownValue == 'Luas' ? 'Luas: $area' : 'Keliling: $perimeter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.teal),
            ),
          ],
        ),
      ),
    );
  }
}

class SitusRekomendasiPage extends StatelessWidget {
  final List<Map<String, String>> situsRekomendasi = [
    {"nama": "9GAG", "url": "https://9gag.com/"},
    {"nama": "xkcd", "url": "https://xkcd.com/"},
    {"nama": "Mangabat", "url": "https://h.mangabat.com/"},
    {"nama": "Bored Panda", "url": "https://www.boredpanda.com/"},
    {"nama": "Krunker", "url": "https://krunker.io/"},
    {"nama": "Kaskus", "url": "https://www.kaskus.co.id/"},
    {"nama": "Reddit", "url": "https://www.reddit.com/"},
    {"nama": "Giphy", "url": "https://giphy.com/"},
    {"nama": "Riot Games", "url": "https://www.riotgames.com/"},
    {"nama": "1CAK", "url": "https://1cak.com/"},
    {"nama": "GetJar", "url": "https://getjar.com/"},
    {"nama": "Eagle Sealer", "url": "https://www.eaglesealer.com/"},
    {"nama": "Kuyhaa", "url": "https://www.kuyhaa-me.com/"},
    {"nama": "Y8 Games", "url": "https://www.y8.com/"},
    {"nama": "Brilio", "url": "https://www.brilio.net/"},
    {"nama": "The Oatmeal", "url": "https://theoatmeal.com/"},
    {"nama": "Oasis de l'Aube", "url": "https://oasisdelaube.org/"},
    {"nama": "Waptrick", "url": "https://waptrick.com/"},
    {"nama": "Unsplash", "url": "https://unsplash.com/"},
    {"nama": "WikiHow", "url": "https://www.wikihow.com/"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situs Rekomendasi'),
      ),
      body: ListView.builder(
        itemCount: situsRekomendasi.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(situsRekomendasi[index]["nama"]!),
            subtitle: Text(situsRekomendasi[index]["url"]!),
            onTap: () async {
              final url = situsRekomendasi[index]["url"]!;
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Tidak dapat membuka ${situsRekomendasi[index]["nama"]}')),
                );
              }
            },
          );
        },
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