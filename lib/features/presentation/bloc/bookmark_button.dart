import 'package:flutter/material.dart';
import 'bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BookmarkButton extends StatelessWidget {
  final String itemId;
  final IconData unselected_bookmark = Icons.bookmark_outline_outlined;
  final IconData active_bookmark = Icons.bookmark;


  const BookmarkButton({super.key, required this.itemId});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookmarkBloc, BookmarkState>(
      builder: (context, state) {
        final isBookmarked = state is BookmarkSuccessState &&
            state.bookmarkItems.contains(itemId);

        return IconButton(
          icon: Icon(
            isBookmarked ? active_bookmark : unselected_bookmark,
            color: isBookmarked ? Colors.blue : null,
          ),
          onPressed: () {
            context.read<BookmarkBloc>().add(Onpressed_Bookmark(itemId));
          },
        );
      },
    );
  }
}