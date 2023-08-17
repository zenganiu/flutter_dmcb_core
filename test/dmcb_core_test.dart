import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_dmcb_core/flutter_dmcb_core.dart';

void main() {
  group('flutter core', () {
    test('ExString', () {
      expect('123456'.dmToMD5(), 'e10adc3949ba59abbe56e057f20f883e');
      expect('123456'.dmIsPhone(), false);
      expect('17688454587'.dmIsPhone(), true);
      expect('11688454587'.dmIsPhone(), false);
      expect('#ff0000'.dmToColor(), const Color(0xffff0000));
      expect('17688454587'.dmReplaceString(), '176****4587');
      expect('17688'.dmReplaceString(), '17688');
      expect('17688'.dmReplaceString(end: 5), '176****');
      expect('17688'.dmReplaceString(start: 6, end: 5), '17688');
      expect('17688'.dmReplaceString(start: 1, end: 2, replacement: '#'), '1#688');
      expect('123456'.dmReverse(), '654321');
      expect('12345'.dmReverse(), '54321');
      expect('12'.dmReverse(), '21');
      expect('1'.dmReverse(), '1');
      expect('13777777777'.dmIsPhone(), true);
      expect('1377777777'.dmIsPhone(), false);
      expect('1377777777'.dmIsUrl(), false);
      expect('http://www.hao123.com'.dmIsUrl(), true);
      expect('https://www.hao123.com'.dmIsUrl(), true);
      expect('https:www.hao123.com'.dmIsUrl(), false);
      expect('https://hao123.com'.dmIsUrl(), false);

      expect('https://hao123.com'.dmIsBlank, false);
      expect('1 1'.dmIsBlank, false);
      expect(' '.dmIsBlank, true);
      expect('  '.dmIsBlank, true);
      expect('     '.dmIsBlank, true);
    });

    test('ExDate', () {
      expect(DateTime.now().dmIsToday, true);
      expect(DateTime(2200, 1, 1).dmIsToday, false);

      expect(DateTime(2000, 1, 1).dmIsPast, true);
      expect(DateTime(2023, 8, 17).dmIsPast, true);
      expect(DateTime(2200, 1, 1).dmIsPast, false);
      expect(DateTime(2000, 1, 1).dmFormat(pattern: 'yyyy-MM-dd'), '2000-01-01');
      expect(DateTime(2000, 12, 1).dmFormat(pattern: 'yyyy/MM/dd'), '2000/12/01');
      expect(DateTime(2000, 1, 1, 11, 11, 11).dmFormat(pattern: 'HH:mm:ss'), '11:11:11');
      expect(DateTime(2000, 1, 1, 01, 02, 13).dmFormat(pattern: 'mm:ss'), '02:13');
    });

    test('ExColor', () {
      expect(const Color(0xffffffff).dmToHex, '#ffffff');
    });

    test('ExList', () {
      expect([].dmSafeFirst, null);
      expect([].dmSafeLast, null);
      expect([1, 3, 3].dmSafeFirst, 1);
      expect([1, 2].dmSafeLast, 2);
      expect([1, 2].dmSafeFirstWhere((e) => e == 2), 2);
      expect([1, 2].dmSafeFirstWhere((e) => e == 21), null);
    });

    test('JsonMap', () {
      final map = {
        'name': 'tom',
        'age': 12,
      };
      final js = DJsonMap(map);
      expect(js['name'].stringOrEmpty, 'tom');
      expect(js['name1'].stringOrEmpty, '');
      expect(js['name1'].string, null);
      expect(js['age'].intOrZero, 12);
      expect(js['age1'].intOrZero, 0);
      expect(js['age'].intValue, 12);
      expect(js['age'][0]['11'].intValue, null);
    });
  });
}
