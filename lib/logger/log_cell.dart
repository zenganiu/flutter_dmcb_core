import 'package:flutter/material.dart';
import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

import 'log_entity.dart';

class LogCell extends StatefulWidget {
  final LogEntity data;
  const LogCell({Key? key, required this.data}) : super(key: key);

  @override
  _LogCellState createState() => _LogCellState();
}

class _LogCellState extends State<LogCell> {
  LogEntity get item => widget.data;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.only(left: 8,right: 8),
      childrenPadding: const EdgeInsets.only(left: 8,right: 8),
      title: Text(
        "${item.type.tabFlag()} [date: ${item.start.toString()}]",
        style: TextStyle(fontSize: 14, color: item.type.color()),
      ),
      subtitle: Text(
        'title: ${item.title}',
        style: TextStyle(fontSize: 14, color: item.type.color()),
      ),
      children: [
        SelectableText(
          item.message,
          toolbarOptions: const ToolbarOptions(copy: true,selectAll: true),
          style: TextStyle(fontSize: 14, color: item.type.color()),
        )
      ],
    );
  }
}
