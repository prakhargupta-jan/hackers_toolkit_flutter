import 'dart:convert';
import 'package:http/http.dart' as http;

Future<http.Response> resolveAPIRequest({String httpMethod = 'GET', required String urlString, String bodyString = '', required Map<String, String> headersObj}) async {
  Stopwatch stopwatch = Stopwatch();
  stopwatch.start();
  if (!urlString.startsWith('http')) {
    urlString = 'https://$urlString';
  }
  Uri url = Uri.parse(urlString);
  print('request : $httpMethod $urlString $bodyString');
  print(headersObj);
  var body = headersObj['Content-Type'] == 'application/json' ? jsonDecode(bodyString) : bodyString;
  http.Response response = http.Response('Something went horribly wrong', 500);
  if (httpMethod == 'GET') {
    response = await http.get(url, headers: headersObj);
  } else if (httpMethod == 'POST') {
    response = await http.post(url, body: body, headers: headersObj);
  } else if (httpMethod == 'DELETE') {
    response = await http.delete(url, body: body, headers: headersObj);
  } else if (httpMethod == 'PUT') {
    response = await http.put(url, body: body, headers: headersObj);
  } else if (httpMethod == 'PATCH') {
    response = await http.patch(url, body: body, headers: headersObj);
  }
  // responseObj.addAll({
  //   'status' : response.
  // })
  print('${response.statusCode} \n\n ${response.body}');
  return response;
}
