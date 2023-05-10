import 'dart:ui';

import 'package:booklib/core/utils/app_text_style.dart';
import 'package:booklib/features/presentation/views/book_details/info_card.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/assets_data.dart';
import '../../../domain/entities/book_entity.dart';

part 'info_row.dart';

class BookDetailsView extends StatelessWidget {
  final BookEntity bookEntity;

  const BookDetailsView({
    Key? key,
    required this.bookEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none,
                alignment: Alignment.bottomCenter,
                children: [
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        bookEntity.thumbnailUrl != null
                            ? CachedNetworkImage(
                                imageUrl: bookEntity.thumbnailUrl!,
                                fit: BoxFit.fill,
                                width: MediaQuery.of(context).size.width,
                              )
                            : Container(
                                color: AppColors.grey,
                              ),
                        Positioned.fill(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                            child: Container(
                              color: Colors.white.withOpacity(0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -70,
                    child: bookEntity.thumbnailUrl != null
                        ? FadeInImage(
                            placeholder: const AssetImage(AssetsData.logo),
                            placeholderFit: BoxFit.fitHeight,
                            image: CachedNetworkImageProvider(
                              bookEntity.thumbnailUrl!,
                            ),
                            imageErrorBuilder: (context, _, __) {
                              return Image.asset(
                                AssetsData.logo,
                                height: 130,
                                width: 100,
                              );
                            },
                            fadeInDuration: const Duration(milliseconds: 500),
                            fit: BoxFit.fill,
                            height: 180,
                            width: 150,
                          )
                        : Image.asset(
                            AssetsData.logo,
                            height: 160,
                            width: 130,
                          ),
                  )
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              Text(
                bookEntity.title,
                style: AppTextStyle.latoRegularBoldBlack,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  'By ${bookEntity.publisher ?? 'Unknown'}',
                  style: AppTextStyle.latoRegularGrey,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InfoRow(bookEntity: bookEntity),
              const SizedBox(
                height: 20,
              ),
              if (bookEntity.authors != null && (bookEntity.authors?.isNotEmpty ?? false))
                Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Authors',
                          style: AppTextStyle.latoRegularBlack,
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Column(
                            children: bookEntity.authors!
                                .map(
                                  (author) => Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                                    child: Row(
                                      children: [
                                        const Icon(
                                          Icons.circle,
                                          size: 8,
                                          color: AppColors.grey,
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        Text(
                                          author,
                                          style: AppTextStyle.latoXRegularGrey,
                                          textAlign: TextAlign.justify,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description',
                        style: AppTextStyle.latoRegularBlack,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Text(
                          bookEntity.description ?? 'Unknown',
                          style: AppTextStyle.latoXRegularGrey,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
