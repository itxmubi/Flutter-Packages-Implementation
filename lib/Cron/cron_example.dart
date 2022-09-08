import 'package:flutter/material.dart';

class CronExample extends StatefulWidget {
  const CronExample({super.key});

  @override
  State<CronExample> createState() => _CronExampleState();
}

class _CronExampleState extends State<CronExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cron Example")),
      body: Column(children: const []),
    );
  }
}
