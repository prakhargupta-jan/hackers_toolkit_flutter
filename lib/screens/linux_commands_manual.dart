import 'package:flutter/material.dart';
import 'package:web_scraper/web_scraper.dart';

class LinuxCommandsManual extends StatefulWidget {
  const LinuxCommandsManual({Key? key}) : super(key: key);
  static const String routeName = '/tools/linux-commands-manual';

  @override
  State<LinuxCommandsManual> createState() => _LinuxCommandsManualState();
}

class _LinuxCommandsManualState extends State<LinuxCommandsManual> {
  String result = '...';
  bool isLoading = false;
  TextEditingController searchTextController = TextEditingController();
  Future<void> search() async {
    setState(() {
      isLoading = true;
    });
    final webScraper = WebScraper('http://man.he.net');
    if (await webScraper
        .loadWebPage('/?topic=${searchTextController.text}&section=all')) {
      final List<Map<String, dynamic>> resObj =
          webScraper.getElement('body', []);
      print(resObj[0]['title']);
      setState(() {
        result = resObj[0]['title'];
      });
    } else {
      setState(() {
        result = 'Something went wrong. Report to the developer.';
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MAN PAGES'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchTextController,
                    onSubmitted: (_) => search(),
                    onEditingComplete: () => search(),
                    decoration: const InputDecoration(
                        label: Text('Command'),
                        hintText: 'Enter command here...'),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: search,
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListView(
                children: <Widget>[
                  isLoading
                      ? Center(child: RefreshProgressIndicator())
                      : Text(result)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
