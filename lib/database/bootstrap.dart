import 'package:gotta_ask/features/packages/crawler.dart';

class Bootstrap {
  Future<void> load() async {
    return;
  }

  Future<void> install() async {
    await PackageCrawler().installLanguage("pt");
  }
}
