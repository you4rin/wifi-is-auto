import 'package:flutter/material.dart';

class WifiStatus extends StatelessWidget {
  final String? ssid;
  final String? pw;

  const WifiStatus({this.ssid, this.pw});

  @override
  Widget build(BuildContext context) {
    return ssid == null
    ? Column(children: [
        Icon(
          Icons.wifi_off,
          color: Colors.blue,
          size: 260.0,
        ),
        Text(
            'Wi-Fi에 연결되지 않았습니다.',
            style: Theme.of(context).textTheme.titleLarge,
        )
      ]
    )
    : Column(children: [
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
                'SSID: $ssid',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              pw == null
                ? Text(
                  '비밀번호가 입력되지 않았습니다.',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
                : Text(
                  'PW: $pw',
                  style: Theme.of(context).textTheme.bodyLarge,
                )
            ],
          ),
      ],
    );
  }
}