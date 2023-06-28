import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:theta_client_flutter/theta_client_flutter.dart';

class Z1Screen extends StatefulWidget {
  const Z1Screen({super.key});

  @override
  State<Z1Screen> createState() => _Z1ScreenState();
}

class _Z1ScreenState extends State<Z1Screen> {
  final _thetaClientFlutter = ThetaClientFlutter();

  String response = 'response';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 223, 169, 88),
        foregroundColor: Colors.black54,
        title: const Text('Z1-specific video options'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text('for firmware 3.01.1 tests'),
                  Row(
                    children: [
                      const Text(
                        '3.6K x 2 files',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () async {
                          final body = {
                            'name': 'camera.setOptions',
                            'parameters': {
                              'options': {
                                'fileFormat': {
                                  "type": "mp4",
                                  "width": 3648,
                                  "height": 3648,
                                  "_codec": "H.264/MPEG-4 AVC",
                                  "_frameRate": 1
                                }
                              }
                            }
                          };
                          final cameraResponse = await http.post(
                              Uri.parse(
                                  'http://192.168.1.1/osc/commands/execute'),
                              body: jsonEncode(body),
                              headers: {
                                'Content-Type': 'application/json;charset=utf-8'
                              });
                          final bodyMap = jsonDecode(cameraResponse.body);
                          setState(() {
                            response = bodyMap.toString();
                          });
                        },
                        child: const Text(
                          '1 fps',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final body = {
                            'name': 'camera.setOptions',
                            'parameters': {
                              'options': {
                                'fileFormat': {
                                  "type": "mp4",
                                  "width": 3648,
                                  "height": 3648,
                                  "_codec": "H.264/MPEG-4 AVC",
                                  "_frameRate": 2
                                }
                              }
                            }
                          };
                          final cameraResponse = await http.post(
                              Uri.parse(
                                  'http://192.168.1.1/osc/commands/execute'),
                              body: jsonEncode(body),
                              headers: {
                                'Content-Type': 'application/json;charset=utf-8'
                              });
                          final bodyMap = jsonDecode(cameraResponse.body);
                          setState(() {
                            response = bodyMap.toString();
                          });
                        },
                        child: const Text(
                          '2 fps',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        '2.7K x 2 files',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () async {
                          final body = {
                            'name': 'camera.setOptions',
                            'parameters': {
                              'options': {
                                'fileFormat': {
                                  "type": "mp4",
                                  "width": 2688,
                                  "height": 2688,
                                  "_codec": "H.264/MPEG-4 AVC",
                                  "_frameRate": 1
                                }
                              }
                            }
                          };
                          final cameraResponse = await http.post(
                              Uri.parse(
                                  'http://192.168.1.1/osc/commands/execute'),
                              body: jsonEncode(body),
                              headers: {
                                'Content-Type': 'application/json;charset=utf-8'
                              });
                          final bodyMap = jsonDecode(cameraResponse.body);
                          setState(() {
                            response = bodyMap.toString();
                          });
                        },
                        child: const Text(
                          '1 fps',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final body = {
                            'name': 'camera.setOptions',
                            'parameters': {
                              'options': {
                                'fileFormat': {
                                  "type": "mp4",
                                  "width": 2688,
                                  "height": 2688,
                                  "_codec": "H.264/MPEG-4 AVC",
                                  "_frameRate": 2
                                }
                              }
                            }
                          };
                          final cameraResponse = await http.post(
                              Uri.parse(
                                  'http://192.168.1.1/osc/commands/execute'),
                              body: jsonEncode(body),
                              headers: {
                                'Content-Type': 'application/json;charset=utf-8'
                              });
                          final bodyMap = jsonDecode(cameraResponse.body);
                          setState(() {
                            response = bodyMap.toString();
                          });
                        },
                        child: const Text(
                          '2 fps',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'Max Record Time',
                        style: TextStyle(fontSize: 18),
                      ),
                      TextButton(
                        onPressed: () async {
                          final body = {
                            'name': 'camera.setOptions',
                            'parameters': {
                              'options': {'_maxRecordableTime': 3000}
                            }
                          };
                          final cameraResponse = await http.post(
                              Uri.parse(
                                  'http://192.168.1.1/osc/commands/execute'),
                              body: jsonEncode(body),
                              headers: {
                                'Content-Type': 'application/json;charset=utf-8'
                              });
                          final bodyMap = jsonDecode(cameraResponse.body);
                          setState(() {
                            response = bodyMap.toString();
                          });
                        },
                        child: const Text(
                          '50 min',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final body = {
                            'name': 'camera.setOptions',
                            'parameters': {
                              'options': {'_maxRecordableTime': 1500}
                            }
                          };
                          final cameraResponse = await http.post(
                              Uri.parse(
                                  'http://192.168.1.1/osc/commands/execute'),
                              body: jsonEncode(body),
                              headers: {
                                'Content-Type': 'application/json;charset=utf-8'
                              });
                          final bodyMap = jsonDecode(cameraResponse.body);
                          setState(() {
                            response = bodyMap.toString();
                          });
                        },
                        child: const Text(
                          '25 min',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final body = {
                            'name': 'camera.setOptions',
                            'parameters': {
                              'options': {'_maxRecordableTime': 300}
                            }
                          };
                          final cameraResponse = await http.post(
                              Uri.parse(
                                  'http://192.168.1.1/osc/commands/execute'),
                              body: jsonEncode(body),
                              headers: {
                                'Content-Type': 'application/json;charset=utf-8'
                              });
                          final bodyMap = jsonDecode(cameraResponse.body);
                          setState(() {
                            response = bodyMap.toString();
                          });
                        },
                        child: const Text(
                          '5 min',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          final body = {
                            'name': 'camera.getOptions',
                            'parameters': {
                              'optionNames': [
                                '_bitrate',
                                '_maxRecordableTime',
                                'fileFormat',
                                'captureMode'
                              ]
                            }
                          };
                          final cameraResponse = await http.post(
                              Uri.parse(
                                  'http://192.168.1.1/osc/commands/execute'),
                              body: jsonEncode(body),
                              headers: {
                                'Content-Type': 'application/json;charset=utf-8'
                              });
                          final bodyMap = jsonDecode(cameraResponse.body);
                          final options = bodyMap['results']['options'];
                          setState(() {
                            response = 'bitrate: ${options['_bitrate']}\n'
                                'video format: ${options["fileFormat"]}\n'
                                'max record time: ${options['_maxRecordableTime']} seconds\n'
                                'mode: ${options['captureMode']}\n';
                          });
                        },
                        child: const Text(
                          'get options',
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          final options = Options();
                          options.captureMode = CaptureModeEnum.video;
                          await _thetaClientFlutter.setOptions(options);
                          final responseOptions = await _thetaClientFlutter
                              .getOptions([OptionNameEnum.captureMode]);
                          setState(() {
                            response =
                                'mode: ${responseOptions.captureMode.toString()}';
                          });
                        },
                        child: const Text('set to video',
                            style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () async {
                          final options = Options();
                          options.captureMode = CaptureModeEnum.video;
                          await _thetaClientFlutter.deleteAllVideoFiles();
                          final cameraResponse = await _thetaClientFlutter
                              .listFiles(FileTypeEnum.all, 50);
                          final fileList = cameraResponse.fileList;
                          var filenameList = [];
                          for (var fileInfo in fileList) {
                            filenameList.add(fileInfo.name);
                          }
                          setState(() {
                            response = 'deleting video files\n'
                                'last 50 files in camera\n'
                                '$filenameList';
                          });
                        },
                        child: const Text('delete all video files',
                            style: TextStyle(fontSize: 18)),
                      ),
                      TextButton(
                        onPressed: () async {
                          final options = Options();
                          options.captureMode = CaptureModeEnum.video;
                          await _thetaClientFlutter.deleteAllImageFiles();
                          final cameraResponse = await _thetaClientFlutter
                              .listFiles(FileTypeEnum.all, 50);
                          final fileList = cameraResponse.fileList;
                          var filenameList = [];
                          for (var fileInfo in fileList) {
                            filenameList.add(fileInfo.name);
                          }
                          setState(() {
                            response = 'deleting image files\n'
                                'last 50 files in camera\n'
                                '$filenameList';
                          });
                        },
                        child: const Text('delete all image files',
                            style: TextStyle(fontSize: 18)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.orange[50],
              child: SingleChildScrollView(
                  child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(response),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
