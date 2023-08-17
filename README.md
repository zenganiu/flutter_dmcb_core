# flutter_dmcb_core
Flutter基础库

## 特性

* 常用常量封装/类型扩展
* 基础组件
* 常用工具

## 安装
在 `pubspec.yaml` 中添加
```yml
dependencies:
  flutter_dmcb_core:
    git: https://github.com/zenganiu/flutter_dmcb_core.git
```

## 使用

* 常用常量
```dart

// 导入
import 'package:flutter_dmcb_core/flutter_dmcb_core.dart'; 

DUtils.width // 屏幕宽度
DUtils.height // 屏幕高度
DUtils.pixelRatio // 像素密度
DUtils.statusBarHeight // 顶部状态栏高度
DUtils.bottomBarHeight // 底部安全区域高度
DUtils.isDebug // 是否是调试模式
DUtils.isProfile // 是否是性能模式
DUtils.isRelease // 是否是正式模式
DUtils.isIOS // 是否iOS平台
DUtils.isAndroid // 是否Android平台
DUtils.isMacOS // 是否MacOS平台
DUtils.isWindows // 是否Windows平台
DUtils.isPlatformDarkMode // 是否暗黑模式

```

* 扩展(Extension)
