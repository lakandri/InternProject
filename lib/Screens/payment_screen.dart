import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  bool _isCheckedOne = false;
  bool _isCheckedTwo = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Payment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: const Color.fromARGB(255, 235, 234, 234),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cash on Delivery',
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                      value: _isCheckedOne,
                      onChanged: (bool value) {
                        setState(() {
                          _isCheckedOne = value;
                        });
                        if (value == true) {
                          print('Pay Cash in Hand');
                        }
                      },
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 20,
            ),
// for second container

            Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                color: const Color.fromARGB(255, 235, 234, 234),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Pay with eSewa',
                      style: TextStyle(fontSize: 18),
                    ),
                    Switch(
                      value: _isCheckedTwo,
                      onChanged: (bool value) {
                        setState(() {
                          _isCheckedTwo = value;
                        });

                        if (value == true) {
                          print('Pay on eSewa');
                        }
                      },
                      activeColor: Colors.green,
                      inactiveThumbColor: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Container(
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.blueAccent),
              width: double.infinity,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.blueAccent),
                ),
                onPressed: null,
                child: const Text(
                  'Continue to payment',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
