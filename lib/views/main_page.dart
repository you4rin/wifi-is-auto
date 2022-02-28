import 'package:flutter/material.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;
  final String wifiSsid = 'test_wifi_name';
  final String wifiPassword = '아직 Password가 지정되지 않았습니다.';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Icon(
                  Icons.signal_wifi_4_bar_lock,
                  color: Colors.blue,
                  size: 260.0,
                ),
                Text(
                  '아래 Wi-Fi에 연결되셨습니다!',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'SSID: ${widget.wifiSsid}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(
                      'PW: ${widget.wifiPassword}',
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 100,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.camera),
                    label: Text('Wi-Fi 촬영하기'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.qr_code),
                    label: Text('QR로 공유하기'),
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 20)
                    ),
                  ),
                ),
                SizedBox(height: 50.0),
              ],
            )
          ],
        )
      ),
    );
  }
}
