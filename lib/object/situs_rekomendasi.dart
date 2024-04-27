class SitusRekomendasi {
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

  Map<String, String> getSitus(int index) {
    if (index >= 0 && index < situsRekomendasi.length) {
      return situsRekomendasi[index];
    } else {
      throw Exception('Index out of bounds');
    }
  }

  List<Map<String, String>> getAll() {
    return situsRekomendasi;
  }
}
