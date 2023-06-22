import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:theta_client_flutter/theta_client_flutter.dart';
import 'package:http/http.dart' as http;

class OptionScreen extends StatefulWidget {
  const OptionScreen({Key? key}) : super(key: key);

  @override
  State<OptionScreen> createState() => _OptionScreenState();
}

class _OptionScreenState extends State<OptionScreen> {
  final _thetaClientFlutter = ThetaClientFlutter();
  String response = 'response';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Expanded(
          flex: 2,
          child: Column(
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Info',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () async {
                      final info = await _thetaClientFlutter.getThetaInfo();
                      final thetaState =
                          await _thetaClientFlutter.getThetaState();
                      setState(() {
                        response = 'model: ${info.model}\n'
                            'firmware: ${info.firmwareVersion}\n'
                            'serial number: ${info.serialNumber}\n'
                            'battery: ${thetaState.batteryLevel}';
                      });
                    },
                    child: const Text('camera', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'bitrate',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  TextButton(
                    onPressed: () async {
                      final body = {
                        'name': 'camera.getOptions',
                        'parameters': {
                          'optionNames': ['_bitrate']
                        }
                      };
                      final cameraResponse = await http.post(
                          Uri.parse('http://192.168.1.1/osc/commands/execute'),
                          body: jsonEncode(body),
                          headers: {
                            'Content-Type': 'application/json;charset=utf-8'
                          });
                      final bodyMap = jsonDecode(cameraResponse.body);
                      final options = bodyMap['results']['options'];
                      setState(() {
                        response = 'bitrate: ${options['_bitrate']}';
                      });
                    },
                    child: const Text(
                      'GET',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final body = {
                        'name': 'camera.setOptions',
                        'parameters': {
                          'options': {'_bitrate': '1048576'}
                        }
                      };
                      final cameraResponse = await http.post(
                          Uri.parse('http://192.168.1.1/osc/commands/execute'),
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
                      '1M',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final body = {
                        'name': 'camera.setOptions',
                        'parameters': {
                          'options': {'_bitrate': '5242880'}
                        }
                      };
                      final cameraResponse = await http.post(
                          Uri.parse('http://192.168.1.1/osc/commands/execute'),
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
                      '5M',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final body = {
                        'name': 'camera.setOptions',
                        'parameters': {
                          'options': {'_bitrate': '10485760'}
                        }
                      };
                      final cameraResponse = await http.post(
                          Uri.parse('http://192.168.1.1/osc/commands/execute'),
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
                      '10M',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      final body = {
                        'name': 'camera.setOptions',
                        'parameters': {
                          'options': {'_bitrate': '20971520'}
                        }
                      };
                      final cameraResponse = await http.post(
                          Uri.parse('http://192.168.1.1/osc/commands/execute'),
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
                      '21M',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  const Text('image',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () async {
                      final options = await _thetaClientFlutter.getOptions([
                        OptionNameEnum.fileFormat,
                        OptionNameEnum.filter,
                        OptionNameEnum.exposureCompensation,
                      ]);
                      setState(() {
                        response =
                            'file format: ${options.fileFormat.toString()}\n'
                            'filter: ${options.filter.toString()}\n'
                            'EV Compensation: ${options.exposureCompensation.toString()}\n';
                      });
                    },
                    child: const Text('GET', style: TextStyle(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.fileFormat = FileFormatEnum.image_11K;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.fileFormat]);
                      setState(() {
                        response =
                            'set to ${responseOptions.fileFormat.toString()}';
                      });
                    },
                    child: const Text('11K', style: TextStyle(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.fileFormat = FileFormatEnum.image_5_5K;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.fileFormat]);
                      setState(() {
                        response =
                            'set to ${responseOptions.fileFormat.toString()}';
                      });
                    },
                    child: const Text('5.5K', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
        Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              color: Colors.green[50],
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(response),
              ),
            ))
      ]),
    );
  }
}
