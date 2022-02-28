import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'widgets/wifi_qr_modal.dart';
import 'widgets/wifi_status.dart';


class MainPage extends StatefulWidget {
  const MainPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String? wifiSsid;
  String? wifiPassword;

  String dialogText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WifiStatus(ssid: wifiSsid, pw: wifiPassword),
            Column(
              children: [
                SizedBox(
                  width: 250,
                  height: 100,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.camera),
                    label: Text('Wi-Fi 촬영하기'),
                    onPressed: _pickImage,
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
                    onPressed: () => handleQrButton(context),
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

  Future<void> _pickImage() async {
    var image = await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  void handleQrButton(BuildContext context) {
    if(wifiSsid == null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          content: Text("Wi-Fi를 촬영하거나 연결해주세요."),
          actions: [
            Center(
              child: TextButton(
                child: Text('확인'),
                onPressed: () => Navigator.of(context).pop()
              )
            )
          ]
        )
      );
      return;
    }
    else if(wifiPassword == null) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => AlertDialog(
          title: Text('Password 입력'),
          content: TextField(
            onChanged: (value) {
              setState(() {
                dialogText = value;
              });
            }
          ),
          actions: [
            Center(
              child: TextButton(
                child: Text('확인'),
                onPressed: () {
                  setState(() {
                    wifiPassword = dialogText;
                  });
                  Navigator.of(context).pop();
                }
              )
            )
          ]
        )
      );
    }
    else {
      showModalBottomSheet( 
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        builder: (context) => WifiQrModal(
          ssid: wifiSsid!,
          pw: wifiPassword!
        )
      );
    }
  }
}
