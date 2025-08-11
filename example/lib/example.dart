import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:dicom_parser/dicom_parser.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'dicom_parser',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Start(),
    );
  }
}

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  DICOMModel? dicomModell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'dicom_parser',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          if (dicomModell != null && dicomModell!.imageBytes != null) ...[
            InteractiveViewer(child: Image.memory(dicomModell!.imageBytes!)),
          ],
          if (dicomModell != null) ...[
            for (int index = 0; index < dicomModell!.tags.length; index++) ...[
              _buildTagWidget(dicomModell!.tags[index], 0, index),
            ],
          ],
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          FilePickerResult? result =
              await FilePicker.platform.pickFiles(withData: true);
          if (kIsWeb) {}
          if (result != null) {
            Uint8List? fileBytes = result.files.first.bytes;
            if (fileBytes != null) {
              try {
                var dicomParser = DICOMParser();
                DICOMModel? dicomModel =
                    await dicomParser.parseDICOMFile(fileBytes);
                if (dicomModel != null) {
                  // Parsed tags from DICOM File
                  List<TagModel> tags = dicomModel.tags;
                  if (kDebugMode) {
                    //print(tags);
                  }

                  // Parsed Image as Uint8List that can be  used in Image.memory() to view in flutter widget
                  Uint8List? parsedImageBytes = dicomModel.imageBytes;
                  if (kDebugMode) {
                    //print(parsedImageBytes);
                  }

                  // Get Modality of DICOM File
                  String? modality = dicomModel.getModality();
                  if (kDebugMode) {
                    // print(modality);
                  }

                  setState(() {
                    dicomModell = dicomModel;
                  });
                }
              } catch (e) {
                if (kDebugMode) {
                  print(e);
                }
              }
            }
          }
        },
        tooltip: 'Pick DICOM File',
        label: Text('Pick DICOM File'),
        icon: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildTagWidget(TagModel tag, int depth, int index) {
    return Padding(
      padding: EdgeInsets.only(left: 16.0 * depth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Text(tag.vr, style: TextStyle(fontSize: 16)),
            title: Text(
              '(${tag.group}, ${tag.element})',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            tileColor: (tag.vr == "SQ")
                ? Colors.yellow
                : (tag.group == "fffe" ? Colors.blue : Colors.white),
            trailing: Text("$index", style: TextStyle(fontSize: 10)),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(tag.tagDescription, style: TextStyle(color: Colors.blue)),
                if (tag.vr != "SQ") ...[
                  Text(
                    (tag.value.length > 500 && tag.vr != "SQ")
                        ? tag.value.substring(0, 500)
                        : tag.value,
                  ),
                ],
              ],
            ),
          ),
          Divider(color: Colors.grey.shade400),
        ],
      ),
    );
  }
}
