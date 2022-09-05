import 'package:flutter/material.dart';
import 'package:swiss_hackers_knife/screens/api_test.dart';
import 'package:swiss_hackers_knife/screens/linux_commands_manual.dart';
import 'package:swiss_hackers_knife/screens/ping_sweep_and_port_scan.dart';
import 'package:swiss_hackers_knife/screens/tools.dart';
import 'package:swiss_hackers_knife/screens/Decryptor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (BuildContext ctx) => const Tools(),
        Decryptor.routeName: (BuildContext ctx) => const Decryptor(),
        LinuxCommandsManual.routeName: (BuildContext ctx) =>
            const LinuxCommandsManual(),
        APITest.routeName: (BuildContext ctx) => const APITest(),
        PingSweepAndPortScan.routeName: (BuildContext ctx) =>
            const PingSweepAndPortScan()
      },
    );
  }
}
