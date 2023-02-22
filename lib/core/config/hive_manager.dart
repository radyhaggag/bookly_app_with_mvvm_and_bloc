import 'package:hive_flutter/adapters.dart';

import '../../features/home/data/models/book_model/access_info.dart';
import '../../features/home/data/models/book_model/image_links.dart';
import '../../features/home/data/models/book_model/list_price.dart';
import '../../features/home/data/models/book_model/pdf.dart';
import '../../features/home/data/models/book_model/sale_info.dart';
import '../../features/home/data/models/book_model/volume_info.dart';
import '../models/book_model.dart';

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(AccessInfoAdapter());
  Hive.registerAdapter(ImageLinksAdapter());
  Hive.registerAdapter(ListPriceAdapter());
  Hive.registerAdapter(PdfAdapter());
  Hive.registerAdapter(SaleInfoAdapter());
  Hive.registerAdapter(VolumeInfoAdapter());
  Hive.registerAdapter(BookModelAdapter());

  await Hive.openBox<BookModel>(_HiveBoxesName.featuredBooks);
  await Hive.openBox<BookModel>(_HiveBoxesName.newestBooks);
}

abstract class _HiveBoxesName {
  static const featuredBooks = 'featuredBooks';
  static const newestBooks = 'newestBooks';
}

abstract class AppHiveBoxes {
  static final featuredBooks =
      Hive.box<BookModel>(_HiveBoxesName.featuredBooks);
  static final newestBooks = Hive.box<BookModel>(_HiveBoxesName.newestBooks);
}
