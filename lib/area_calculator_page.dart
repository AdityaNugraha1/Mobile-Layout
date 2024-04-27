import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tugas4modul7/object/triangle.dart';


class AreaCalculator extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
  final baseController = TextEditingController();
  final heightController = TextEditingController();
  final side1Controller = TextEditingController();
  final side2Controller = TextEditingController();
  double area = 0.0;
  double perimeter = 0.0;
  String dropdownValue = 'Luas';
  final int maxDigits = 15;

  @override
  void initState() {
    super.initState();
    baseController.addListener(() => validateInput(baseController));
    heightController.addListener(() => validateInput(heightController));
    side1Controller.addListener(() => validateInput(side1Controller));
    side2Controller.addListener(() => validateInput(side2Controller));
  }

  @override
  void dispose() {
    baseController.dispose();
    heightController.dispose();
    side1Controller.dispose();
    side2Controller.dispose();
    super.dispose();
  }

  void validateInput(TextEditingController controller) {
    if (controller.text.length > maxDigits) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Input melebihi batas maksimal $maxDigits digit.'),
          duration: Duration(seconds: 2),
        ),
      );
      FocusScope.of(context).requestFocus(FocusNode());
    }
  }

  Widget buildAreaFields() {
    return Column(
      children: <Widget>[
        TextField(
          controller: baseController,
          decoration: InputDecoration(
            labelText: 'Alas',
            hintText: 'Masukkan Alas Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        SizedBox(height: 10),
        TextField(
          controller: heightController,
          decoration: InputDecoration(
            labelText: 'Tinggi',
            hintText: 'Masukkan Tinggi Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
    );
  }

  Widget buildPerimeterFields() {
    return Column(
      children: <Widget>[
        TextField(
          controller: baseController,
          decoration: InputDecoration(
            labelText: 'Sisi 1',
            hintText: 'Masukkan Sisi Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        SizedBox(height: 10),
        TextField(
          controller: side1Controller,
          decoration: InputDecoration(
            labelText: 'Sisi 2',
            hintText: 'Masukkan Sisi Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
        SizedBox(height: 10),
        TextField(
          controller: side2Controller,
          decoration: InputDecoration(
            labelText: 'Sisi 3',
            hintText: 'Masukkan Sisi Segitiga',
          ),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
        ),
      ],
    );
  }

  void resetFields() {
    baseController.clear();
    heightController.clear();
    side1Controller.clear();
    side2Controller.clear();
    setState(() {
      area = 0.0;
      perimeter = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Luas and Keliling Segitiga', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            DropdownButton<String>(
              value: dropdownValue,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>['Luas', 'Keliling']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value, style: TextStyle(fontSize: 18,
                  fontWeight: FontWeight.bold)),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: dropdownValue == 'Luas' ? buildAreaFields() : buildPerimeterFields(),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Hitung $dropdownValue', style: TextStyle(fontSize: 16)),
                  onPressed: () {
                    setState(() {
                      double base = double.parse(baseController.text);
                      if (dropdownValue == 'Luas') {
                        double height = double.parse(heightController.text);
                        Triangle triangle = Triangle(base, height, 0, 0);
                        area = triangle.calculateArea();
                      } else {
                        double side1 = double.parse(side1Controller.text);
                        double side2 = double.parse(side2Controller.text);
                        Triangle triangle = Triangle(base, 0, side1, side2);
                        perimeter = triangle.calculatePerimeter();
                      }
                    });
                  },
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Reset', style: TextStyle(fontSize: 16)),
                  onPressed: resetFields,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              dropdownValue == 'Luas' ? 'Luas: $area' : 'Keliling: $perimeter',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}