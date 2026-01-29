import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/features/home/presentation/pages/home_page.dart';
import 'package:playerhub/features/parent/provider.dart';

import 'BottomNavBar.dart';


class Parentscreen extends ConsumerWidget {
  const Parentscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider).currentIndex;

    final pages = [
      HomePage(),
      HomePage(),
      HomePage(),
      HomePage(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
