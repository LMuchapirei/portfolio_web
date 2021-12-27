import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:native_pdf_view/native_pdf_view.dart';
import 'dart:convert';
import 'dart:typed_data';

import 'package:path_provider/path_provider.dart';

import 'main.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({Key? key, required this.darkMode, required this.isDark})
      : super(key: key);
  final Function darkMode;
  final bool isDark;
  static const String route = '/resume';
  @override
  _ResumePageState createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  final pdfController =
      PdfController(document: PdfDocument.openAsset('documents/resume.pdf'));
  Widget pdfView() => PdfView(controller: pdfController);
  // Future<FileX.File> getFileFromAssets(String path) async {
  //   final byteData = await rootBundle.load('$path');

  //   final file = FileX.File('${(await getTemporaryDirectory()).path}/$path');
  //   await file.writeAsBytes(byteData.buffer
  //       .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

  //   return file;
  // }

  void downloadFile() async {
    String filePath = 'documents/resume.pdf';
    ByteData bytes = await rootBundle.load(filePath);
    Uint8List pdfBytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    final content = base64Encode(pdfBytes);
    final anchor = AnchorElement(
        href: "data:application/octet-stream;charset=utf-16le;base64,$content")
      ..setAttribute("download", "resume.pdf")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leadingWidth: 80,
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "🖐",
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  "Linval M.",
                  style: Theme.of(context).textTheme.bodyText1,
                )
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        widget.darkMode();
                      },
                      color: widget.isDark ? Colors.white : Colors.black,
                      icon: FaIcon(FontAwesomeIcons.moon)),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed(MyHomePage.route);
                    },
                    child: Text(
                      "Home",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Resume",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Blog",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Contacts",
                    style: Theme.of(context).textTheme.bodyText1,
                  )
                ],
              ),
            ),
          ],
          floating: true,
          pinned: true,
          shadowColor: Theme.of(context).appBarTheme.backgroundColor,
        ),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Text('Download'),
              IconButton(
                  onPressed: () {
                    downloadFile();
                  },
                  icon: FaIcon(FontAwesomeIcons.fileDownload)),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Container(width: 600, height: 800, child: pdfView()),
        ),
      ],
    ));
  }
}
