import 'package:booklib/core/utils/app_text_style.dart';
import 'package:booklib/core/utils/assets_data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../domain/entities/book_entity.dart';

class NewestBookCard extends StatelessWidget {
  final BookEntity bookEntity;

  const NewestBookCard({
    Key? key,
    required this.bookEntity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: (){
          GoRouter.of(context).push(AppRoutes.bookDetailsView,extra: bookEntity);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: bookEntity.thumbnailUrl != null ? FadeInImage(
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
                height: 130,
                width: 100,
              ) : Image.asset(
                AssetsData.logo,
                height: 130,
                width: 100,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookEntity.title,
                    style: AppTextStyle.latoSmallBoldBlack,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Text(
                      'By ${bookEntity.publisher}',
                      style: AppTextStyle.latoXSmallBoldGrey,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
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
