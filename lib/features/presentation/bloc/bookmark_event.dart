part of 'bloc.dart';


abstract class BookmarkEvent extends Equatable{
  const BookmarkEvent();
  @override
  List<Object> get props => [];
}

class Onpressed_Bookmark extends BookmarkEvent{
  final String itemID;

  const Onpressed_Bookmark(this.itemID);

  @override
  List<Object> get props => [itemID];
}