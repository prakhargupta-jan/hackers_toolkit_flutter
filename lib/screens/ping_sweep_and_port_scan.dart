import 'package:flutter/material.dart';
import 'package:swiss_hackers_knife/utils/handlePingSweepAndPortScan.dart';
import '../widgets/ping_sweep_and_port_scan_input_fields.dart';
import '../widgets/ping_sweep_and_port_scan_results.dart';

class PingSweepAndPortScan extends StatefulWidget {
  static const String routeName = '/tools/ping_sweep_and_port_scanner';
  const PingSweepAndPortScan({Key? key}) : super(key: key);

  @override
  State<PingSweepAndPortScan> createState() => _PingSweepAndPortScanState();
}

class _PingSweepAndPortScanState extends State<PingSweepAndPortScan> {
  String portsString = '';
  String scanType = 'ping', subnet = '/28', ip = '192.168.0.0', portSelection = 'top-1000';
  Map<String, String> response = <String, String>{};
  bool isLoading = false;
  void search(List<int> ports, {required String typeOfScan, required String subnetMask, required String ip, required String selectionOfPorts}) {
    setState(() {
      isLoading = true;
    });
    if (typeOfScan == 'port' && selectionOfPorts == 'top-1000') {
      ports = topPorts;
    } else if (typeOfScan == 'port' && selectionOfPorts == 'all') {
      ports = List.generate(65535, (index) => index + 1);
    }
    print(ip + subnet);
    portsString = ports.join(' ');
    scanType = typeOfScan;
    subnet = subnetMask;
    this.ip = ip;
    portSelection = selectionOfPorts;
    handlePingSweepAndPortScan(typeOfScan: typeOfScan, ip: ip, ports: ports, subnetMask: subnetMask).then((res) {
      setState(() {
        response.clear();
        response.addAll(res);
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ping Sweep and Port Scan',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          PingSweepAndPortScanInputFields(
            search: search,
            inputType: scanType,
            ip: ip,
            portSelection: portSelection,
            ports: portsString,
            subnetMask: subnet,
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
          ),
          const Text(
            'Response',
            style: TextStyle(fontSize: 24),
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          if (isLoading) const CircularProgressIndicator() else PingSweepAndPortScanResults(response: response)
        ],
      ),
    );
  }
}
