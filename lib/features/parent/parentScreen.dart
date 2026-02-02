import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/features/home/presentation/pages/home_page.dart';
import 'package:playerhub/features/parent/provider.dart';

import '../Match/presentaion/screen/matchScreen.dart';
import '../Player/presentation/screen/playerScreen.dart';
import 'BottomNavBar.dart';


class Parentscreen extends ConsumerWidget {
  const Parentscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider).currentIndex;

    final pages = [
      HomePage(),
      MatchScreen(),
      Playerscreen(),
      HomePage(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
