import 'package:flutter/material.dart';
import 'package:internproject/Screens/payment_screen.dart';
import 'package:internproject/services/location.dart';
import 'package:internproject/widgets/costum_textfield.dart';
import 'package:internproject/widgets/oder_summery.dart';

class LocationSearchPage extends StatefulWidget {
  @override
  _LocationSearchPageState createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  final TextEditingController _controller = TextEditingController();
  final LocationService _locationService = LocationService();
  List<Map<String, dynamic>> _searchResults = [];
  String _selectedLocation = '';

  Future<void> searchLocation() async {
    final query = _controller.text;
    if (query.isNotEmpty) {
      final results = await _locationService.fetchLocationData(query);
      if (results != null) {
        setState(() {
          _searchResults = results;
          _selectedLocation = '';
        });
      } else {
        setState(() {
          _searchResults = [];
          _selectedLocation = 'No results found for "$query".';
        });
      }
    }
  }

  void selectLocation(Map<String, dynamic> location) {
    setState(() {
      _selectedLocation =
          'Selected Location: ${location['label']}\nLatitude: ${location['latitude']}\nLongitude: ${location['longitude']}';
      _searchResults = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        centerTitle: true,
        title: const Text(
          'Location Search',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shipping address',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
                hintText: 'Enter a location...',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.location_on_rounded),
                  onPressed: searchLocation,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
                child: Column(
              children: [
                _searchResults.isNotEmpty
                    ? ListView.builder(
                        itemCount: _searchResults.length,
                        itemBuilder: (context, index) {
                          final location = _searchResults[index];
                          return ListTile(
                            title: Text(location['label']),
                            onTap: () => selectLocation(location),
                          );
                        },
                      )
                    : Text(
                        _selectedLocation,
                        style: const TextStyle(fontSize: 16),
                      ),
                const SizedBox(height: 10),
                const Text(
                  'Contact Address',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
                CostumTextfield(),
              ],
            )),
            Container(
              height: 220,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.grey.shade300,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order Summary',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  OrderSummaryRow(label: 'Item Name', amount: '\$200'),
                  Divider(),
                  OrderSummaryRow(label: 'Shipping Charge', amount: '\$20'),
                  Divider(),
                  OrderSummaryRow(
                      label: 'Total', amount: '\$220', isBold: true),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
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
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PaymentScreen()));
                },
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
