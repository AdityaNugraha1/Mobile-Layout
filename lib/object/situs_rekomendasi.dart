class SitusRekomendasi {
  final List<Map<String, String>> situsRekomendasi = [
    {"nama": "9GAG", "url": "https://9gag.com/", "gambar": "https://upload.wikimedia.org/wikipedia/commons/thumb/4/42/9gag_logo.svg/1024px-9gag_logo.svg.png"},
    {"nama": "xkcd", "url": "https://xkcd.com/", "gambar": "https://upload.wikimedia.org/wikipedia/commons/b/b5/Xkcd_philosophy.png"},
    {"nama": "Mangabat", "url": "https://h.mangabat.com/", "gambar": "https://avt.mkklcdnv6temp.com/21/l/30-1685330170.jpg"},
    {"nama": "Bored Panda", "url": "https://www.boredpanda.com/", "gambar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQlskvYQRQPmIKnDPnYjQQa1NpdFB0BvzKfzLDAZcrwuw&s"},
    {"nama": "Krunker", "url": "https://krunker.io/", "gambar": "https://ih1.redbubble.net/image.1911362625.2145/st,small,507x507-pad,600x600,f8f8f8.jpg"},
    {"nama": "Kaskus", "url": "https://www.kaskus.co.id/", "gambar": "https://s.kaskus.id/images/2015/05/04/7885078_20150504105238.jpg"},
    {"nama": "Reddit", "url": "https://www.reddit.com/", "gambar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQH5gwqSl6GQLDQbNjtWA6rnLOSVzJrx25kwLrKgdvlnA&s"},
    {"nama": "Giphy", "url": "https://giphy.com/", "gambar": "https://iconape.com/wp-content/png_logo_vector/giphy-logo.png"},
    {"nama": "Riot Games", "url": "https://www.riotgames.com/", "gambar": "https://www.riotgames.com/darkroom/800/c27d8bd8fbaca635086a6b839ad202ee:03777eeb4b8eca2df704b5694c5ef770/002-rg-2021-full-lockup-offwhite-1.jpg"},
    {"nama": "1CAK", "url": "https://1cak.com/", "gambar": "https://upload.wikimedia.org/wikipedia/commons/1/1f/1CAK-logo.png"},
    {"nama": "GetJar", "url": "https://getjar.com/", "gambar": "https://upload.wikimedia.org/wikipedia/commons/b/bf/GetJar_Logo_2012.jpg"},
    {"nama": "Eagle Sealer", "url": "https://www.eaglesealer.com/", "gambar": "https://static.wixstatic.com/media/51c53a_9832e17797f94f92a5644b1854308144~mv2.png/v1/fill/w_319,h_40,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/51c53a_9832e17797f94f92a5644b1854308144~mv2.png"},
    {"nama": "Kuyhaa", "url": "https://www.kuyhaa-me.com/", "gambar": "https://3.bp.blogspot.com/-4MZ22-NuMGE/VeMnxTnpCWI/AAAAAAAABZ4/Rvek_CjEguA/s1600/kuyhAa.png"},
    {"nama": "Y8 Games", "url": "https://www.y8.com/", "gambar": "https://play-lh.googleusercontent.com/qpOb3iZsTSd0me9Hi9ihB1e29aglo47cuoHvC2Rb1WWW_FrV94dn45_Ti6wawpUPzbc"},
    {"nama": "Brilio", "url": "https://www.brilio.net/", "gambar": "https://media.licdn.com/dms/image/C510BAQE4ijBvw5K_aw/company-logo_200_200/0/1631349653777?e=2147483647&v=beta&t=pB4cZpc7bD55gvHajE6FwFLygeJmiWAl8ijWpAAffhQ"},
    {"nama": "The Oatmeal", "url": "https://theoatmeal.com/", "gambar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRobOtyoUZNG2GH7eqzM0owe-_fUzBnhWAt0M6FOmyNrw&s"},
    {"nama": "Oasis de l'Aube", "url": "https://oasisdelaube.org/", "gambar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSTrVapPGsX_xwrilqi1U9q-4SwSIFyqWoadKFOf2Nl_A&s"},
    {"nama": "Waptrick", "url": "https://waptrick.com/", "gambar": "https://play-lh.googleusercontent.com/88fT9DGJKB_DnlmZ4B2qAHSdr7km9sxgt9KMhDC3zVToIPGiJggNxRHTF5R42_xUbh8U"},
    {"nama": "Unsplash", "url": "https://unsplash.com/", "gambar": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsTdcVj-CXWMI5fiBBVlFfDSpt-xHfoFHPn-JQEudQmQ&s"},
    {"nama": "WikiHow", "url": "https://www.wikihow.com/", "gambar": "https://play-lh.googleusercontent.com/PRyVT9EUZs5elFJfMugM-cRUQM9rzegZiLdheMh-4Oc_ehFmG5lQN6vuFxOx_AN7r50"},
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
