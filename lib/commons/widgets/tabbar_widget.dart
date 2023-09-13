import 'package:flutter/material.dart';

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  const StickyTabBarDelegate({required this.tabBar});

  final TabBar tabBar;

  @override
  double get minExtent => tabBar.preferredSize.height;

  @override
  double get maxExtent => tabBar.preferredSize.height;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: tabBar,
    );
  }

  @override
  bool shouldRebuild(StickyTabBarDelegate oldDelegate) {
    return tabBar != oldDelegate.tabBar;
  }
}

class SliverHeaderSection extends StatelessWidget {
  final List<Widget> listWidgetHeader;

  const SliverHeaderSection(this.listWidgetHeader, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        listWidgetHeader,
      ),
    );
  }
}

class SliverTabSection extends StatelessWidget {
  final List<Tab> listTabBar;

  const SliverTabSection(this.listTabBar, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: StickyTabBarDelegate(
        tabBar: TabBar(
          labelColor: Theme.of(context).colorScheme.secondary,
          indicatorColor: Theme.of(context).colorScheme.secondary,
          tabs: listTabBar,
        ),
      ),
    );
  }
}
