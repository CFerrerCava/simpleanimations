import 'package:flutter/material.dart';
import 'package:simpleanimations/ui/widgets/home_body.dart';
import 'package:simpleanimations/ui/widgets/list_animations_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: TabBarView(
          controller: _tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: [
            HomeBody(
              onNext: _toListAnimations,
            ),
            ListAnimationsTab(
              onBefore: _backToHome,
            ),
          ],
        ),
      ),
    );
  }

  _toListAnimations() {
    _tabController.animateTo(1, duration: const Duration(milliseconds: 250));
  }

  _backToHome() {
    _tabController.animateTo(0);
  }
}
