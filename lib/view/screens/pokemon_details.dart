import 'package:flutter/material.dart';
import 'package:pokemon/view_model/bloc/pokemon/pokemon_cubit.dart';
import '../../view_model/utilis/colors.dart';
import '../widgets/text_custom.dart';
class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(backgroundColor: Colors.blue,
        title: const TextCustom(text: "Pokemon Details",color:AppColors.background,fontWeight: FontWeight.bold,),
      ),
    body: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Container(padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white
            ),
            child: Column(
              children: [
                 Center(
                  child: Hero(tag:PokemonCubit.get(context).currentIndex.toString(),child: Image.network('${PokemonCubit.get(context).pokemonModel.pokemon?[PokemonCubit.get(context).currentIndex].img}',fit:BoxFit.cover,height:90,width:100,))
                ),
              const SizedBox(height: 30,),
                TextCustom(text: 'Height:${PokemonCubit.get(context).pokemonModel.pokemon?[PokemonCubit.get(context).currentIndex].height}',fontSize: 30,),
              const SizedBox(height: 30,),
                 TextCustom(text: 'Weight: ${PokemonCubit.get(context).pokemonModel.pokemon?[PokemonCubit.get(context).currentIndex].weight}',fontSize: 30,),
                const SizedBox(height: 30,),
                 const TextCustom(text: 'Types',fontSize: 30,fontWeight: FontWeight.bold,),
                const SizedBox(height: 30,),
                Container(padding: const EdgeInsets.all(2),
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(22),
                  ),
                child:  Center(child: SingleChildScrollView(scrollDirection: Axis.horizontal,child: TextCustom(text: '${PokemonCubit.get(context).pokemonModel.pokemon?[PokemonCubit.get(context).currentIndex].type}',fontSize: 20,))),),
                  
              ],

            ),
          ),
        ],
      ),
    ),);
  }
}
