import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tugas4modul7/object/situs_rekomendasi.dart';
import 'package:url_launcher/url_launcher.dart';

class FavoritePage extends StatefulWidget {
  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
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
    } else {
      setPrefs([index.toString()]);
      loadPrefs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Situs Rekomendasi'),
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: situsFavorit?.length,
                itemBuilder: (BuildContext context, int index) {
                  final favoriteIndex = int.parse(situsFavorit![index]);
                  final site = situsRekomendasi[favoriteIndex];

                  return ListTile(
                    title: Text(site["nama"]!),
                    subtitle: Text(site["url"]!),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite),
                      color: Colors.red,
                      onPressed: () {
                        toggleFavorite(favoriteIndex);
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
              ));
  }
}
