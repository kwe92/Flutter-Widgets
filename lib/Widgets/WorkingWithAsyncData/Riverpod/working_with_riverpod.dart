import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widgets/Widgets/WorkingWithAsyncData/Riverpod/base_screen.dart';
import 'package:flutter_widgets/Widgets/WorkingWithAsyncData/Riverpod/fake_data_repository.dart';

class WorkingWithRiverpod extends ConsumerWidget {
  const WorkingWithRiverpod({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dataValue = ref.watch(streamingDataRepositoryStreamProvider);
    return dataValue.when(
        data: (data) => BaseScreen(
              body: Center(
                child: Text(
                  data.toString(),
                  style: const TextStyle(fontSize: 40),
                ),
              ),
            ),
        error: (err, stackTrace) => Text(err.toString()),
        loading: () => const BaseScreen(
            body: Center(child: CircularProgressIndicator.adaptive())));
  }
}
