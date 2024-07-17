import 'package:cache_cleaner/application/apps_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:installed_apps/app_info.dart';

final appsNotifierProvider =
    StateNotifierProvider<AppsNotifier, AsyncValue<List<AppInfo>>>((ref) {
  return AppsNotifier();
});
