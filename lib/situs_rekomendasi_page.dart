import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List<Map<String, String>> favoriteSites = [];

class SitusRekomendasiPage extends StatefulWidget {
  @override
  _SitusRekomendasiPageState createState() => _SitusRekomendasiPageState();
}

class _SitusRekomendasiPageState extends State<SitusRekomendasiPage> {
  final List<Map<String, String>> situsRekomendasi = [
    {
      "nama": "9GAG",
      "url": "https://9gag.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "xkcd",
      "url": "https://xkcd.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Mangabat",
      "url": "https://h.mangabat.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Bored Panda",
      "url": "https://www.boredpanda.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Krunker",
      "url": "https://krunker.io/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Kaskus",
      "url": "https://www.kaskus.co.id/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Reddit",
      "url": "https://www.reddit.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Giphy",
      "url": "https://giphy.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Riot Games",
      "url": "https://www.riotgames.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "1CAK",
      "url": "https://1cak.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "GetJar",
      "url": "https://getjar.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Eagle Sealer",
      "url": "https://www.eaglesealer.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Kuyhaa",
      "url": "https://www.kuyhaa-me.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Y8 Games",
      "url": "https://www.y8.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Brilio",
      "url": "https://www.brilio.net/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "The Oatmeal",
      "url": "https://theoatmeal.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Oasis de l'Aube",
      "url": "https://oasisdelaube.org/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Waptrick",
      "url": "https://waptrick.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "Unsplash",
      "url": "https://unsplash.com/",
      "gambar": "https://via.placeholder.com/150",
    },
    {
      "nama": "WikiHow",
      "url": "https://www.wikihow.com/",
      "gambar": "https://via.placeholder.com/150",
    },
  ];

  void toggleFavorite(Map<String, String> site) {
    setState(() {
      final isFavorite = favoriteSites.any((item) => item["url"] == site["url"]);
      if (isFavorite) {
        favoriteSites.removeWhere((item) => item["url"] == site["url"]);
      } else {
        favoriteSites.add(site);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Situs Rekomendasi'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Violet theme for AppBar
      ),
      body: ListView.builder(
        itemCount: situsRekomendasi.length,
        itemBuilder: (BuildContext context, int index) {
          final site = situsRekomendasi[index];
          final isFavorite = favoriteSites.any((item) => item["url"] == site["url"]);
          return ListTile(
            leading: Image.network(site["gambar"] ?? 'https://via.placeholder.com/150'),
            title: Text(
              site["nama"] ?? 'Unknown Name',
              style: TextStyle(
                color: Colors.white, // Adjusting text color to white for contrast
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              site["url"] ?? 'No URL',
              style: TextStyle(color: Colors.white70), // Lighter white for secondary text
            ),
            trailing: IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
              ),
              onPressed: () {
                toggleFavorite(site);
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
      backgroundColor: Color.fromRGBO(143, 148, 251, 0.6), // Slightly transparent violet
    );
  }
}

class FavoritePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Violet theme for AppBar
      ),
      body: ListView.builder(
        itemCount: favoriteSites.length,
        itemBuilder: (context, index) {
          final site = favoriteSites[index];
          return ListTile(
            leading: Image.network(site["gambar"] ?? 'https://via.placeholder.com/150'),
            title: Text(
              site["nama"] ?? 'Unknown Name',
              style: TextStyle(
                color: Colors.white, // White text for better contrast
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              site["url"] ?? 'No URL',
              style: TextStyle(color: Colors.white70), // Lighter white for secondary text
            ),
            trailing: Icon(Icons.favorite, color: Colors.red),
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
      backgroundColor: Color.fromRGBO(143, 148, 251, 0.6), // Consistent background color
    );
  }
}
