import 'package:flutter/material.dart';
import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

class EnvirPage extends StatefulWidget {
  const EnvirPage({Key? key}) : super(key: key);

  @override
  _EnvirPageState createState() => _EnvirPageState();
}

class _EnvirPageState extends State<EnvirPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Envir'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text(
              '''
              
              width: ${DUtils.width},height: ${DUtils.height},
              pixelRatio: ${DUtils.pixelRatio},
              statusBarHeight: ${DUtils.statusBarHeight},
              bottomBarHeight: ${DUtils.bottomBarHeight}
              isProfile: ${DUtils.isProfile}
              isDebug: ${DUtils.isDebug}
              isRelease: ${DUtils.isRelease}
              isIOS: ${DUtils.isIOS}
              isAndroid: ${DUtils.isAndroid}
              isPlatformDarkMode: ${DUtils.isPlatformDarkMode}
              ''',
            ),
          ),
        ],
      ),
    );
  }
}
