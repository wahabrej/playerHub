import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

/// Top tabs type
enum ReportTab {
  all,
  previous,
  current,
  future,
}

/// Selected tab provider
final reportTabProvider =
StateProvider<ReportTab>((ref) => ReportTab.all);
