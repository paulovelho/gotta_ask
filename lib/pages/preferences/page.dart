import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gotta_ask/database/database.dart';
import 'package:gotta_ask/pages/about/page.dart';
import 'package:gotta_ask/pages/preferences/language_list.dart';
import 'package:gotta_ask/pages/preferences/package_list.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("preferencesTitle").tr(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: PreferencesBody(),
      ),
    );
  }
}

class PreferencesBody extends StatefulWidget {
  const PreferencesBody({Key? key}) : super(key: key);

  @override
  State<PreferencesBody> createState() => _PreferencesBody();
}

class _PreferencesBody extends State<PreferencesBody> {
  navigate(BuildContext context, Widget page) async {
    return await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => page,
      ),
    );
  }

  openDbDebug(BuildContext context) async {
    DatabaseInstance db = Database.instance.getDb();
    return navigate(context, DriftDbViewer(db));
  }

  openAbout(BuildContext context) async {
    return navigate(context, AboutPage());
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 20),
        const LanguageFlipper(),
        const SizedBox(height: 20),
        const PackageList(),
        const SizedBox(height: 100),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
          ),
          onPressed: () => openAbout(context),
          icon: const Icon(Icons.emoji_objects),
          label: const Text('about').tr(),
        ),
        const SizedBox(height: 50),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            padding: const EdgeInsets.all(10.0),
          ),
          icon: const Icon(
            Icons.bug_report,
            size: 20,
          ),
          onPressed: () => openDbDebug(context),
          label: const Text('viewDb').tr(),
        ),
      ],
    );
  }
}
