import 'package:flutter/material.dart';
import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

class SliverHeaderPage extends StatefulWidget {
  const SliverHeaderPage({Key? key}) : super(key: key);

  @override
  _SliverHeaderPageState createState() => _SliverHeaderPageState();
}

class _SliverHeaderPageState extends State<SliverHeaderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SliverHeader'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, idx) {
              return ListTile(
                title: Text('第${idx + 1}部'),
              );
            }, childCount: 3),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: DSliverHeaderDelegate(
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.blueGrey,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('text'),
                  ),
                ),
                minHeight: 30,
                maxHeight: 50),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, idx) {
              return ListTile(
                title: Text('第${idx + 1}部'),
              );
            }, childCount: 10),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: DSliverHeaderDelegate(
                child: Container(
                  alignment: Alignment.centerLeft,
                  color: Colors.blueGrey,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('text'),
                  ),
                ),
                minHeight: 30,
                maxHeight: 50),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate((ctx, idx) {
              return ListTile(
                title: Text('第${idx + 1}部'),
              );
            }, childCount: 10),
          ),
        ],
      ),
    );
  }
}
