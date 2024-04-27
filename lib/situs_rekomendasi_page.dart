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
      backgroundColor: Color.fromRGBO(143, 148, 251, 0.6), // Slightly transparent violet
    );
  }
}
//
// class FavoritePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite'),
//         backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Violet theme for AppBar
//       ),
//       body: ListView.builder(
//         itemCount: favoriteSites.length,
//         itemBuilder: (context, index) {
//           final site = favoriteSites[index];
//           return ListTile(
//             leading: Image.network(site["gambar"] ?? 'https://via.placeholder.com/150'),
//             title: Text(
//               site["nama"] ?? 'Unknown Name',
//               style: TextStyle(
//                 color: Colors.white, // White text for better contrast
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             subtitle: Text(
//               site["url"] ?? 'No URL',
//               style: TextStyle(color: Colors.white70), // Lighter white for secondary text
//             ),
//             trailing: Icon(Icons.favorite, color: Colors.red),
//             onTap: () async {
//               final url = site["url"] ?? '';
//               if (await canLaunch(url)) {
//                 await launch(url);
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('Could not launch $url')),
//                 );
//               }
//             },
//           );
//         },
//       ),
//       backgroundColor: Color.fromRGBO(143, 148, 251, 0.6), // Consistent background color
//     );
//   }
// }
