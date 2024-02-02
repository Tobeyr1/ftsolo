import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ftsolo/hooks/utils/use_async_effect.dart';
import 'package:ftsolo/utils/devices_util.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

void useGetStoragePermissions(WidgetRef ref) {
  final isMounted = useIsMounted();

  useAsyncEffect(() async {
    if (!DevicesOS.isMobile) return;
    final androidInfo = await DeviceInfoPlugin().androidInfo;
    final hasNoStoragePerm = androidInfo.version.sdkInt < 33 &&
        !await Permission.storage.isGranted &&
        !await Permission.storage.isLimited;

    final hasNoAudioPerm = androidInfo.version.sdkInt >= 33 &&
        !await Permission.audio.isGranted &&
        !await Permission.audio.isLimited;

    if (hasNoStoragePerm) {
      await Permission.storage.request();
      //TODO file location
      //if (isMounted()) ref.refresh(localTracksProvider);
    }
    if (hasNoAudioPerm) {
      await Permission.audio.request();
      //if (isMounted()) ref.refresh(localTracksProvider);
    }
  }, null, []);
}
