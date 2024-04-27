import 'package:flutter/material.dart';

class DaftarAnggotaPage extends StatelessWidget {
  final List<Map<String, String>> members = [
    {
      "nama": "Yeheskiel Pambuko Aji",
      "nim": "123210100",
      "photo": "https://via.placeholder.com/300/0000FF/808080?Text=Digital.com",  // Placeholder for large profile image
    },
    {
      "nama": "Faza Denandra",
      "nim": "123210111",
      "photo": "https://via.placeholder.com/300/FF0000/FFFFFF?Text=WebsiteBuilders.com",  // Placeholder for large profile image
    },
    {
      "nama": "Muhammad Aditya Nugraha",
      "nim": "123210164",
      "photo": "https://via.placeholder.com/300/FFFF00/000000?Text=WebsiteBuilders.com",  // Placeholder for large profile image
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Violet theme for AppBar
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(member["photo"]!),  // Larger profile image
                  radius: 100,  // Adjust the radius for a larger image
                ),
                SizedBox(height: 20),  // Space between image and text
                Text(
                  member["nama"]!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  // Adjusting text color to fit theme
                  ),
                ),
                Text(
                  member["nim"]!,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,  // Lighter white for secondary text
                  ),
                ),
                SizedBox(height: 40),  // Extra space before next member
              ],
            ),
          );
        },
      ),
      backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Consistent background color
    );
  }
}
