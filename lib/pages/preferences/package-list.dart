import 'package:flutter/material.dart';
import 'package:gotta_ask/database/database.dart';
import 'package:gotta_ask/features/packages/control.dart';
import 'package:gotta_ask/features/packages/model.dart';
import 'package:gotta_ask/pages/shared/box-title.dart';
import 'package:gotta_ask/theme.dart';

class PackageList extends StatefulWidget {
  const PackageList({Key? key}) : super(key: key);
  @override
  State<PackageList> createState() => _PackageList();
}

class _PackageList extends State<PackageList> {
  ThemeData theme = platypusTheme();

  Future<List<Package>> getPackages() {
    return Database.instance.getDb().getPackageList();
  }

  Widget getCheckbox(Package p) {
    bool _active = p.active;
    return CheckboxListTile(
      value: _active,
      onChanged: (bool? value) {
        PackageControl().togglePackage(p);
        setState(() {
          _active = !_active;
        });
      },
      title: Text(p.title),
    );
  }

  Widget getPackageList(packagesData) {
    List<Package> packages = packagesData ?? [];
    List<Widget> w = packages.map((p) => getCheckbox(p)).toList();
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: platypusTheme().focusColor,
          boxShadow: [
            BoxShadow(
              color: theme.canvasColor,
              blurRadius: 2.0,
              offset: Offset(2.0, 2.0),
            ),
          ],
        ),
        child: Column(
          children: w,
        ),
      ),
    );
  }

  Widget getEmptyView() {
    return Text("No packages installed");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Package>>(
      future: getPackages(),
      builder: (context, snapshot) {
        Widget w;
        if (snapshot.hasData) {
          w = getPackageList(snapshot.data);
        } else {
          w = getEmptyView();
        }
        return Container(
          child: Column(
            children: [
              const BoxTitle("packages"),
              const SizedBox(height: 10),
              w,
            ],
          ),
        );
      },
    );
  }
}
