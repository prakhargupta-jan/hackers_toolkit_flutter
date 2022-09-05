import 'package:flutter/material.dart';
import 'package:swiss_hackers_knife/screens/api_test.dart';
import 'package:swiss_hackers_knife/screens/linux_commands_manual.dart';
import 'package:swiss_hackers_knife/screens/ping_sweep_and_port_scan.dart';

import 'decryptor.dart';

class Tools extends StatelessWidget {
  const Tools({Key? key}) : super(key: key);
  Widget buildWidgetBoxes(
      BuildContext context, String title, String routeName) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue.withOpacity(0.4)),
      child: InkWell(
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 24, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ),
        onTap: () {
          Navigator.of(context).pushNamed(routeName);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hack Tools'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, childAspectRatio: 3 / 2),
        children: [
          buildWidgetBoxes(context, 'Decryptor', Decryptor.routeName),
          buildWidgetBoxes(
              context, 'Linux Man Pages', LinuxCommandsManual.routeName),
          buildWidgetBoxes(context, 'API Tester', APITest.routeName),
          buildWidgetBoxes(context, 'Ping Sweep and \nPort Scan',
              PingSweepAndPortScan.routeName),
          buildWidgetBoxes(context, 'decryptor', Decryptor.routeName),
          buildWidgetBoxes(context, 'decryptor', Decryptor.routeName),
          buildWidgetBoxes(context, 'decryptor', Decryptor.routeName),
          buildWidgetBoxes(context, 'decryptor', Decryptor.routeName),
          buildWidgetBoxes(context, 'decryptor', Decryptor.routeName),
          buildWidgetBoxes(context, 'decryptor', Decryptor.routeName),
          buildWidgetBoxes(context, 'decryptor', Decryptor.routeName),
          buildWidgetBoxes(context, 'decryptor', Decryptor.routeName),
        ],
      ),
    );
  }
}
