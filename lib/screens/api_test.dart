import 'package:flutter/material.dart';
import 'package:swiss_hackers_knife/utils/api_requests.dart';
import 'package:swiss_hackers_knife/widgets/api_headers.dart';
import 'package:swiss_hackers_knife/widgets/api_input_fields.dart';

import '../widgets/api_response.dart';

class APITest extends StatefulWidget {
  const APITest({Key? key}) : super(key: key);
  static const String routeName = '/tools/api-test';

  @override
  State<APITest> createState() => _APITestState();
}

class _APITestState extends State<APITest> {
  // Request
  String httpMethod = 'GET', urlString = '', bodyString = '';
  Map<String, String> headersObj = {'Keep-Alive': 'true', 'Content-Type': 'txt/html'};
  // Response
  var responseTime, responseSize, responseBody, responseHeaders, statusCode;
  var response;
  void updateHttpMethod(String s) {
    setState(() {
      httpMethod = s;
    });
    print(httpMethod);
  }

  void searchQuery(String url, String body) async {
    print('from searchQuery : $headersObj');
    Stopwatch stopwatch = Stopwatch();
    stopwatch.start();
    response = await resolveAPIRequest(urlString: url, headersObj: headersObj, bodyString: body, httpMethod: httpMethod);
    responseTime = stopwatch.elapsedMilliseconds;
    responseBody = response.body;
    responseSize = response.contentLength;
    statusCode = response.statusCode;
    responseHeaders = response.headers;
    setState(() {
      urlString = url;
      bodyString = body;
    });
  }

  @override
  Widget build(BuildContext context) {
    print('from build method : $headersObj');
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          APIInuptFields(
            updateHttpMethod: updateHttpMethod,
            httpMethod: httpMethod,
            searchQuery: searchQuery,
            urlString: urlString,
            bodyString: bodyString,
          ),
          Container(
            margin: const EdgeInsets.all(8),
            height: MediaQuery.of(context).size.height / 5,
            width: double.maxFinite,
            child: APIHeaders(
              changeHeadersObj: (updatedHeaders) {
                headersObj = updatedHeaders;
                print('from changeHeadersObj : $headersObj = $updatedHeaders');
              },
            ),
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
          statusCode == null
              ? const APIResponse(
                  responseSize: 0,
                  responseTime: 0,
                  statusCode: 0,
                  responseBody: '',
                  responseHeaders: {},
                )
              : APIResponse(
                  responseSize: responseSize ?? 0,
                  responseTime: responseTime,
                  statusCode: statusCode ?? 0,
                  responseBody: responseBody ?? '',
                  responseHeaders: responseHeaders ?? {},
                )
        ],
      ),
    );
  }
}
