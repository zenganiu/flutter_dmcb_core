import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:dmcb_core/dmcb_core.dart';

class NetEntity extends ChangeNotifier {
  static const all = "All";
  static final List<NetEntity> list = [];
  static final ValueNotifier<int> length = ValueNotifier(0);
  static final Map<String, NetEntity> _map = {};
  static final List<String> types = [all];
  static final ValueNotifier<int> typeLength = ValueNotifier(1);

  NetType type;
  final String api;
  String url;
  String headers;
  String method;
  String parameters;
  final String responseBody;
  final DateTime startTime;
  int statusCode;
  bool showDetail;
  int spendTime = 0;
  int _reqSize = -1;
  int _resSize = -1;

  NetEntity({
    this.type = NetType.http,
    required this.api,
    this.url = '',
    this.headers = '',
    this.method = '',
    this.parameters = '',
    this.responseBody = '',
    required this.startTime,
    this.spendTime = 0,
    this.statusCode = 100,
    this.showDetail = false,
  });

  int getReqSize() {
    if (_resSize > -1) return _resSize;
    if (parameters.isNotEmpty) {
      try {
        return _resSize = utf8.encode(parameters).length;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return 0;
  }

  int getResSize() {
    if (_reqSize > -1) return _reqSize;
    if (responseBody.isNotEmpty) {
      try {
        return _reqSize = utf8.encode(responseBody).length;
      } catch (e) {
        debugPrint(e.toString());
      }
    }
    return 0;
  }

  bool contains(String keyword) {
    if (keyword.isEmpty) return true;
    return api.contains(keyword) ||
        responseBody.contains(keyword) ||
        parameters.contains(keyword);
  }

  @override
  String toString() {
    final StringBuffer sb = StringBuffer();
    sb.writeln("[$statusCode] $api");
    sb.writeln("Start: $startTime");
    sb.writeln("Spend: $spendTime ms");
    sb.writeln("Headers: $headers");
    sb.writeln("Request: $responseBody");
    sb.writeln("Response: $parameters");
    return sb.toString();
  }

  static void net({
    NetType type = NetType.http,
    required String api,
    String url = '',
    String method = '',
    String headers = '',
    String parameters = '',
    String responseBody = '',
    int spendTime = 0,
    int statusCode = 100,
    bool showDetail = false,
  }) {
    final net = NetEntity(
      type: type,
      api: api,
      url: url,
      headers: headers,
      method: method,
      parameters: parameters,
      responseBody: responseBody,
      spendTime: spendTime,
      statusCode: statusCode,
      showDetail: showDetail,
      startTime: DateTime.now(),
    );
    list.add(net);
    _map[api] = net;
    _clearWhenTooMuch();
    length.value++;
    if (DLogger.config.printNet) {
      final StringBuffer sb = StringBuffer();
      sb.writeln('${net.type.printFlag()}[$method] ${net.api}');
      sb.write('\nHeader: ${net.headers}');
      sb.write('\nParameters: ${net.parameters}');
      sb.writeln('\nResponseBody: ${net.responseBody}');
      debugPrint(sb.toString());
    }
  }

  static void _clearWhenTooMuch() {
    if (list.length > DLogger.config.maxLimit) {
      list.removeRange(0, (DLogger.config.maxLimit * 0.2).ceil());
    }
  }

  static void clear() {
    list.clear();
    _map.clear();
    length.value = 0;
  }
}
