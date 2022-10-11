import 'package:flutter_riverpod/flutter_riverpod.dart';

class FakeStreamingDataRepository {
  Stream<int> watchData() async* {
    await Future.delayed(const Duration(seconds: 3));
    yield 1;
    await Future.delayed(const Duration(seconds: 2));
    yield 2;
    await Future.delayed(const Duration(seconds: 2));
    yield 3;
  }
}

final fakeStreamingDataRepositoryProvider =
    Provider<FakeStreamingDataRepository>((ref) {
  return FakeStreamingDataRepository();
});

final streamingDataRepositoryStreamProvider = StreamProvider<int>((ref) {
  final dataRepository = ref.watch(fakeStreamingDataRepositoryProvider);
  return dataRepository.watchData();
});
