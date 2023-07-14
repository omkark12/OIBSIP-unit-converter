import 'package:flutter/material.dart';

void main() {
  runApp(UnitConverterApp());
}

class UnitConverterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Unit Converter',
      home: UnitConverterScreen(),
    );
  }
}

class UnitConverterScreen extends StatefulWidget {
  @override
  _UnitConverterScreenState createState() => _UnitConverterScreenState();
}

class _UnitConverterScreenState extends State<UnitConverterScreen> {
  double inputValue = 0;
  double outputValue = 0;
  String selectedFromUnit = 'Centimeters';
  String selectedToUnit = 'Meters';

  final List<String> units = [
    'Centimeters',
    'Meters',
    'Kilometers',
    'Inches',
    'Feet',
    'Yards',
    'Miles',
  ];

  final Map<String, double> conversionTable = {
    'Centimeters': 1,
    'Meters': 100,
    'Kilometers': 100000,
    'Inches': 2.54,
    'Feet': 30.48,
    'Yards': 91.44,
    'Miles': 160934.4,
  };

  void convert() {
    setState(() {
      double? fromValue = conversionTable[selectedFromUnit];
      double? toValue = conversionTable[selectedToUnit];
      outputValue = inputValue * fromValue! / toValue!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade100,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade50,
        title: Text(
          'Unit Converter',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        // Wrap the Column with SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.fromLTRB(6.0, 12.0, 6.0, 6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'img/unit.jpg',
                height: 200,
                width: 200,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.teal.shade50,
                  filled: true,
                  hintText: 'Value',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    inputValue = double.tryParse(value) ?? 0.0;
                  });
                },
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10),
                    value: selectedFromUnit,
                    items: units.map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedFromUnit = value!;
                      });
                    },
                  ),
                  Icon(Icons.arrow_right_alt),
                  DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10),
                    value: selectedToUnit,
                    items: units.map((String unit) {
                      return DropdownMenuItem<String>(
                        value: unit,
                        child: Text(unit),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedToUnit = value!;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.teal.shade50),
                onPressed: convert,
                child: Text('Convert', style: TextStyle(color: Colors.black)),
              ),
              SizedBox(height: 30),
              Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: Colors.teal.shade50,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.black, width: 1),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Result: $outputValue',
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
