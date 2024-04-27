import 'package:flutter/material.dart';

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