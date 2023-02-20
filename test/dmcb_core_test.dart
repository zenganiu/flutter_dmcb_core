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
      expect('123'.sensorNoEmpty(), '123');
      expect('17688454587'.replaceString(), '176****4587');
      expect('17688'.replaceString(), '17688');
      expect('17688'.replaceString(end: 5), '176****');
      expect('17688'.replaceString(start: 6, end: 5), '17688');
      expect('17688'.replaceString(start: 1, end: 2, replacement: '#'), '1#688');
      expect('123456'.reverse(), '654321');
      expect('12345'.reverse(), '54321');
      expect('12'.reverse(), '21');
      expect('1'.reverse(), '1');
    });

    test('ExDate', () {
      expect(DateTime.now().dmIsToday, true);
      expect(DateTime.now().add(const Duration(days: 1)).dmIsToday, false);
      expect(DateTime(2000, 1, 1).dmFormat(pattern: 'yyyy-MM-dd'), '2000-01-01');
      expect(DateTime(2000, 12, 1).dmFormat(pattern: 'yyyy/MM/dd'), '2000/12/01');
      expect(DateTime(2000, 1, 1, 11, 11, 11).dmFormat(pattern: 'HH:mm:ss'),
          '11:11:11');
      expect(DateTime(2000, 1, 1, 01, 02, 13).dmFormat(pattern: 'mm:ss'),
          '02:13');
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
