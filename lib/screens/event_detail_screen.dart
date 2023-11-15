import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/route_manager.dart';
import 'package:webview_flutter/webview_flutter.dart';

class EventWebViewScreen extends StatefulWidget {
  final String promotionUrl;

  const EventWebViewScreen({
    Key? key,
    required this.promotionUrl,
  }) : super(key: key);

  @override
  State<EventWebViewScreen> createState() => _EventWebViewScreenState();
}

class _EventWebViewScreenState extends State<EventWebViewScreen> {
  WebViewController? _webViewController;

  @override
  void initState() {
    _webViewController = WebViewController()
      ..loadRequest(Uri.parse(widget.promotionUrl))
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          '우아의민족',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            FontAwesomeIcons.x,
            size: 16,
          ),
        ),
      ),
      body: WebViewWidget(controller: _webViewController!),
    );
  }
}
