// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';

// class WebViewScreen extends StatelessWidget {
//   const WebViewScreen({super.key,  this.url});
// final String? url;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: WebViewWidget(controller: controller),
//     );
//   }
// }

// WebViewController controller = WebViewController()
//   ..setJavaScriptMode(JavaScriptMode.unrestricted)
//   ..setBackgroundColor(const Color(0x00000000))
//   ..setNavigationDelegate(
//     NavigationDelegate(
//       onProgress: (int progress) {
//         // Update loading bar.
//       },
//       onPageStarted: (String url) {},
//       onPageFinished: (String url) {},
//       onWebResourceError: (WebResourceError error) {},
//       onNavigationRequest: (NavigationRequest request) {
//         if (request.url.startsWith(url)) {
//           return NavigationDecision.prevent;
//         }
//         return NavigationDecision.navigate;
//       },
//     ),
//   )
//   ..loadRequest(Uri.parse('https://flutter.dev'));
