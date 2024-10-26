import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_card_list/business_logic/blocs/blocs.dart';
import 'package:pokemon_card_list/business_logic/services/pokeman_services.dart';
import 'package:pokemon_card_list/core/app_routes.dart';
import 'package:pokemon_card_list/presentations/ui/home_page/home_page.dart';

import 'business_logic/repositories/pokemon_repository.dart';
import 'core/app_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return RepositoryProvider(
            create: (context) =>
                PokemonRepository(pokemonServices: PokemonServices()),
            child: MultiBlocProvider(
              providers: [
                BlocProvider<SearchBloc>(create: (context) => SearchBloc()),
                BlocProvider<PokemonBloc>(
                    create: (context) => PokemonBloc(
                        pokemonRepository: context.read<PokemonRepository>())
                      ..add(const FetchPokemonEvent())),
                BlocProvider(
                    create: (context) => SearchedCardsBloc(
                        intialPokemonCards: context
                            .read<PokemonBloc>()
                            .state
                            .listPokemonCards!)),
              ],
              child: MaterialApp(
                onGenerateRoute: AppRoutes.onGenerateRoute,
                initialRoute: HomePage.routeName,
                title: 'Pokemon Card List',
                theme: ThemeData(
                  colorScheme:
                      ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  useMaterial3: true,
                ),
                home: const HomePage(),
                debugShowCheckedModeBanner: false,
              ),
            ),
          );
        });
  }
}
