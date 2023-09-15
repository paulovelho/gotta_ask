import 'package:drift_db_viewer/drift_db_viewer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gotta_ask/database/database.dart';
import 'package:gotta_ask/pages/preferences/language-list.dart';
import 'package:gotta_ask/pages/preferences/package-list.dart';

class PreferencesPage extends StatelessWidget {
  PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("preferencesTitle").tr()),
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
  openDbDebug(BuildContext context) async {
    DatabaseInstance db = Database.instance.getDb();
    Widget debugger = DriftDbViewer(db);
    await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => debugger,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const LanguageFlipper(),
        const SizedBox(height: 20),
        const PackageList(),
        const SizedBox(height: 50),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            elevation: 3,
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
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
