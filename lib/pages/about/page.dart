import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:simple_rich_text/simple_rich_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:gotta_ask/pages/shared/box_title.dart';
import 'package:gotta_ask/theme/theme.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("about").tr(),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: AppTheme.getScheme(context).onBackground,
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: AboutPageBody(),
      ),
    );
  }
}

class AboutPageBody extends StatelessWidget {
  const AboutPageBody({super.key});

  Widget aboutContainer(
      BuildContext context, String title, List<Widget> content) {
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
            BoxTitle(title),
            const SizedBox(height: 20),
            ...content,
          ],
        ),
      ),
    );
  }

  Widget versioning(BuildContext context) {
    String version = "versionText".tr(namedArgs: {
      'version': dotenv.get("VERSION", fallback: "-"),
      'update': "2023/Q3",
    });
    return aboutContainer(context, "versionTitle".tr(), [
      Text(
        version,
        style: const TextStyle(height: 2, fontSize: 14),
      ),
    ]);
  }

  Widget companyCredit(BuildContext context) {
    return aboutContainer(
      context,
      "Platypus Technology",
      [
        Column(
          children: [
            InkWell(
              onTap: () {
                String platypusUrl = dotenv.get("PLATYPUS_URL");
                Uri url = Uri.parse(platypusUrl);
                launchUrl(url, mode: LaunchMode.externalApplication);
              },
              child: const Text("platypusweb.com.br"),
            ),
            const SizedBox(height: 10),
            Image.asset('assets/images/platypus.png'),
          ],
        ),
      ],
    );
  }

  Widget development(BuildContext context) {
    return aboutContainer(
      context,
      "development.title".tr(),
      [
        SimpleRichText(
          "development.rich".tr(),
          style: const TextStyle(height: 1.2),
        ),
      ],
    );
  }

  Widget contact(BuildContext context) {
    return aboutContainer(
      context,
      "contact.title".tr(),
      [
        SimpleRichText(
          "contact.rich".tr(),
          style: const TextStyle(height: 1.2),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const SizedBox(height: 20),
        versioning(context),
        const SizedBox(height: 20),
        companyCredit(context),
        const SizedBox(height: 20),
        development(context),
        const SizedBox(height: 20),
        contact(context),
      ],
    );
  }
}
