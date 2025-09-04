import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "EMI Calculator",
      theme: ThemeData.dark(),
      home: const EMICalculator(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class EMICalculator extends StatefulWidget {
  const EMICalculator({super.key});

  @override
  State<EMICalculator> createState() => _EMICalculatorState();
}

class _EMICalculatorState extends State<EMICalculator> {
  final _formKey = GlobalKey<FormState>();

  final _loanController = TextEditingController();
  final _rateController = TextEditingController();
  final _tenureController = TextEditingController();

  String _emiResult = "";
  String _totalInterest = "";
  String _loanAmount = "";

  void _calculateEMI() {
    if (_formKey.currentState!.validate()) {
      double P = double.parse(_loanController.text);
      double annualRate = double.parse(_rateController.text);
      int N = int.parse(_tenureController.text);

      double R = annualRate / 12 / 100; // monthly rate
      double emi = (P * R * pow(1 + R, N)) / (pow(1 + R, N) - 1);
      double totalPayment = emi * N;
      double totalInterest = totalPayment - P;

      setState(() {
        _loanAmount = "Loan Amount: ₹${P.toStringAsFixed(2)}";
        _emiResult = "Monthly EMI: ₹${emi.toStringAsFixed(2)}";
        _totalInterest = "Total Interest: ₹${totalInterest.toStringAsFixed(2)}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EMI Calculator"),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _loanController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Loan Amount",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field cannot be empty";
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return "Enter a valid positive number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _rateController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Annual Interest Rate (%)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field cannot be empty";
                  }
                  if (double.tryParse(value) == null ||
                      double.parse(value) <= 0) {
                    return "Enter a valid positive number";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              TextFormField(
                controller: _tenureController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter Loan Tenure (in months)",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "This field cannot be empty";
                  }
                  if (int.tryParse(value) == null || int.parse(value) <= 0) {
                    return "Enter a valid positive integer";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: _calculateEMI,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.purpleAccent,
                    shape: const StadiumBorder(),
                  ),
                  child: const Text("Calculate EMI"),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                _loanAmount,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                _emiResult,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                _totalInterest,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
