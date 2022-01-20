import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

void main() {
  group('flutter core', () {
    test('ExString', () {
      expect('123456'.toMD5(), 'e10adc3949ba59abbe56e057f20f883e');
      expect('123456'.isPhone(), false);
      expect('17688454587'.isPhone(), true);
      expect('11688454587'.isPhone(), false);
      expect('#ff0000'.toColor(), const Color(0xffff0000));
      expect(''.sensorNoEmpty(), '无');
    });

    test('ExDate', () {
      expect(DateTime.now().isToday, true);
      expect(DateTime.now().add(const Duration(days: 1)).isToday, false);
    });

    test('ExColor', () {
      expect(const Color(0xffffffff).toHex, '#ffffff');
    });

    test('ExList', () {
      expect([].safeFirst, null);
      expect([].safeLast, null);
      expect([1, 3, 3].safeFirst, 1);
      expect([1, 2].safeLast, 2);
    });
  });
}
