import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/view/screens/pokemon_details.dart';
import '../../view_model/bloc/pokemon/pokemon_cubit.dart';
import '../../view_model/utilis/colors.dart';
import '../../view_model/utilis/navigation.dart';
import '../widgets/text_custom.dart';

class PokemonScreen extends StatelessWidget {
  const PokemonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
  value: PokemonCubit.get(context)..getPokemon(),
  child: Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: (const TextCustom(text: 'Pokemon Icons',fontSize: 20,fontWeight: FontWeight.bold,color: AppColors.background,)),
      ),
    body: SafeArea(
      child:
         Column(
          children: [
            BlocConsumer<PokemonCubit,PokemonState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    if(state is PokemonLoadingState){
      return const Center(child:  CircularProgressIndicator(strokeWidth: 10,));
    }

    return Expanded(
              child: GridView.builder(
                gridDelegate:const  SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                  crossAxisSpacing: 3,
                  mainAxisSpacing: 5
        ),
                itemBuilder:(context,index)=> Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration:BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white
                    ) ,
                  child:  Center(child:  Column(
                  children: [
                    InkWell(onTap:(){
                      PokemonCubit.get(context).currentIndex=index;
                      Navigation.push(context,const PokemonDetails());
                    },child: Hero(tag: index.toString(),child: Image.network('${PokemonCubit.get(context).pokemonModel.pokemon?[index].img}',fit:BoxFit.cover,height:90,width:100,))),
                     const SizedBox(height: 20,),
                      SingleChildScrollView(scrollDirection: Axis.horizontal,child: TextCustom(text:'${PokemonCubit.get(context).pokemonModel.pokemon?[index].name}',fontSize: 20,fontWeight: FontWeight.bold,))
                  ],
                  ),
                  ),
                  ),
                ),
              itemCount:PokemonCubit.get(context).pokemonModel.pokemon?.length),
            );
  },
)
          ],
        ),
      ),
    ),
);
  }
}
