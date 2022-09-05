import 'package:flutter/material.dart';

class PingSweepAndPortScanResults extends StatelessWidget {
  final Map<String, String> response;
  const PingSweepAndPortScanResults({Key? key, required this.response}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            if (response.isEmpty)
              const Center(
                child: Text('No data to show yet'),
              )
            else
              response.containsKey('ping response') ? Text(response['ping response']!) : Text(response['port response']!),
          ],
        ),
      ),
    );
  }
}
