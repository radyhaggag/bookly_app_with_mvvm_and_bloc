import 'package:hive/hive.dart';

import '../../features/home/data/models/book_model/access_info.dart';
import '../../features/home/data/models/book_model/image_links.dart';
import '../../features/home/data/models/book_model/list_price.dart';
import '../../features/home/data/models/book_model/pdf.dart';
import '../../features/home/data/models/book_model/sale_info.dart';
import '../../features/home/data/models/book_model/volume_info.dart';
import '../models/book_model.dart';

void initHive() {
  Hive.registerAdapter(AccessInfoAdapter());
  Hive.registerAdapter(ImageLinksAdapter());
  Hive.registerAdapter(ListPriceAdapter());
  Hive.registerAdapter(PdfAdapter());
  Hive.registerAdapter(SaleInfoAdapter());
  Hive.registerAdapter(VolumeInfoAdapter());
  Hive.registerAdapter(BookModelAdapter());

  Hive.openBox<BookModel>(HiveBoxes.featuredBooks);
  Hive.openBox<BookModel>(HiveBoxes.newestBooks);
}

abstract class HiveBoxes {
  static const featuredBooks = 'featuredBooks';
  static const newestBooks = 'newestBooks';
}
