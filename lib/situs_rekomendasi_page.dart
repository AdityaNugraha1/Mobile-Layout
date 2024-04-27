import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List<Map<String, String>> favoriteSites = [];

class SitusRekomendasiPage extends StatefulWidget {
  @override
  _SitusRekomendasiPageState createState() => _SitusRekomendasiPageState();
}

class _SitusRekomendasiPageState extends State<SitusRekomendasiPage> {
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
      ),
      body: ListView.builder(
        itemCount: situsRekomendasi.length,
        itemBuilder: (BuildContext context, int index) {
          final site = situsRekomendasi[index];
          final isFavorite = favoriteSites.any((item) => item["url"] == site["url"]);
          return ListTile(
            title: Text(site["nama"]!),
            subtitle: Text(site["url"]!),
            trailing: IconButton(
              icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
              color: isFavorite ? Colors.red : null,
              onPressed: () {
                toggleFavorite(site);
              },
            ),
            onTap: () async {
              final url = site["url"]!;
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
      body: ListView.builder(
        itemCount: favoriteSites.length,
        itemBuilder: (context, index) {
          final site = favoriteSites[index];
          return ListTile(
            title: Text(site["nama"]!),
            subtitle: Text(site["url"]!),
            trailing: Icon(Icons.favorite, color: Colors.red),
          );
        },
      ),
    );
  }
}