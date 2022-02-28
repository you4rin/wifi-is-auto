import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';


class WifiQrModal extends StatelessWidget {
  final String ssid;
  final String pw;

  const WifiQrModal({required this.ssid, required this.pw});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.white10,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              '아래 QR을 다른 사람들에게 보여주세요.',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            QrImage(
              data: "WIFI:T:WPA;S:$ssid;P:$pw;;",
              version: QrVersions.auto,
              size: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
