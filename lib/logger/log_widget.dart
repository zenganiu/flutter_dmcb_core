import 'package:flutter/material.dart';
import 'package:dmcb_core/dmcb_core.dart';

import 'log_cell.dart';
import 'log_entity.dart';

class LogWidget extends StatefulWidget {
  const LogWidget({Key? key}) : super(key: key);

  @override
  _LogWidgetState createState() => _LogWidgetState();
}

class _LogWidgetState extends State<LogWidget> {
  bool _showSearch = false;
  String _keyword = "";
  late TextEditingController _textController;
  late ScrollController _scrollController;
  late FocusNode _focusNode;
  bool _goDown = true;
  final List<LogType> _selectTypes = [
    LogType.log,
    LogType.debug,
    LogType.warn,
    LogType.error
  ];
  @override
  void initState() {
    _textController = TextEditingController(text: _keyword);
    _scrollController = ScrollController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildTools(),
          Expanded(
            child: ValueListenableBuilder<int>(
              valueListenable: LogEntity.length,
              builder: (context, value, child) {
                List<LogEntity> logs = LogEntity.list;
                if (_selectTypes.length < 4 || _keyword.isNotEmpty) {
                  logs = LogEntity.list.where((test) {
                    return _selectTypes.contains(test.type) &&
                        test.contains(_keyword);
                  }).toList();
                }

                final len = logs.length;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final item = DLogger.config.reverse
                        ? logs[len - index - 1]
                        : logs[index];
                    return LogCell(data: item);
                  },
                  itemCount: len,
                  controller: _scrollController,
                  separatorBuilder: (context, index) {
                    return Container();
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'dmcb_logger_log',
        onPressed: () {
          if (_goDown) {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent * 2,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          } else {
            _scrollController.animateTo(
              0,
              curve: Curves.easeOut,
              duration: const Duration(milliseconds: 300),
            );
          }
          _goDown = !_goDown;
          setState(() {});
        },
        mini: true,
        child: Icon(
          _goDown ? Icons.arrow_downward : Icons.arrow_upward,
        ),
      ),
    );
  }

  Widget _buildTools() {
    final List<ChoiceChip> arr = LogType.values
        .map(
          (e) => ChoiceChip(
            label: Text(
              e.tabFlag().replaceAll(RegExp(r"\[|\]"), ''),
              style: const TextStyle(fontSize: 14),
            ),
            selectedColor: const Color(0xFFCBE2F6),
            selected: _selectTypes.contains(e),
            onSelected: (value) {
              _selectTypes.contains(e)
                  ? _selectTypes.remove(e)
                  : _selectTypes.add(e);
              setState(() {});
            },
          ),
        )
        .toList();

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 5, 0, 5),
      child: AnimatedCrossFade(
        crossFadeState:
            _showSearch ? CrossFadeState.showSecond : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 300),
        firstChild: Row(
          children: [
            Expanded(
              child: Wrap(
                spacing: 5,
                children: arr,
              ),
            ),
            const IconButton(
              icon: Icon(Icons.clear),
              onPressed: LogEntity.clear,
            ),
            IconButton(
              icon: _keyword.isEmpty
                  ? const Icon(Icons.search)
                  : const Icon(Icons.filter_1),
              onPressed: () {
                _showSearch = true;
                setState(() {});
                _focusNode.requestFocus();
              },
            ),
          ],
        ),
        secondChild: Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 36,
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(6),
                  ),
                  controller: _textController,
                  focusNode: _focusNode,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                _showSearch = false;
                _keyword = _textController.text;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
