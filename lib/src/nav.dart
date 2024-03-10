import 'package:car_maintanance/core/utils/responsive_screens.dart';
import 'package:flutter/material.dart';

class NavBar extends StatelessWidget {
  final int pageIndex;
  final Function(int) onTap;
  final PageController pageController; // Add pageController parameter

  const NavBar({
    Key? key,
    required this.pageIndex,
    required this.onTap,
    required this.pageController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20),
      child: BottomAppBar(
        elevation: 0.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Container(
            height: ResSize.navH(context),
            color: Colors.orange,
            child: Row(
              children: [
                navItem(
                  Icons.home_outlined,
                  pageIndex == 0,
                  onTap: () => onTap(0),
                ),
                navItem(
                  Icons.message_outlined,
                  pageIndex == 1,
                  onTap: () => onTap(1),
                ),
                SizedBox(
                  width: ResSize.width20(context),
                ),
                navItem(
                  Icons.notifications_none_outlined,
                  pageIndex == 2,
                  onTap: () => onTap(2),
                ),
                navItem(
                  Icons.person_outline,
                  pageIndex == 3,
                  onTap: () => onTap(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget navItem(IconData icon, bool selected, {Function()? onTap}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Icon(
          icon,
          color: selected
              ? Colors.white
              : const Color.fromARGB(255, 32, 32, 32).withOpacity(0.8),
        ),
      ),
    );
  }
}
