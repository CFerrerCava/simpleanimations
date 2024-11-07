import 'package:flutter/material.dart';
import 'package:simpleanimations/di/routes.dart';

class ListAnimationsTab extends StatefulWidget {
  final Function() onBefore;
  const ListAnimationsTab({super.key, required this.onBefore});

  @override
  State<ListAnimationsTab> createState() => _ListAnimationsTabState();
}

class _ListAnimationsTabState extends State<ListAnimationsTab> {
  List<MapEntry<String, Widget Function(BuildContext)>> routeEntries = [];
  @override
  void initState() {
    super.initState();
    _initList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => TextButton.icon(
                      onPressed: () => goToRoute(index),
                      label: Text(
                        getAnimationName(index),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 17),
                      ),
                    ),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 10),
                itemCount: routeEntries.length)),
        ElevatedButton(
            onPressed: widget.onBefore,
            child: const Text(
              'Back',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue),
            ))
      ],
    );
  }

  void goToRoute(int index) {
    Navigator.pushNamed(context, routeEntries[index].key);
  }

  String getAnimationName(int index) {
    return routeEntries[index].key;
  }

  void _initList() {
    routeEntries = SimpleAnimationRoutes.routes.entries.toList();
    routeEntries.removeAt(0);
    setState(() {});
  }
}
