import 'package:flutter/material.dart';

class PingSweepAndPortScanInputFields extends StatefulWidget {
  final Function search;
  String inputType, portSelection, ip, subnetMask, ports;
  PingSweepAndPortScanInputFields({Key? key, required this.search, required this.inputType, required this.ip, required this.ports, required this.portSelection, required this.subnetMask})
      : super(key: key);

  @override
  State<PingSweepAndPortScanInputFields> createState() => _PingSweepAndPortScanInputFieldsState();
}

class _PingSweepAndPortScanInputFieldsState extends State<PingSweepAndPortScanInputFields> {
  String typeOfInput = 'ping';
  String selectionOfPorts = '';
  TextEditingController ipController = TextEditingController();
  TextEditingController subnetMaskController = TextEditingController();
  TextEditingController portsController = TextEditingController();
  List<int> stringToListOfInt(String s) {
    List<int?> p = s.split(' ').map((e) => int.tryParse(e)).toList().where((element) => element != null).toList();
    print(p);
    List<int> sln = <int>[];
    for (int? i in p) {
      if (i != null) {
        sln.add(i);
      }
    }
    return sln;
  }

  @override
  void initState() {
    typeOfInput = widget.inputType;
    selectionOfPorts = widget.portSelection;
    ipController.text = widget.ip;
    subnetMaskController.text = widget.subnetMask;
    portsController.text = selectionOfPorts == 'all' ? widget.ports : '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      height: MediaQuery.of(context).size.height / 4,
      width: double.maxFinite,
      child: ListView(
        children: <Widget>[
          Row(
            children: [
              Flexible(
                flex: 8,
                child: TextField(
                  controller: ipController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(label: Text('IP Address'), hintText: '192.168.0.0'),
                ),
              ),
              const Spacer(flex: 1),
              Flexible(
                flex: 2,
                child: TextField(
                  controller: subnetMaskController,
                  decoration: const InputDecoration(label: Text('Subnet Mask'), hintText: '/24'),
                  enabled: typeOfInput == 'ping',
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              DropdownButton(
                value: typeOfInput,
                onChanged: (String? newType) {
                  setState(() {
                    typeOfInput = newType!;
                  });
                },
                items: [
                  {'Ping Sweep': 'ping'},
                  {'Port Scan': 'port'}
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.values.elementAt(0),
                        child: Text(e.keys.elementAt(0)),
                      ),
                    )
                    .toList(),
              ),
              typeOfInput == 'port'
                  ? DropdownButton(
                      onChanged: (String? newSelection) {
                        setState(() {
                          selectionOfPorts = newSelection!;
                        });
                      },
                      value: selectionOfPorts,
                      items: [
                        {'Top 1000 Ports': 'top-1000'},
                        {'All Ports': 'all'},
                        {'Specific Ports': 'specific'}
                      ]
                          .map((e) => DropdownMenuItem(
                                value: e.values.elementAt(0),
                                child: Text(e.keys.elementAt(0)),
                              ))
                          .toList(),
                    )
                  : const Text('No need for port selection.'),
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    const Text(
                      'Search',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    IconButton(
                        icon: const Icon(Icons.search),
                        onPressed: () => widget.search(stringToListOfInt(portsController.text),
                            typeOfScan: typeOfInput, subnetMask: subnetMaskController.text, ip: ipController.text, selectionOfPorts: selectionOfPorts)),
                  ],
                ),
              )
            ],
          ),
          if (typeOfInput == 'port')
            TextField(
              enabled: selectionOfPorts == 'specific' ? true : false,
              maxLines: 3,
              controller: portsController,
              decoration: const InputDecoration(label: Text('Ports'), hintText: '22 80 443'),
            )
        ],
      ),
    );
  }
}
