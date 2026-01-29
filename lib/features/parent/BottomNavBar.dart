import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playerhub/features/parent/provider.dart';

class BottomNavBar extends ConsumerWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bottomNavState = ref.watch(bottomNavProvider);

    return SafeArea(
      left: false,
      right: false,
      top: false,
      bottom: false,
      child: Container(
        height: 100.h,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.r),
            topRight: Radius.circular(50.r),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 20.r,
              offset: const Offset(0, -4),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24.r),
            topRight: Radius.circular(24.r),
          ),
          child: BottomNavigationBar(
            currentIndex: bottomNavState.currentIndex,
            onTap: (index) {
              ref.read(bottomNavProvider.notifier).updateIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            selectedFontSize: 13.sp,
            unselectedFontSize: 13.sp,
            items: [
              _buildBottomNavItem(
                iconPath: 'assets/icons/png/logo.png',
                label: 'Home',
                isActive: bottomNavState.currentIndex == 0,
              ),
              _buildBottomNavItem(
                iconPath: 'assets/icons/png/logo.png',
                label: 'Match',
                isActive: bottomNavState.currentIndex == 1,
              ),
              _buildBottomNavItem(
                iconPath: 'assets/icons/png/logo.png',
                label: 'Player',
                isActive: bottomNavState.currentIndex == 2,
              ),
              _buildBottomNavItem(
                iconPath: 'assets/icons/png/logo.png',
                label: 'Report',
                isActive: bottomNavState.currentIndex == 3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavItem({
    required String iconPath,
    required String label,
    required bool isActive,
  }) {
    final color = isActive ? Colors.yellow : Colors.black54;

    return BottomNavigationBarItem(
      icon: Image.asset(
        iconPath,
        width: 25.w,
        height: 25.h,
        color: color, // Active or inactive color
      ),
      activeIcon: Image.asset(
        iconPath,
        width: 25.w,
        height: 25.h,
        color: color,
      ),
      label: label,
    );
  }
}
