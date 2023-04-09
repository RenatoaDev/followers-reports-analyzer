// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:followers_reports_analyzer/followers/followers_view.dart';
import 'package:followers_reports_analyzer/utils/models/ig_headers.dart';

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login com Instagram'),
        backgroundColor: const Color(0xffffb4a2),
      ),
      body: Column(children: [
        Expanded(
          child: InAppWebView(
            initialUrlRequest: URLRequest(
              url: Uri.parse(
                  'https://www.instagram.com/accounts/login/?next=https://www.instagram.com/renatoamaral.00'),
            ),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                useShouldInterceptAjaxRequest: true,
              ),
            ),
            shouldInterceptAjaxRequest: (InAppWebViewController controller,
                AjaxRequest ajaxRequest) async {
              if (ajaxRequest.url.toString().contains('query_hash')) {
                String queryHash =
                    ajaxRequest.url?.queryParameters['query_hash'] ?? '';
                String cookie = '';
                String userId = '';
                List<Cookie> cookies = await CookieManager.instance()
                    .getCookies(url: Uri.parse(ajaxRequest.url.toString()));
                for (var item in cookies) {
                  cookie += '${item.name}=${item.value};';
                  if (item.name.contains('user_id')) userId = item.value;
                }
                if (ajaxRequest.headers?.getHeaders() != null) {
                  IgHeaders headers =
                      IgHeaders.fromJson(ajaxRequest.headers!.getHeaders());
                  headers.cookie = cookie;
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (context) => FollowersView(
                                igHeaders: headers,
                                queryHash: queryHash,
                                userId: userId,
                              )),
                      (Route<dynamic> route) => false);
                }
              }
              return ajaxRequest;
            },
          ),
        ),
      ]),
    );
  }
}
