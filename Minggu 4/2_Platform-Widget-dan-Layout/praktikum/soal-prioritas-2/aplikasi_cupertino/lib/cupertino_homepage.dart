import 'package:flutter/cupertino.dart';

class MyCupertinoHomePage extends StatelessWidget {
  const MyCupertinoHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(middle: Text('CupertinoApp')),
        child: Center(child: Text('This is CupertinoApp')));
  }
}
