import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'object/situs_rekomendasi.dart';

class SitusRekomendasiPage extends StatefulWidget {
  late SharedPreferences prefs;

  @override
  _SitusRekomendasiPageState createState() => _SitusRekomendasiPageState();
}

class _SitusRekomendasiPageState extends State<SitusRekomendasiPage> {
<<<<<<< HEAD
=======
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
>>>>>>> bcce19c4b1ee81255aa2c0ec50cb852ed9422712

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
        title: Text('Situs Rekomendasi'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Violet theme for AppBar
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: situsRekomendasi.length,
        itemBuilder: (BuildContext context, int index) {
          final site = situsRekomendasi[index];
          final isFavorite = situsFavorit?.contains(index.toString());
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
<<<<<<< HEAD
              icon: Icon(isFavorite == true ? Icons.favorite : Icons.favorite_border),
              color: isFavorite == true ? Colors.red : null,
=======
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.white,
              ),
>>>>>>> bcce19c4b1ee81255aa2c0ec50cb852ed9422712
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
      backgroundColor: Color.fromRGBO(143, 148, 251, 0.6), // Slightly transparent violet
    );
  }
}

<<<<<<< HEAD
=======
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
>>>>>>> bcce19c4b1ee81255aa2c0ec50cb852ed9422712
