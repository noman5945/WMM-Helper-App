import 'package:flutter/material.dart';

class BankRecord extends StatelessWidget {
  const BankRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bank Record")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.camera),
              title: const Text("Scan New Cheque"),
              subtitle: const Text("Take a photo of a chaque"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/scan-chaque');
              },
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.history),
              title: const Text("Transaction History"),
              subtitle: const Text("View previous transactions"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.pushNamed(context, '/transaction-history');
              },
            ),
          ),
        ],
      ),
    );
  }
}
