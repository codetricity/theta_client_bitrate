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
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  const SizedBox(
                    width: 10,
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

                      var cameraOptions = await _thetaClientFlutter.getOptions([
                        OptionNameEnum.captureMode,
                      ]);

                      var currentResponse = 'model: ${info.model}\n'
                          'firmware: ${info.firmwareVersion}\n'
                          'serial number: ${info.serialNumber}\n'
                          'battery: ${thetaState.batteryLevel}\n'
                          'mode: ${cameraOptions.captureMode}';
                      print(info.model);
                      switch (info.model) {
                        case 'RICOH THETA SC2':
                          cameraOptions = await _thetaClientFlutter.getOptions([
                            OptionNameEnum.captureMode,
                          ]);
                          currentResponse = 'model: ${info.model}\n'
                              'firmware: ${info.firmwareVersion}\n'
                              'serial number: ${info.serialNumber}\n'
                              'battery: ${thetaState.batteryLevel}\n'
                              'mode: ${cameraOptions.captureMode}';
                          break;
                        case 'RICOH THETA X':
                          cameraOptions = await _thetaClientFlutter.getOptions([
                            OptionNameEnum.captureMode,
                            OptionNameEnum.wlanFrequency,
                            OptionNameEnum.isGpsOn,
                          ]);
                          currentResponse = 'model: ${info.model}\n'
                              'firmware: ${info.firmwareVersion}\n'
                              'serial number: ${info.serialNumber}\n'
                              'battery: ${thetaState.batteryLevel}\n'
                              'mode: ${cameraOptions.captureMode}\n'
                              'WiFi frequency: ${cameraOptions.wlanFrequency}\n'
                              'GPS Enabled: ${cameraOptions.isGpsOn}';
                          break;
                        case 'RICOH THETA Z1':
                        case 'RICOH THETA V':
                          cameraOptions = await _thetaClientFlutter.getOptions([
                            OptionNameEnum.captureMode,
                            OptionNameEnum.wlanFrequency,
                          ]);
                          currentResponse = 'model: ${info.model}\n'
                              'firmware: ${info.firmwareVersion}\n'
                              'serial number: ${info.serialNumber}\n'
                              'battery: ${thetaState.batteryLevel}\n'
                              'mode: ${cameraOptions.captureMode}\n'
                              'WiFi frequency: ${cameraOptions.wlanFrequency}';
                          break;
                        default:
                          break;
                      }

                      setState(() {
                        response = currentResponse;
                      });
                    },
                    child: const Text('camera', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      'bitrate',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                            Uri.parse(
                                'http://192.168.1.1/osc/commands/execute'),
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
                        '21M',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
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
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.filter = FilterEnum.hdr;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.filter]);
                      setState(() {
                        response =
                            'filter set to ${responseOptions.filter.toString()}';
                      });
                    },
                    child: const Text('HDR', style: TextStyle(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.filter = FilterEnum.off;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.filter]);
                      setState(() {
                        response =
                            'HDR filter set to ${responseOptions.filter.toString()}';
                      });
                    },
                    child: const Text('HDR',
                        style: TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.lineThrough,
                            decorationThickness: 3.0)),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('timer',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.exposureDelay = ExposureDelayEnum.delayOff;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.exposureDelay]);
                      setState(() {
                        response =
                            'timer set to ${responseOptions.exposureDelay.toString()}';
                      });
                    },
                    child: const Text('off', style: TextStyle(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.exposureDelay = ExposureDelayEnum.delay3;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.exposureDelay]);
                      setState(() {
                        response =
                            'timer set to ${responseOptions.exposureDelay.toString()}';
                      });
                    },
                    child: const Text('3s', style: TextStyle(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.exposureDelay = ExposureDelayEnum.delay5;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.exposureDelay]);
                      setState(() {
                        response =
                            'timer set to ${responseOptions.exposureDelay.toString()}';
                      });
                    },
                    child: const Text('5s', style: TextStyle(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.exposureDelay = ExposureDelayEnum.delay10;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.exposureDelay]);
                      setState(() {
                        response =
                            'timer set to ${responseOptions.exposureDelay.toString()}';
                      });
                    },
                    child: const Text('10s', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'mode',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.captureMode = CaptureModeEnum.image;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.captureMode]);
                      setState(() {
                        response =
                            'mode: ${responseOptions.captureMode.toString()}';
                      });
                    },
                    child: const Text('image', style: TextStyle(fontSize: 18)),
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
                    child: const Text('video', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'EV',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.exposureCompensation =
                          ExposureCompensationEnum.zero;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.exposureCompensation]);
                      setState(() {
                        response =
                            'EV: ${responseOptions.exposureCompensation.toString()}';
                      });
                    },
                    child: const Text('0', style: TextStyle(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.exposureCompensation =
                          ExposureCompensationEnum.p0_3;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.exposureCompensation]);
                      setState(() {
                        response =
                            'EV: ${responseOptions.exposureCompensation.toString()}';
                      });
                    },
                    child: const Text('+.03', style: TextStyle(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.exposureCompensation =
                          ExposureCompensationEnum.p0_7;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.exposureCompensation]);
                      setState(() {
                        response =
                            'EV: ${responseOptions.exposureCompensation.toString()}';
                      });
                    },
                    child: const Text('+.07', style: TextStyle(fontSize: 18)),
                  ),
                  TextButton(
                    onPressed: () async {
                      final options = Options();
                      options.exposureCompensation =
                          ExposureCompensationEnum.p1_0;
                      await _thetaClientFlutter.setOptions(options);
                      final responseOptions = await _thetaClientFlutter
                          .getOptions([OptionNameEnum.exposureCompensation]);
                      setState(() {
                        response =
                            'EV: ${responseOptions.exposureCompensation.toString()}';
                      });
                    },
                    child: const Text('+1.0', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: () async {
                      final body = {
                        'name': 'camera.takePicture',
                      };
                      final cameraResponse = await http.post(
                          Uri.parse('http://192.168.1.1/osc/commands/execute'),
                          body: jsonEncode(body),
                          headers: {
                            'Content-Type': 'application/json;charset=utf-8'
                          });

                      setState(() {
                        response = cameraResponse.body;
                      });
                    },
                    icon: const Icon(
                      Icons.photo_camera,
                      size: 64,
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
