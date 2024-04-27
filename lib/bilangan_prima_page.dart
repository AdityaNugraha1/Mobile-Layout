import 'package:flutter/material.dart';

class BilanganPrima extends StatefulWidget {
  const BilanganPrima({super.key});

  @override
  State<BilanganPrima> createState() => _BilanganPrimaState();
}

class _BilanganPrimaState extends State<BilanganPrima> {
  final TextEditingController optimusPrimeController = TextEditingController();
  BigInt? bilanganBigInt;
  String tulisanHasil = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bilangan Prima'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: optimusPrimeController,
              keyboardType: TextInputType.numberWithOptions(signed: true),
              enabled: true,
              decoration: const InputDecoration(
                  hintText: "Masukkan Bilangan",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(width: 8.0),
                      borderRadius: BorderRadius.all(Radius.circular(8.0)))),
            ),
            Text(tulisanHasil),
            ElevatedButton(
                onPressed: () {
                  String inputText = optimusPrimeController.text;
                  if (inputText.isNotEmpty) {
                    BigInt bilangan = BigInt.tryParse(inputText) ?? BigInt.zero;
                    bool hasil = isPrime(bilangan);
                    setState(() {
                      tulisanHasil = hasil ? "Bilangan prima $bilangan" : "Bukan bilangan prima $bilangan";
                    });
                    // tulisanHasil
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(tulisanHasil),
                    ));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Masukkan bilangan terlebih dahulu"),
                    ));
                  }
                },
                child: Text("Peler"))
          ],
        ),
      ),
    );
  }

  bool isPrime(BigInt n) {
    if (n < BigInt.two) return false;
    for (BigInt i = BigInt.two; i * i <= n; i += BigInt.one) {
      if (n % i == BigInt.zero) return false;
    }
    return true;
  }
}
