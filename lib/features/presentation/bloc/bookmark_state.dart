part of 'bloc.dart';


abstract class BookmarkState extends Equatable{
  const BookmarkState();

  @override
  List<Object> get props => [];
}
class BookmarkInitialState extends BookmarkState{}
class BookmarkLoadingState extends BookmarkState{}
class BookmarkSuccessState extends BookmarkState{
  final List<String> bookmarkItems;

  const BookmarkSuccessState(this.bookmarkItems);

  @override
  List<Object> get props => [bookmarkItems];
}

class BookmarkErrorState extends BookmarkState{
  final String error;

  const BookmarkErrorState(this.error);

  @override
  List<Object> get props => [error];
}
