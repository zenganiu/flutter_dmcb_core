import 'package:flutter/material.dart';

import 'net_entity.dart';

class NetCell extends StatefulWidget {
  final NetEntity data;
  const NetCell({Key? key, required this.data}) : super(key: key);

  @override
  _NetCellState createState() => _NetCellState();
}

class _NetCellState extends State<NetCell> {
  NetEntity get item => widget.data;
  @override
  Widget build(BuildContext context) {
    final color = _getColor(item.statusCode);
    return ExpansionTile(
      childrenPadding: const EdgeInsets.only(top: 0, right: 8, left: 8),
      tilePadding: const EdgeInsets.only(top: 4, right: 8, left: 8),
      title: Text(
        '[${item.method}] [${item.statusCode.toString()}] ${item.startTime.toString()}',
        style: const TextStyle(fontSize: 14, color: Colors.blue),
      ),
      subtitle: Text(
        item.api.toString(),
        style: const TextStyle(fontSize: 14, color: Colors.black),
      ),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('\nUrl:',
                style: TextStyle(fontSize: 14, color: Colors.purple)),
            SelectableText(
              item.api,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              toolbarOptions: const ToolbarOptions(copy: true, selectAll: true),
            ),
            const Text('\nHeader:',
                style: TextStyle(fontSize: 14, color: Colors.red)),
            SelectableText(
              item.headers,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              toolbarOptions: const ToolbarOptions(copy: true, selectAll: true),
            ),
            const Text('\nParameters:',
                style: TextStyle(fontSize: 14, color: Colors.blue)),
            SelectableText(
              item.parameters,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              toolbarOptions: const ToolbarOptions(copy: true, selectAll: true),
            ),
            const Text('\nResponseBody:',
                style: TextStyle(fontSize: 14, color: Colors.pink)),
            SelectableText(
              item.responseBody,
              style: const TextStyle(fontSize: 14, color: Colors.black),
              toolbarOptions: const ToolbarOptions(copy: true, selectAll: true),
            ),
          ],
        )
      ],
    );
  }

  Color _getColor(int status) {
    if (status == 200 || status == 0) {
      return Colors.green;
    } else if (status < 200) {
      return Colors.blue;
    } else {
      return Colors.red;
    }
  }
}
