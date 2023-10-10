import 'dart:io';

import 'package:aliyun_oss_flutter/aliyun_oss_flutter.dart';

void main() async {
  // 初始化OSSClient
  OSSClient.init(
    endpoint: 'oss-cn-beijing.aliyuncs.com',
    bucket: 'xx',
    credentials: () async {
      return Credentials(
        accessKeyId: 'xxx',
        accessKeySecret: 'xxx',
      );
    },
  );

  await upload();
}

Future<void> upload() async {
  var file = File('${Directory.current.path}/test/assets/1111.dat');
  var obj = OSSImageObject.fromFile(file: file);
  final object = await OSSClient().putObject(
    object: obj,
    path: 'i', // String?
    onProgress: (p0) {
      print(p0);
    },
  );
  print(object);
}
