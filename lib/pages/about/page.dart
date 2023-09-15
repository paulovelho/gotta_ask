import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: AboutPageBody(),
    );
  }
}

class AboutPageBody extends StatelessWidget {
  AboutPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [],
    );
  }
}
