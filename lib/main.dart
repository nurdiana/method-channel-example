import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const platformChannel = EventChannel(
      'my_event_channel'); // Nama channel sesuai dengan yang didefinisikan di Swift

  String dataEvent = "";
  @override
  void initState() {
    super.initState();
    platformChannel.receiveBroadcastStream().listen((data) {
      // Menghandle peristiwa yang diterima dari Swift

      setState(() {
        dataEvent += data.toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Channel Example'),
      ),
      body: Center(
        child: Text("Data dari Obj-C ke Swift ke Dart : $dataEvent"),
      ),
    );
  }
}
