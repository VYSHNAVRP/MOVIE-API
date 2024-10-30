import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled7/Reprocitry/API/Movie/Movie%20Api.dart';

import '../Reprocitry/Model class/movie file.dart';


part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
late MovieModel movieModel;
MovieApi movieApi=MovieApi();
  MovieBloc() : super(MovieInitial()) {
    on<MovieEvent>((event, emit) async {
      emit(Movieloading());
      try{
       movieModel= await movieApi.getMovie();
       emit(Movieloaded());
      }catch(e){
        emit(Movieerror());
      }
      // TODO: implement event handler
    });
  }
}


