import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Captcha extends StatefulWidget {
  final Function callback;

  const Captcha(this.callback, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return CaptchaState();
  }
}

class CaptchaState extends State<Captcha> {
  WebViewController? webViewController;

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: WebView(
        initialUrl: "lib/demo_captcha/captche.html",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: {
          JavascriptChannel(
              name: 'Captcha',
              onMessageReceived: (JavascriptMessage message) {
                //This is where you receive message from
                //javascript code and handle in Flutter/Dart
                //like here, the message is just being printed
                //in Run/LogCat window of android studio
                //print(message.message);
                widget.callback(message.message);
                Navigator.of(context).pop();
              })
        },
        onWebViewCreated: (WebViewController w) {
          webViewController = w;
        },
      )),
    );
  }
}
