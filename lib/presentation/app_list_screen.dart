import 'package:cache_cleaner/providers/apps_notifier_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:installed_apps/installed_apps.dart';

class AppListScreen extends ConsumerWidget {
  const AppListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final apps = ref.watch(appsNotifierProvider);
    return Scaffold(
      body: Center(
        child: apps.when(
          data: (apps) => ListView.builder(
            itemCount: apps.length,
            itemBuilder: (context, index) {
              final app = apps.elementAt(index);

              return ListTile(
                title: Text(app.name),
                subtitle: Text(app.packageName),
                leading: app.icon == null ? null : Image.memory(app.icon!),
                onTap: () => InstalledApps.openSettings(app.packageName),
              );
            },
          ),
          error: (error, stackTrace) => Text(error.toString()),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
