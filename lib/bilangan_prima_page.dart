import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BilanganPrima extends StatefulWidget {
  const BilanganPrima({Key? key}) : super(key: key);

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
        backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Adjusted to violet theme
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: optimusPrimeController,
                keyboardType: TextInputType.numberWithOptions(signed: true, decimal: false),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                decoration: InputDecoration(
                  hintText: "Masukkan Bilangan",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(143, 148, 251, 1)),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(143, 148, 251, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromRGBO(143, 148, 251, 1), width: 2.0),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                tulisanHasil,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String inputText = optimusPrimeController.text;
                  if (inputText.isNotEmpty) {
                    BigInt bilangan = BigInt.tryParse(inputText) ?? BigInt.zero;
                    bool hasil = isPrime(bilangan);
                    setState(() {
                      tulisanHasil = hasil ? "Bilangan prima $bilangan" : "Bukan bilangan prima $bilangan";
                    });
                    optimusPrimeController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Masukkan bilangan terlebih dahulu"),
                      backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                    ));
                  }
                },
                child: Text(
                  "Cek Prima",
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(143, 148, 251, 1),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromRGBO(143, 148, 251, 0.6),
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
