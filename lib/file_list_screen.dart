import 'package:theta_bitrate/photo_screen.dart';
import 'package:theta_bitrate/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:theta_client_flutter/theta_client_flutter.dart';
import 'package:numeral/numeral.dart';

import 'message_box.dart';

class FileListScreen extends StatefulWidget {
  const FileListScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _FileListScreen();
  }
}

class _FileListScreen extends State<FileListScreen> {
  var itemCount = 0;
  List<FileInfo> _fileInfoList = List<FileInfo>.empty(growable: true);
  final _thetaClientFlutter = ThetaClientFlutter();

  @override
  void initState() {
    super.initState();
    getFileList();
  }

  Future<void> getFileList() async {
    List<FileInfo>? fileInfoList;
    try {
      var result = await _thetaClientFlutter.listFiles(FileTypeEnum.all, 10000);
      fileInfoList = result.fileList;
    } on PlatformException {
      Navigator.pop(context);
      MessageBox.show(context, 'Error listFiles', () {
        Navigator.pop(context);
      });
    }

    if (!mounted) return;

    if (fileInfoList != null) {
      setState(() {
        _fileInfoList = fileInfoList!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('File List')),
        body: ListView.builder(
          itemCount: _fileInfoList.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(_fileInfoList[index].name),
              subtitle: Text(
                  'size: ${Numeral(_fileInfoList[index].size).format(fractionDigits: 1)}\n'
                  '${_fileInfoList[index].dateTime}'),
              onTap: () {
                debugPrint('index $index');
                final fileUrl = _fileInfoList[index].fileUrl;
                // fileUrl.endsWith('.MP4')/
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (_) => fileUrl.endsWith('.MP4')
                        ? VideoScreen(
                            name: _fileInfoList[index].name,
                            fileUrl: fileUrl,
                          )
                        : PhotoScreen(
                            name: _fileInfoList[index].name,
                            fileUrl: fileUrl,
                          )));
              },
              leading: Image.network(
                _fileInfoList[index].thumbnailUrl,
                width: 128,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                      width: 128,
                      color: Colors.white,
                      child: const Text('loading...'));
                },
                errorBuilder: (a, b, c) {
                  return Container(
                      width: 128,
                      color: Colors.white,
                      child: const Text('Error'));
                },
              ),
            );
          },
        ));
  }
}
