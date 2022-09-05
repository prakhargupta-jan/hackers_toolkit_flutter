import 'package:flutter/material.dart';

class APIInuptFields extends StatelessWidget {
  final Function updateHttpMethod;
  final Function searchQuery;
  final String httpMethod;
  final String urlString;
  final String bodyString;
  APIInuptFields(
      {Key? key,
      required this.updateHttpMethod,
      required this.httpMethod,
      required this.searchQuery,
      required this.urlString,
      required this.bodyString})
      : super(key: key);
  final httpMethods = [
    'GET',
    'POST',
    'PUT',
    'PATCH',
    'DELETE',
  ];
  

  @override
  Widget build(BuildContext context) {
    TextEditingController urlEditingController =
        TextEditingController(text: urlString);
    TextEditingController bodyEditingController =
        TextEditingController(text: bodyString);
    
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                  value: httpMethod,
                  items: httpMethods
                      .map(
                        (e) => DropdownMenuItem(
                          child: Text(e),
                          value: e,
                        ),
                      )
                      .toList(),
                  onChanged: (_) => updateHttpMethod(_!)),
            ),
            Expanded(
              child: TextField(
                controller: urlEditingController,
                decoration: const InputDecoration(
                    label: Text('URL'), hintText: 'Enter input text here...'),
              ),
            ),
            TextButton(
                onPressed: () => searchQuery(
                    urlEditingController.text, bodyEditingController.text),
                child: const Icon(Icons.search))
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: TextField(
            maxLines: 3,
            controller: bodyEditingController,
            decoration: const InputDecoration(
                label: Text('BODY'),
                hintText: 'Enter the body you want to send with the query.'),
          ),
        ),
        
      ],
    );
  }
}
