import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../model/pokemon_model/pokemo_model.dart';
import '../../data/network/dio_helper.dart';
import '../../data/network/end_points.dart';

part 'pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  PokemonCubit() : super(PokemonInitial());
  static PokemonCubit get(context)=>BlocProvider.of<PokemonCubit>(context);
  PokemonModel pokemonModel=PokemonModel();
  int currentIndex=0;
  Future<void> getPokemon()async{
    emit(PokemonLoadingState());
    await DioHelper.get(endPoint:EndPoints.pokemonLink).then((value){
      pokemonModel=PokemonModel.fromJson(json.decode(value?.data));
      print(value?.data);
      emit(PokemonSuccessState());
    }).catchError((onError){
      if(onError is DioException){
        print(onError.response?.data);
        emit(PokemonErrorState());
      }
      throw onError;
    });
  }
}
