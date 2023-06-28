import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Z1Screen extends StatefulWidget {
  const Z1Screen({super.key});

  @override
  State<Z1Screen> createState() => _Z1ScreenState();
}

class _Z1ScreenState extends State<Z1Screen> {
  String response = 'response';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Z1-specific options'),
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
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(response),
            ),
          ),
        ],
      ),
    );
  }
}
