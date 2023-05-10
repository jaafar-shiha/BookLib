import 'package:booklib/core/utils/app_text_style.dart';
import 'package:booklib/core/utils/assets_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../domain/entities/book_entity.dart';

class FeaturedBookCard extends StatelessWidget {
  final BookEntity bookEntity;

  const FeaturedBookCard({
    Key? key,
    required this.bookEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRoutes.bookDetailsView, extra: bookEntity);
        },
        child: Column(
          children: [
            SizedBox(
              width: 140,
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: (bookEntity.thumbnailUrl != null)
                        ? FadeInImage(
                            placeholder: const AssetImage(AssetsData.logo),
                            placeholderFit: BoxFit.contain,
                            image: CachedNetworkImageProvider(
                              bookEntity.thumbnailUrl!,
                            ),
                            fadeInDuration: const Duration(milliseconds: 500),
                            fit: BoxFit.fill,
                            height: 180,
                            width: 140,
                          )
                        : Image.asset(
                            AssetsData.logo,
                            height: 180,
                            width: 140,
                          ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4),
                    child: Text(
                      bookEntity.title,
                      style: AppTextStyle.latoSmallBoldBlack,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'By ${bookEntity.publisher}',
                        style: AppTextStyle.latoXSmallBoldGrey,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
