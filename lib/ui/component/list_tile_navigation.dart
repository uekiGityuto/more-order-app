import 'package:flutter/material.dart';
import 'package:more_order_app/ui/component/snack_bar/simple_snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

enum NavigationType { push, pushReplacement, pushAndRemoveUntil, webView }

class NavigationAction {
  final BuildContext context;

  NavigationAction(this.context);

  Future<void> execute({
    required NavigationType type,
    Widget? nextPage,
    String? webURL,
  }) async {
    switch (type) {
      case NavigationType.webView:
        if (webURL != null) {
          final scaffoldMessenger = ScaffoldMessenger.of(context);
          await _openWebView(webURL, scaffoldMessenger);
        }
        break;
      case NavigationType.push:
        if (nextPage != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        }
        break;
      case NavigationType.pushReplacement:
        if (nextPage != null) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => nextPage),
          );
        }
        break;
      case NavigationType.pushAndRemoveUntil:
        if (nextPage != null) {
          Navigator.pushAndRemoveUntil(
            context,
            PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => nextPage,
              transitionDuration: const Duration(seconds: 0),
            ),

            (_) => false,
          );
        }
        break;
    }
  }

  Future<void> _openWebView(
    String webURL,
    ScaffoldMessengerState scaffoldMessenger,
  ) async {
    final url = Uri.parse(webURL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      SimpleSnackBar.show(
        scaffoldMessenger,
        message: "ページを開けませんでした。",
        type: SnackBarType.failure,
      );
    }
  }
}

class ListTileOption {
  final String title;
  final bool isContentPaddingZero;
  final NavigationType navigationType;
  final Widget? nextPage;
  final String? webURL;

  ListTileOption({
    required this.title,
    this.isContentPaddingZero = false,
    this.navigationType = NavigationType.push,
    this.nextPage,
    this.webURL,
  });
}

class ListTileNavigation extends StatelessWidget {
  final ListTileOption option;

  const ListTileNavigation({
    Key? key,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationAction = NavigationAction(context);

    return ListTile(
      title: Text(option.title),
      trailing: const Icon(Icons.arrow_forward),
      contentPadding: option.isContentPaddingZero ? EdgeInsets.zero : null,
      onTap: () => navigationAction.execute(
        type: option.navigationType,
        nextPage: option.nextPage,
        webURL: option.webURL,
      ),
    );
  }
}
