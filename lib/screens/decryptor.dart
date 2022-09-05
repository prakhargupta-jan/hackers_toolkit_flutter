import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/services.dart';

class Decryptor extends StatefulWidget {
  static const String routeName = '/tools/decryptor';
  const Decryptor({Key? key}) : super(key: key);

  @override
  State<Decryptor> createState() => _DecryptorState();
}

class _DecryptorState extends State<Decryptor> {
  TextEditingController textController = TextEditingController();
  TextEditingController md5textController = TextEditingController();
  TextEditingController sha1textController = TextEditingController();
  TextEditingController sha224textController = TextEditingController();
  TextEditingController sha256textController = TextEditingController();
  TextEditingController sha384textController = TextEditingController();
  TextEditingController sha512textController = TextEditingController();
  TextEditingController sha512224textController = TextEditingController();
  TextEditingController sha512256textController = TextEditingController();
  Widget outputTextField(TextEditingController cnt, String title) {
    return GestureDetector(
      onTap: () => Clipboard.setData(ClipboardData(text: cnt.text)),
      child: TextField(
        enabled: false,
        maxLines: 4,
        controller: cnt,
        decoration: InputDecoration(label: Text(title)),
      ),
    );
  }

  void handleClick() {
    md5textController.text =
        md5.convert(utf8.encode(textController.text)).toString();
    sha1textController.text =
        sha1.convert(utf8.encode(textController.text)).toString();
    sha224textController.text =
        sha224.convert(utf8.encode(textController.text)).toString();
    sha256textController.text =
        sha256.convert(utf8.encode(textController.text)).toString();
    sha384textController.text =
        sha384.convert(utf8.encode(textController.text)).toString();
    sha512textController.text =
        sha512.convert(utf8.encode(textController.text)).toString();
    sha512224textController.text =
        sha512224.convert(utf8.encode(textController.text)).toString();
    sha512256textController.text =
        sha512256.convert(utf8.encode(textController.text)).toString();
    md5textController.text =
        md5.convert(utf8.encode(textController.text)).toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Decryptor'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              maxLines: 8,
              controller: textController,
              decoration: const InputDecoration(
                  label: Text('Input'), hintText: 'Enter the text here'),
            ),
          ),
          Center(
              child: ElevatedButton(
                  onPressed: handleClick, child: const Icon(Icons.settings))),
          const Divider(
            thickness: 2,
            color: Colors.black,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: GridView(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 300, crossAxisSpacing: 16),
                children: [
                  outputTextField(md5textController, 'MD5'),
                  outputTextField(sha1textController, 'SHA-1'),
                  outputTextField(sha224textController, 'SHA-224'),
                  outputTextField(sha256textController, 'SHA-256'),
                  outputTextField(sha384textController, 'SHA-384'),
                  outputTextField(sha512textController, 'SHA-512'),
                  outputTextField(sha512224textController, 'SHA-512/224'),
                  outputTextField(sha512256textController, 'SHA-512/256'),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
