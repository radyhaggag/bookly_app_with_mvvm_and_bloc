import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/models/book_model.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_text_button.dart';
import '../../data/models/book_model/sale_info.dart';

class BookDetailsActions extends StatelessWidget {
  const BookDetailsActions({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
            child: CustomTextButton(
              onPressed: _priceOnClick,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              backgroundColor: AppColors.whiteColor,
              text: _getPrice(book.saleInfo!),
              textColor: AppColors.blackColor,
              fontSize: 20,
            ),
          ),
          Expanded(
            child: CustomTextButton(
              onPressed: _previewOnClick,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              backgroundColor: AppColors.orangeColor,
              text: 'Free preview',
              textColor: AppColors.whiteColor,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  _previewOnClick() async {
    if (book.accessInfo?.webReaderLink != null) {
      await launchUrl(Uri.parse(book.accessInfo!.webReaderLink!));
    } else {
      Fluttertoast.showToast(
        msg: 'Book preview not allowed',
        backgroundColor: AppColors.orangeColor,
      );
    }
  }

  _priceOnClick() async {
    if (book.saleInfo?.saleability == 'FOR_SALE') {
      await launchUrl(Uri.parse(book.saleInfo!.buyLink!));
    } else if (book.saleInfo?.saleability == 'FREE' &&
        book.accessInfo?.pdf?.acsTokenLink != null) {
      await launchUrl(
        Uri.parse(book.accessInfo!.pdf!.acsTokenLink!),
      );
    } else {
      Fluttertoast.showToast(
        msg: 'Book download not available!',
        backgroundColor: AppColors.whiteColor,
        textColor: AppColors.blackColor,
      );
    }
  }

  String _getPrice(SaleInfo saleInfo) {
    if (saleInfo.saleability == 'FOR_SALE') {
      return '${saleInfo.listPrice!.amount} £';
    } else if (saleInfo.saleability == 'FREE') {
      return saleInfo.saleability!;
    } else if (saleInfo.saleability == 'NOT_FOR_SALE') {
      return 'Not for sale';
    } else {
      return saleInfo.saleability.toString();
    }
  }
}
