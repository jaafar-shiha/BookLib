import 'package:booklib/core/utils/app_text_style.dart';
import 'package:flutter/material.dart';

import 'widgets/featured_books.dart';
import 'widgets/newest_books.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Discover Our books library',
                    style: AppTextStyle.latoLargeBoldBlack,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    'Featured e-books',
                    style: AppTextStyle.latoRegularBoldBlack,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    child: FeaturedBooks(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      'Newest e-books',
                      style: AppTextStyle.latoRegularBoldBlack,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.0),
                      child: NewestBooks(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
