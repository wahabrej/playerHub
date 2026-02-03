import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/features/report/reportProvider.dart';

class ReportScreen extends ConsumerWidget {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tab = ref.watch(reportTabProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Reports')),
      body: Column(
        children: [
          //  TOP TABS
          Row(
            children: [
              _tab(ref, tab, ReportTab.all, 'All'),
              _tab(ref, tab, ReportTab.previous, 'Previous'),
              _tab(ref, tab, ReportTab.current, 'Current'),
              _tab(ref, tab, ReportTab.future, 'Future'),
            ],
          ),

          const Divider(),

          //  CONTENT
          Expanded(
            child: Center(
              child: Text(
                tab.name.toUpperCase(),
                style: const TextStyle(fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _tab(
      WidgetRef ref,
      ReportTab selected,
      ReportTab value,
      String text,
      ) {
    final active = selected == value;

    return Expanded(
      child: InkWell(
        onTap: () {
          ref.read(reportTabProvider.notifier).state = value;
        },
        child: Container(
          height: 45,
          alignment: Alignment.center,
          color: active ? Colors.blue : Colors.grey[300],
          child: Text(
            text,
            style: TextStyle(
              color: active ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
