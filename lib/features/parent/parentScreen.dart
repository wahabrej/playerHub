import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/features/home/presentation/pages/home_page.dart';
import 'package:playerhub/features/parent/provider.dart';

import '../Match/presentaion/screen/matchScreen.dart';
import '../Player/presentation/screen/playerScreen.dart';
import '../report/reportScreen.dart';
import 'BottomNavBar.dart';


class ParentScreen extends ConsumerWidget {
  const ParentScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(bottomNavProvider).currentIndex;

    final pages = [
      HomePage(),
      MatchScreen(),
      PlayerScreen(),
      ReportScreen(),
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
