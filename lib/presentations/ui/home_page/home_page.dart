import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../business_logic/blocs/blocs.dart';
import '../widgets/error_dialog.dart';
import 'grid_view_widget.dart';
import 'search_widget.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home-page';

  static Route route(RouteSettings settings) {
    return MaterialPageRoute(
        builder: (_) => const HomePage(),
        settings: const RouteSettings(name: routeName));
    //arguments: settings.arguments));
  }

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const SearchWidget(),
        centerTitle: true,
        automaticallyImplyLeading: false,
        elevation: 2.0,
        // backgroundColor: Theme.of(context).canvasColor,
      ),
      body: _showPokemonCardList(context),
    );
  }

  Widget _showPokemonCardList(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: BlocConsumer<PokemonBloc, PokemonState>(
            listener: (context, state) {
              if (state.status == PokemonStatus.failure) {
                errorDialog(context, state.error.toString());
              }
            },
            builder: (context, state) {
              if (state.status == PokemonStatus.initial) {
                return initialWidget();
              }
              if (state.status == PokemonStatus.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state.status == PokemonStatus.failure &&
                  state.listPokemonCards == null) {
                return errorWidget();
              }
              return const GridViewWidget();
            },
          ),
        );
      },
    );
  }

  Widget initialWidget() {
    return const Center(
      child: Text('Start Searching...'),
    );
  }

  Widget errorWidget() {
    return const Center(
      child: Text('Error, No Cards found'),
    );
  }
}
