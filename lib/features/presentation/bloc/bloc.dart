library bloc;
import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bookmark_state.dart';
part 'bookmark_event.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(BookmarkInitialState()) {
    on<Onpressed_Bookmark>(_onpressedBookmark);
  }
  final List<String> _bookmarkItems = [];

  Future<void> _onpressedBookmark(
      Onpressed_Bookmark event,
      Emitter<BookmarkState> emit) async{
        emit(BookmarkLoadingState());
        try{
          if(_bookmarkItems.contains(event.itemID)){
            _bookmarkItems.remove(event.itemID);
          }else{
            _bookmarkItems.add(event.itemID);
          }
          emit(BookmarkSuccessState(List.from(_bookmarkItems)));
          print(BookmarkSuccessState(List.from(_bookmarkItems)));
        }catch(e){
          emit(BookmarkErrorState(e.toString()));
        }
  }

}