import 'package:theta_bitrate/capture_video_screen.dart';
import 'package:theta_bitrate/file_list_screen.dart';
import 'package:theta_bitrate/message_box.dart';
import 'package:theta_bitrate/option_screen.dart';
import 'package:theta_bitrate/take_picture_screen.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:theta_bitrate/z1_screen.dart';
import 'package:theta_client_flutter/theta_client_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'x_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _thetaClientFlutter = ThetaClientFlutter();
  bool _isInitTheta = false;
  bool _initializing = false;

  final String endpoint = 'http://192.168.1.1:80/';
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
    initTheta();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _thetaClientFlutter.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  Future<void> initTheta() async {
    if (_initializing) {
      return;
    }
    bool isInitTheta;
    try {
      isInitTheta = await _thetaClientFlutter.isInitialized();
      if (!isInitTheta) {
        _initializing = true;
        debugPrint('start initialize');
        await _thetaClientFlutter.initialize(endpoint);

        // // Client mode authentication settings
        // final config = ThetaConfig();
        // config.clientMode = DigestAuth('THETAXX12345678', '12345678');
        // await _thetaClientFlutter.initialize(endpoint, config);

        isInitTheta = true;
      }
    } on PlatformException {
      if (!mounted) return;
      debugPrint('Error. init');
      isInitTheta = false;
      MessageBox.show(context, 'Initialize error.');
    } finally {
      _initializing = false;
    }

    if (!mounted) return;

    setState(() {
      _isInitTheta = isInitTheta;
    });
  }

  void _onItemTapped(int index) {
    _selectedIndex = index;
    setState(() {
      switch (index) {
        case 0:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const OptionScreen()));
          break;
        case 1:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const Z1Screen()));
          break;
        case 2:
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const XScreen()));
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'title',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('THETA Bitrate Tester'),
        ),
        body: Home(
          platformVersion: _platformVersion,
          isInitialized: _isInitTheta,
          connectTheta: initTheta,
          thetaClientFlutter: _thetaClientFlutter,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Options'),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.z),
              label: 'Z1 video',
            ),
            BottomNavigationBarItem(
              icon: FaIcon(FontAwesomeIcons.x),
              label: 'X',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  final String platformVersion;
  final bool isInitialized;
  final Function connectTheta;
  final ThetaClientFlutter thetaClientFlutter;
  const Home({
    Key? key,
    required this.platformVersion,
    required this.isInitialized,
    required this.connectTheta,
    required this.thetaClientFlutter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String camera = isInitialized ? 'connected!' : 'disconnected';

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Running on: $platformVersion\n'),
          Text('Camera: $camera\n'),
          TextButton(
            onPressed: isInitialized
                ? null
                : () {
                    connectTheta();
                  },
            child: const Text('Connect'),
          ),
          // TextButton(
          //   onPressed: !isInitialized
          //       ? null
          //       : () {
          //           Navigator.of(context).push(MaterialPageRoute(
          //               builder: (_) => const OptionScreen()));
          //         },
          //   child: const Text('Options'),
          // ),
          TextButton(
            onPressed: !isInitialized
                ? null
                : () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const TakePictureScreen()));
                  },
            child: const Text('Take Picture'),
          ),
          TextButton(
            onPressed: !isInitialized
                ? null
                : () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const CaptureVideoScreen()));
                  },
            child: const Text('Capture Video'),
          ),
          TextButton(
            onPressed: !isInitialized
                ? null
                : () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (_) => const FileListScreen()));
                  },
            child: const Text('File List'),
          ),
        ],
      ),
    );
  }
}
