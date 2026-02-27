import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_login_yandex/flutter_login_yandex_method_channel.dart';

void main() {
  MethodChannelFlutterLoginYandex platform = MethodChannelFlutterLoginYandex();
  const MethodChannel channel = MethodChannel('flutter_login_yandex');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
          return '42';
        });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.signIn(), '42');
  });
}
