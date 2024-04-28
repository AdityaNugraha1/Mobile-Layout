import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'object/situs_rekomendasi.dart';

class SitusRekomendasiPage extends StatefulWidget {
  late SharedPreferences prefs;

  SitusRekomendasiPage({super.key});

  @override
  _SitusRekomendasiPageState createState() => _SitusRekomendasiPageState();
}

class _SitusRekomendasiPageState extends State<SitusRekomendasiPage> {
  bool isLoading = true;
  late List<String>? situsFavorit = [];
  late List<Map<String, String>> situsRekomendasi;
  late SitusRekomendasi situs;

  @override
  void initState() {
    super.initState();
    loadSitus();
    loadPrefs();
  }

  void loadSitus() {
    situs = SitusRekomendasi();
    situsRekomendasi = situs.getAll();
  }

  void loadPrefs() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if(prefs.getStringList('favorit') != null) {
      situsFavorit = prefs.getStringList('favorit');

    }
    print(situsFavorit);

    setState(() {
      isLoading = false;
    });
  }

  void setPrefs(List<String> situsFavoritt) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorit', situsFavoritt);
  }

  void toggleFavorite(int index) {
    var situsFavoritt = situsFavorit;
    if (situsFavoritt != null) {
      setState(() {
        final isFavorite = situsFavoritt.contains(index.toString());
        if (isFavorite == true) {
          situsFavoritt.remove(index.toString());
        } else {
          situsFavoritt.add(index.toString());
        }
      });
      setPrefs(situsFavoritt);
      loadPrefs();
    }
    else {
      setPrefs([index.toString()]);
      loadPrefs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Situs Rekomendasi'),
        backgroundColor: const Color.fromRGBO(143, 148, 251, 1),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: situsRekomendasi.length,
        itemBuilder: (BuildContext context, int index) {
          final site = situsRekomendasi[index];
          final isFavorite = situsFavorit?.contains(index.toString());
          return ListTile(
            leading: Container(
              width: 50,
              height: 50,
              child: Image.network(
                site["gambar"] ?? 'https://via.placeholder.com/150',
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              site["nama"] ?? 'Unknown Name',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              site["url"] ?? 'No URL',
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: IconButton(
              icon: Icon(isFavorite == true ? Icons.favorite : Icons.favorite_border,
                  color: isFavorite == true ? Colors.red : Colors.white),
              onPressed: () {
                toggleFavorite(index);
              },
            ),
            onTap: () async {
              final url = site["url"] ?? '';
              if (await canLaunch(url)) {
                await launch(url);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Could not launch $url')),
                );
              }
            },
          );
        },
      ),
      backgroundColor: const Color.fromRGBO(143, 148, 251, 0.6),
    );
  }
}