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
      title: 'dicom_parser example',
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
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'dicom_parser example',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView(
        children: [
          if (dicomModell != null && dicomModell!.imageBytes != null) ...[
            Image.memory(dicomModell!.imageBytes!),
          ],
          if (dicomModell != null) ...[
            for (int index = 0; index < dicomModell!.tags.length; index++) ...[
              Builder(
                builder: (context) {
                  final tag = dicomModell!.tags[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        leading: Text(
                          tag.vr,
                          style: TextStyle(fontSize: 20),
                        ),
                        title: Text(
                          '(${tag.group}, ${tag.element})',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        trailing: Text(
                          "$index",
                          style: TextStyle(fontSize: 10),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              tag.tagDescription,
                              style: TextStyle(color: Colors.blue),
                            ),
                            Text(
                              (tag.value.length > 500 && tag.vr != "SQ")
                                  ? tag.value.substring(0, 500)
                                  : tag.value,
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                    ],
                  );
                },
              ),
            ],
          ]
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
                final stopwatch = Stopwatch()..start();
                print("File Picked");
                DICOMModel dicomModel = await parseDICOM(fileBytes);

                // Parsed tags from DICOM File
                List<TagModel> tags = dicomModel.tags;

                // Parsed Image as Uint8List that can be  used in Image.memory() to view in flutter widget
                Uint8List? parsedImageBytes = dicomModel.imageBytes;

                // Get Modality of DICOM File
                String? modality = dicomModel.getModality();

                stopwatch.stop();
                print(
                    '🕒🕒🕒🕒🕒🕒 parseDICOM took ${stopwatch.elapsedMilliseconds / 1000} ms');

                setState(() {
                  dicomModell = dicomModel;
                });
              } catch (e) {
                print(e);
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
}
