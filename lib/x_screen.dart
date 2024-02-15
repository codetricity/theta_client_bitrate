import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:theta_client_flutter/theta_client_flutter.dart';

class XScreen extends StatefulWidget {
  const XScreen({super.key});

  @override
  State<XScreen> createState() => _XScreenState();
}

class _XScreenState extends State<XScreen> {
  String response = 'response';
  final _thetaClientFlutter = ThetaClientFlutter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('X-specific options'),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Camera Must be in',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () async {
                          final options = Options();
                          options.captureMode = CaptureModeEnum.image;
                          await _thetaClientFlutter.setOptions(options);
                          await Future.delayed(
                              const Duration(milliseconds: 500));
                          final responseOptions = await _thetaClientFlutter
                              .getOptions([OptionNameEnum.captureMode]);

                          setState(() {
                            response =
                                'current mode: ${responseOptions.captureMode.toString()}';
                          });
                        },
                        child: const Text(
                          'image mode',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () async {
                        final body = {
                          'name': 'camera.setOptions',
                          'parameters': {
                            'options': {
                              'fileFormat': {
                                "type": "jpeg",
                                "width": 5504,
                                "height": 5504,
                                "_mode": {"filter": "single", "lens": "rear"}
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
                        'single lens 1',
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
                                "type": "jpeg",
                                "width": 5504,
                                "height": 5504,
                                "_mode": {"filter": "single", "lens": "front"}
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
                        'single lens 2',
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
                          'name': 'camera.setOptions',
                          'parameters': {
                            'options': {
                              'fileFormat': {
                                "type": "jpeg",
                                "width": 11008,
                                "height": 5504
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
                        '11K equirect',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        final body = {
                          'name': 'camera.setOptions',
                          'parameters': {
                            'options': {'_imageStitching': "none"}
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
                        'dual fish',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        final body = {
                          'name': 'camera.setOptions',
                          'parameters': {
                            'options': {'_imageStitching': "auto"}
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
                        'auto stitch',
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
                          'name': 'camera.takePicture',
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
                        'take picture',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Colors.black,
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Camera Must be in',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    TextButton(
                        onPressed: () async {
                          final options = Options();
                          options.captureMode = CaptureModeEnum.video;
                          await _thetaClientFlutter.setOptions(options);
                          await Future.delayed(
                              const Duration(milliseconds: 500));
                          final responseOptions = await _thetaClientFlutter
                              .getOptions([OptionNameEnum.captureMode]);

                          setState(() {
                            response =
                                'current mode: ${responseOptions.captureMode.toString()}';
                          });
                        },
                        child: const Text(
                          'video mode',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
                Row(
                  children: [
                    TextButton(
                      onPressed: () async {
                        final body = {
                          'name': 'camera.setOptions',
                          'parameters': {
                            'options': {
                              'fileFormat': {
                                "type": "mp4",
                                "width": 7680,
                                "height": 3840,
                                "_codec": "H.264/MPEG-4 AVC",
                                "_frameRate": 5
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
                        '8K 5fps',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ],
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
