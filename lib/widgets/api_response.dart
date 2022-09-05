import 'package:flutter/material.dart';

class APIResponse extends StatelessWidget {
  final int statusCode, responseTime, responseSize;
  final String responseBody;
  final Map<String, String> responseHeaders;
  const APIResponse(
      {Key? key,
      required this.statusCode,
      required this.responseSize,
      required this.responseTime,
      required this.responseBody,
      required this.responseHeaders})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Widget> headers = <Widget>[];
    responseHeaders.forEach((key, value) {
      headers.add(
        Row(
          children: <Widget>[
            Expanded(
              child: SizedBox(
                child: Text(
                  '$key : ',
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            Expanded(
              child: SizedBox(
                child: Text(
                  value,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
          ],
        ),
      );
    });
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('Status Code: $statusCode'),
                Text('Response Time: $responseTime ms'),
                Text('Response Size: ${responseSize / 1000} kb'),
              ],
            ),
            const Divider(),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 8,
                    child: ListView(
                      children: [
                        const Text(
                          'Body',
                          style: TextStyle(fontSize: 24),
                        ),
                        Text(responseBody)
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView(
                      children: [
                        const Text(
                          'Headers',
                          style: TextStyle(fontSize: 24),
                        ),
                        Row(
                          children: const <Widget>[
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  'Header Key',
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                child: Text(
                                  'Header Value',
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        ...headers
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
