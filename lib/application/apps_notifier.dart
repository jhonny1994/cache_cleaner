import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';

class AppsNotifier extends StateNotifier<AsyncValue<List<AppInfo>>> {
  AppsNotifier() : super(const AsyncValue.loading()) {
    loadApps();
  }

  Future<void> loadApps() async {
    state = const AsyncValue.loading();
    final apps = await InstalledApps.getInstalledApps(
      true,
      true,
    );
    state = AsyncValue.data(apps);
  }
}
