import 'dart:async';
import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data' as typed_data;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:flutter_packages_implementation/Flutter%20Image%20Compress/resources.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'time_logger.dart';

class FlutterImageCompressExample extends StatefulWidget {
  const FlutterImageCompressExample({Key? key}) : super(key: key);

  @override
  State<FlutterImageCompressExample> createState() =>
      _FlutterImageCompressExampleState();
}

class _FlutterImageCompressExampleState
    extends State<FlutterImageCompressExample> {
  ImageProvider? provider;

  Future<void> compress(AssetImage image) async {
    // const img = AssetImage('img/img.jpg');
    if (kDebugMode) {
      print('pre compress');
    }
    const config = ImageConfiguration();
    final AssetBundleImageKey key = await image.obtainKey(config);
    final ByteData data = await key.bundle.load(key.name);
    final beforeCompress = data.lengthInBytes;
    if (kDebugMode) {
      print('beforeCompress = $beforeCompress');
    }
    final result = await FlutterImageCompress.compressWithList(
      data.buffer.asUint8List(),
    );
    if (kDebugMode) {
      print('after = ${result.length}');
    }
  }

  Future<Directory> getTemporaryDirectory() async {
    return Directory.systemTemp;
  }

  void _testCompressFile() async {
    const img = AssetImage('img/img.jpg');
    if (kDebugMode) {
      print('pre compress');
    }
    const config = ImageConfiguration();
    final AssetBundleImageKey key = await img.obtainKey(config);
    final ByteData data = await key.bundle.load(key.name);
    final dir = await path_provider.getTemporaryDirectory();
    final File file = createFile('${dir.absolute.path}/test.png');
    file.writeAsBytesSync(data.buffer.asUint8List());

    final result = await testCompressFile(file);
    if (result == null) return;

    safeSetState(() {
      provider = MemoryImage(result);
    });
  }

  File createFile(String path) {
    final file = File(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    return file;
  }

  Future<String> getExampleFilePath() async {
    const img = AssetImage('img/img.jpg');
    if (kDebugMode) {
      print('pre compress');
    }
    const config = ImageConfiguration();
    final AssetBundleImageKey key = await img.obtainKey(config);
    final ByteData data = await key.bundle.load(key.name);
    final dir = await path_provider.getTemporaryDirectory();
    final File file = createFile('${dir.absolute.path}/test.png');
    file.createSync(recursive: true);
    file.writeAsBytesSync(data.buffer.asUint8List());
    return file.absolute.path;
  }

  void getFileImage() async {
    const img = AssetImage('img/img.jpg');
    debugPrint('pre compress');
    const config = ImageConfiguration();
    final AssetBundleImageKey key = await img.obtainKey(config);
    final ByteData data = await key.bundle.load(key.name);
    final dir = await path_provider.getTemporaryDirectory();
    final File file = createFile('${dir.absolute.path}/test.png');
    file.writeAsBytesSync(data.buffer.asUint8List());
    final targetPath = '${dir.absolute.path}/temp.jpg';
    final imgFile = await testCompressAndGetFile(file, targetPath);
    if (imgFile == null) {
      return;
    }
    safeSetState(() {
      provider = FileImage(imgFile);
    });
  }

  Future<typed_data.Uint8List?> testCompressFile(File file) async {
    if (kDebugMode) {
      print('testCompressFile');
    }
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      rotate: 180,
    );
    if (kDebugMode) {
      print(file.lengthSync());
      print(result?.length);
    }
    return result;
  }

  Future<File?> testCompressAndGetFile(File file, String targetPath) async {
    if (kDebugMode) {
      print('testCompressAndGetFile');
    }
    final result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 90,
      minWidth: 1024,
      minHeight: 1024,
      rotate: 90,
    );
    if (kDebugMode) {
      print(file.lengthSync());
    }
    return File(result!.path);
  }

  Future testCompressAsset(String assetName) async {
    if (kDebugMode) {
      print('testCompressAsset');
    }
    final list = await FlutterImageCompress.compressAssetImage(
      assetName,
      minHeight: 1920,
      minWidth: 1080,
      quality: 96,
      rotate: 135,
    );
    if (list == null) return;
    safeSetState(() {
      provider = MemoryImage(typed_data.Uint8List.fromList(list));
    });
  }

  Future compressListExample() async {
    final data = await rootBundle.load('img/img.jpg');
    final memory = await testComporessList(data.buffer.asUint8List());
    safeSetState(() {
      provider = MemoryImage(memory);
    });
  }

  Future<typed_data.Uint8List> testComporessList(
      typed_data.Uint8List list) async {
    final result = await FlutterImageCompress.compressWithList(
      list,
      minHeight: 1080,
      minWidth: 1080,
      quality: 96,
      rotate: 270,
      format: CompressFormat.webp,
    );
    if (kDebugMode) {
      print(list.length);
      print(result.length);
    }
    return result;
  }

  Future<void> writeToFile(List<int> list, String filePath) {
    return File(filePath).writeAsBytes(list, flush: true);
  }

  void _compressAssetAndAutoRotate() async {
    final result = await FlutterImageCompress.compressAssetImage(
      R.IMG_AUTO_ANGLE_JPG,
      minWidth: 1000,
      quality: 95,
      // autoCorrectionAngle: false,
    );
    if (result == null) return;
    safeSetState(() {
      provider = MemoryImage(typed_data.Uint8List.fromList(result));
    });
  }

  void _compressPngImage() async {
    final result = await FlutterImageCompress.compressAssetImage(
      R.IMG_HEADER_PNG,
      minWidth: 300,
      minHeight: 500,
    );
    if (result == null) return;
    safeSetState(() {
      provider = MemoryImage(typed_data.Uint8List.fromList(result));
    });
  }

  void _compressTransPNG() async {
    final bytes = await getAssetImageUint8List(
      R.IMG_TRANSPARENT_BACKGROUND_PNG,
    );
    final result = await FlutterImageCompress.compressWithList(
      bytes,
      minHeight: 100,
      minWidth: 100,
      format: CompressFormat.png,
    );
    final u8list = typed_data.Uint8List.fromList(result);
    safeSetState(() {
      provider = MemoryImage(u8list);
    });
  }

  void _restoreTransPNG() async {
    setState(() {
      provider = const AssetImage(R.IMG_TRANSPARENT_BACKGROUND_PNG);
    });
  }

  void _compressImageAndKeepExif() async {
    final result = await FlutterImageCompress.compressAssetImage(
      R.IMG_AUTO_ANGLE_JPG,
      minWidth: 500,
      minHeight: 600,
      // autoCorrectionAngle: false,
      keepExif: true,
    );
    if (result == null) return;
    safeSetState(() {
      provider = MemoryImage(typed_data.Uint8List.fromList(result));
    });
  }

  void _compressHeicExample() async {
    if (kDebugMode) {
      print('start compress');
    }
    final logger = TimeLogger();
    logger.startRecorder();
    final tmpDir = (await getTemporaryDirectory()).path;
    final target = '$tmpDir/${DateTime.now().millisecondsSinceEpoch}.heic';
    final srcPath = await getExampleFilePath();
    final result = await FlutterImageCompress.compressAndGetFile(
      srcPath,
      target,
      format: CompressFormat.heic,
      quality: 90,
    );
    if (result == null) return;
    if (kDebugMode) {
      print('Compress heic success.');
      print('src, path = $srcPath length = ${File(srcPath).lengthSync()}');
      print(
        'Compress heic result path: ${result.path}, '
        'size: ${result.length()}',
      );
    }
    logger.logTime();
  }

  void _compressAndroidWebpExample() async {
    // Android compress very nice, but the iOS encode UIImage to webp is slow.
    final logger = TimeLogger();
    logger.startRecorder();
    if (kDebugMode) {
      print('start compress webp');
    }
    const quality = 90;
    final tmpDir = (await getTemporaryDirectory()).path;
    final target =
        '$tmpDir/${DateTime.now().millisecondsSinceEpoch}-$quality.webp';
    final srcPath = await getExampleFilePath();
    final result = await FlutterImageCompress.compressAndGetFile(
      srcPath,
      target,
      format: CompressFormat.webp,
      minHeight: 800,
      minWidth: 800,
      quality: quality,
    );
    if (result == null) return;
    logger.logTime();
    if (kDebugMode) {
      print('Compress webp success.');
      print('src, path = $srcPath length = ${File(srcPath).lengthSync()}');
      print(
        'Compress webp result path: ${result.path}, '
        'size: ${result.length()}',
      );
    }
    safeSetState(() {
      provider = FileImage(File(result.path));
    });
  }

  void _compressFromWebPImage() async {
    // Converting webp to jpeg
    final result = await FlutterImageCompress.compressAssetImage(
      R.IMG_ICON_WEBP,
    );
    if (result == null) return;
    // Show result image
    safeSetState(() {
      provider = MemoryImage(typed_data.Uint8List.fromList(result));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Plugin example app')),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: AspectRatio(
                aspectRatio: 1 / 1,
                child: DecoratedBox(
                  decoration: BoxDecoration(border: Border.all(width: 2)),
                  child: Image(
                    image: provider ?? const AssetImage('img/img.jpg'),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: _testCompressFile,
                child: const Text('CompressFile and rotate 180'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: getFileImage,
                child: const Text('CompressAndGetFile and rotate 90'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                child: const Text('CompressAsset and rotate 135'),
                onPressed: () => testCompressAsset('img/img.jpg'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: compressListExample,
                child: const Text('CompressList and rotate 270'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: _compressAssetAndAutoRotate,
                child: const Text('test compress auto angle'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: _compressPngImage,
                child: const Text('Test png '),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: _compressTransPNG,
                child: const Text('Format transparent PNG'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: _restoreTransPNG,
                child: const Text('Restore transparent PNG'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: _compressImageAndKeepExif,
                child: const Text('Keep exif image'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: _compressHeicExample,
                child:
                    const Text('Convert to heic format and print the file url'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: _compressAndroidWebpExample,
                child:
                    const Text('Convert to webp format, Just support android'),
              ),
            ),
            SliverToBoxAdapter(
              child: TextButton(
                onPressed: _compressFromWebPImage,
                child: const Text('Convert from webp format'),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => provider = null),
          tooltip: 'Show default asset',
          child: const Icon(Icons.settings_backup_restore),
        ),
      ),
    );
  }
}

Future<typed_data.Uint8List> getAssetImageUint8List(String key) async {
  final byteData = await rootBundle.load(key);
  return byteData.buffer.asUint8List();
}

double calcScale({
  required double srcWidth,
  required double srcHeight,
  required double minWidth,
  required double minHeight,
}) {
  final scaleW = srcWidth / minWidth;
  final scaleH = srcHeight / minHeight;

  final scale = math.max(1.0, math.min(scaleW, scaleH));

  return scale;
}

extension _StateExtension on State {
  /// [setState] when it's not building, then wait until next frame built.
  FutureOr<void> safeSetState(FutureOr<dynamic> Function() fn) async {
    await fn();
    if (mounted &&
        !context.debugDoingBuild &&
        context.owner?.debugBuilding == false) {
      // ignore: invalid_use_of_protected_member
      setState(() {});
    }
    final Completer<void> completer = Completer<void>();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      completer.complete();
    });
    return completer.future;
  }
}
