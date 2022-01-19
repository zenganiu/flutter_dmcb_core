part of dmcb_core;

class DmcbLogUtil {
  /// 拿到当前文件名字 和 行号
  static String getFileInfo() {
    String fileStr = "";
    try {
      String traceString = StackTrace.current.toString().split("\n")[4];

      int indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z_1-9]+.dart'));

      String fileInfo = traceString.substring(indexOfFileName);
      String fileName = "";
      String lineNumber = "";
      // 先考虑 android ios 以及 web
      if (traceString.contains("#")) {
        // 代表 android 或者 ios
        List<String> listOfInfos = fileInfo.split(":");
        fileName = listOfInfos[0];
        lineNumber = listOfInfos[1];
      } else {
        // web
        traceString = StackTrace.current.toString().split("\n")[5];
        int indexOfFileName =
            traceString.indexOf(RegExp(r'[A-Za-z_1-9]+.dart'));
        String fileInfo = traceString.substring(indexOfFileName);
        fileName = fileInfo.split(" ")[0];
        lineNumber = fileInfo.split(" ")[1].split(":")[0];
      }

      fileStr = "[$fileName, $lineNumber]";
    } catch (e) {
      // NoThing
    }

    return fileStr;
  }

  static String getNavigationFile() {
    String fileStr = "";
    try {
      String traceString = StackTrace.current.toString().split("\n")[4];
      int indexOfFileName =
          traceString.indexOf(RegExp(r'[A-Za-z_1-9/:1-9]+.dart'));
      if (traceString.contains("#")) {
        fileStr = traceString.substring(indexOfFileName);
      } else {
        // web
        traceString = StackTrace.current.toString().split("\n")[5];
        int indexOfFileName =
            traceString.indexOf(RegExp(r'[A-Za-z_1-9/:1-9]+.dart'));
        fileStr = traceString.substring(indexOfFileName);
        var strList = fileStr.split(" ");
        fileStr =
            "${strList[0]}:${strList[1]})".replaceAll("packages/", "package:");
      }
    } catch (e) {
      // NoThing
    }
    return fileStr;
  }

  static String convertJsonString(Object value) {
    return DUtils.convertJsonString(value);
  }

  static String prettyJson(dynamic js) {
    try {
      var spaces = '🐛';
      var encoder = JsonEncoder.withIndent(spaces);
      return encoder.convert(js);
    } catch (e) {
      return js.toString();
    }
  }

  static void printPrettyJson(dynamic js) {
    debugPrint(prettyJson(js));
  }
}
