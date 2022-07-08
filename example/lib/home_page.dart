import 'package:example/sliver_header_page.dart';
import 'package:example/timer_page.dart';
import 'package:flutter/material.dart';

import 'envir_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Env'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return EnvirPage();
              }));
            },
          ),
          ListTile(
            title: const Text('倒计时'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const TimerPage();
              }));
            },
          ),
          ListTile(
            title: const Text('SliverHeader'),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                return const SliverHeaderPage();
              }));
            },
          ),
        ],
      ),
    );
  }
}
