import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:gotta_ask/database/bootstrap.dart';
import 'package:gotta_ask/deck_manager.dart';
import 'package:gotta_ask/features/packages/control.dart';
import 'package:gotta_ask/features/packages/crawler.dart';
import 'package:gotta_ask/features/packages/model.dart';
import 'package:gotta_ask/pages/shared/box_title.dart';
import 'package:gotta_ask/state.dart';
import 'package:gotta_ask/theme/form_decoration.dart';
import 'package:gotta_ask/theme/theme.dart';
import 'package:provider/provider.dart';

class PackageList extends StatefulWidget {
  const PackageList({Key? key}) : super(key: key);
  @override
  State<PackageList> createState() => _PackageList();
}

class _PackageList extends State<PackageList> {
  late AppState state;

  Future<List<Package>> getPackages(AppState state) async {
    String language = await state.getSavedLanguage();
    return PackageControl().getPackagesList(language);
  }

  Widget getCheckbox(Package p) {
    bool _active = p.active;
    return CheckboxListTile(
      value: _active,
      onChanged: (bool? value) {
        PackageControl().togglePackage(p);
        DeckManager.instance.clearPackageList();
        DeckManager.instance.updateDeck();
        setState(() {
          _active = !_active;
        });
      },
      title: Text(p.title),
    );
  }

  Widget getPackageList(context, packagesData) {
    List<Package> packages = packagesData ?? [];
    List<Widget> w = packages.map((p) => getCheckbox(p)).toList();
    return Material(
      child: Container(
        decoration: FormTheme.formBoxDecoration(context),
        child: Column(
          children: w,
        ),
      ),
    );
  }

  void installLanguage() {
    String lang = state.activeLanguage;
    debugPrint("asking to install $lang");
    Bootstrap().install(language: lang);
    state.reload();
    setState(() {});
  }

  Widget noPackageView() {
    return Container(
      decoration: BoxDecoration(
          color: AppTheme.getScheme(context).shadow,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 30),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            const Text("No packages installed for the selected language"),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: installLanguage,
              style: AppTheme.btnStyle(),
              icon: const Icon(Icons.system_update, size: 20),
              label: Text("installLanguage".tr()),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    state = context.watch<AppState>();
    return FutureBuilder<List<Package>>(
      future: getPackages(state),
      builder: (context, snapshot) {
        Widget w;
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            w = noPackageView();
          } else {
            w = getPackageList(context, snapshot.data);
          }
        } else {
          w = const Text("Error retrieving packages");
        }
        return Column(
          children: [
            BoxTitle(context.tr("packages")),
            const SizedBox(height: 10),
            w,
          ],
        );
      },
    );
  }
}
