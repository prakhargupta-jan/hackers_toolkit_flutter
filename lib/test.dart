// import 'package:dart_ping/dart_ping.dart';
import './utils/handlePingSweepAndPortScan.dart';

void main() async {
  // Create ping object with desired args
  // final ping = Ping('192.168.0.0', count: 5);
  // List<String> ips = getAllIPforAGivenSubnetMask('192.168.57.128', '/25');
  // ips.forEach((element) {
  //   print(element);
  // });
  // Begin ping process and listen for output
  // print(((await ping.stream.last).toMap()['summary']['received']).runtimeType);
  // print(await handlePingSweepAndPortScan(typeOfScan: 'ping', ip: '192.168.0.0', subnetMask: '/30'));
  // print(await handlePingSweepAndPortScan(typeOfScan: 'port', ports: [22, 80, 443, 1369, 20], ip: '192.168.0.1'));
  String s = '33 33 33 ';
  List<int> sln = s.split(' ').map((e) => int.tryParse(e)).toList().where((element) => element != null).toList() as List<int>;
  print(sln);
  sln.forEach((element) {
    print(element.runtimeType);
  });
}
