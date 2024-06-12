import 'package:flutter/material.dart';
import 'package:reflective_visual/reflective_visual.dart';

class ReflectiveVisualExample extends StatefulWidget {
  const ReflectiveVisualExample({super.key});

  @override
  State<ReflectiveVisualExample> createState() =>
      _ReflectiveVisualExampleState();
}

class _ReflectiveVisualExampleState extends State<ReflectiveVisualExample> {
  bool loading = true;

  @override
  void initState() {
    _toggleLoading(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ReflectivePage(
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _header(context),
              const SizedBox(height: 32),
              _avatars(context),
              const SizedBox(height: 30),
              _list(context),
            ],
          ),
        ),
      );

  Widget _header(BuildContext context) => const Padding(
        padding: EdgeInsets.all(28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hey Mubashir!',
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.w900),
            ),
            SizedBox(height: 4),
            Text(
              'Let\'s get start!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      );

  Widget _avatars(BuildContext context) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            _singleAvatar(context),
            _singleAvatar(context),
            _singleAvatar(context),
            _singleAvatar(context),
            _singleAvatar(context),
            _singleAvatar(context),
            _singleAvatar(context),
            _singleAvatar(context),
            _singleAvatar(context),
          ],
        ),
      );

  Widget _singleAvatar(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(3),
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(),
            ),
          ),
          const SizedBox(height: 4),
          const Text('name')
        ],
      );

  Widget _list(BuildContext context) => Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
                _singleListItem(context),
              ],
            ),
          ),
        ),
      );

  Widget _singleListItem(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              // padding: const EdgeInsets.all(3),
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(),
              ),
            ),
            const SizedBox(width: 5),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // loading
                //     ? RContainer(width: Random().nextDouble() * 100 + 40 , height: 12, radius: 2)
                // :
                Text(
                  'Mubashir Nawaz',
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 2),
                // loading
                //       ? RContainer(width: Random().nextDouble() * 60 + 20 , height: 10, radius: 2)   :
                Text(
                  'Flutter Developer',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      );

  void _toggleLoading(BuildContext context) async {
    await Future.delayed(const Duration(seconds: 14));
    setState(() => loading = false);
  }
}
