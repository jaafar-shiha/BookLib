part of 'book_details_view.dart';

class InfoRow extends StatelessWidget {
  final BookEntity bookEntity;
  const InfoRow({Key? key,required this.bookEntity}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InfoCard(
            label: 'Rating',
            value: '${bookEntity.rating ?? 0}',
          ),
          InfoCard(
            label: 'Pages',
            value: '${bookEntity.pageCount ?? 'Unknown'}',
          ),
          InfoCard(
            label: 'Language',
            value: bookEntity.language?.toUpperCase() ?? 'Unknown',
          ),
        ],
      ),
    );
  }
}
