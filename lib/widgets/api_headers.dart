import 'package:flutter/material.dart';

class APIHeaders extends StatefulWidget {
  final Function changeHeadersObj;
  final String pp = 'sup';
  const APIHeaders({Key? key, required this.changeHeadersObj})
      : super(key: key);

  @override
  State<APIHeaders> createState() => _APIHeadersState();
}

class _APIHeadersState extends State<APIHeaders> {
  final Map<String, String> headersObj = <String, String>{};
  void addHeaders(String key, String value) {
    setState(() {
      headersObj.addAll({key: value});
    });
    print('from addHeaders : $headersObj');
    widget.changeHeadersObj(headersObj);
  }

  void deleteHeaders(String key) {
    setState(() {
      headersObj.remove(key);
    });
    print('from deleteHeaders : $headersObj');
    widget.changeHeadersObj(headersObj);
  }

  Widget buildValuedHeaders(
      TextEditingController ctKey, TextEditingController ctValue) {
    return Row(
      children: [
        Flexible(
          flex: 1,
          child: TextField(
            enabled: false,
            decoration: const InputDecoration(label: Text('Header key')),
            controller: ctKey,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Flexible(
          flex: 2,
          child: TextField(
            enabled: false,
            decoration: const InputDecoration(label: Text('Header value')),
            controller: ctValue,
          ),
        ),
        IconButton(
            onPressed: () => deleteHeaders(ctKey.text),
            icon: const Icon(Icons.delete_rounded))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController headerKeyEditingController = TextEditingController();
    TextEditingController headerValueEditingController =
        TextEditingController();
    List<Widget> headerWidgets = <Widget>[];
    Map<TextEditingController, TextEditingController>
        headersEditingControllers =
        <TextEditingController, TextEditingController>{};
    headersObj.forEach((key, value) {
      TextEditingController a = TextEditingController(text: key);
      TextEditingController b = TextEditingController(text: value);
      headersEditingControllers.addAll({a: b});
      headerWidgets.add(buildValuedHeaders(a, b));
    });
    return ListView(
      children: [
        ...headerWidgets,
        Row(
          children: [
            Flexible(
              flex: 1,
              child: TextField(
                decoration: const InputDecoration(label: Text('Header key')),
                controller: headerKeyEditingController,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Flexible(
              flex: 2,
              child: TextField(
                decoration: const InputDecoration(label: Text('Header value')),
                controller: headerValueEditingController,
              ),
            ),
            IconButton(
                onPressed: () => addHeaders(headerKeyEditingController.text,
                    headerValueEditingController.text),
                icon: const Icon(Icons.add))
          ],
        )
      ],
    );
  }
}
