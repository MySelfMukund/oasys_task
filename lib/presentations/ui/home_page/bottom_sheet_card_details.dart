import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokemon_card_list/business_logic/models/models.dart';
import 'package:pokemon_card_list/core/extensions.dart';

class BottomSheetCardDetails extends StatelessWidget {
  final PokemonModel card;
  final String heroTag;

  const BottomSheetCardDetails(
      {super.key, required this.card, required this.heroTag});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Hero(
        tag: heroTag,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(card.name,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              CachedNetworkImage(
                imageUrl: card.images!.large,
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              _buildAttackInfo("Attack", card.attacks!),
              //dynamically created teh Set Widget(below)
              _buildSetWidget('Set', card.datumSet!.toJson()),
              _buildInfo("Type", card.types?.join(", ")),
              _buildInfo("Weaknesses", card.weaknesses?.join(", ")),
              _buildInfo("Artist", card.artist),
              _buildAbilityWidget('Abilities', card.abilities!.toList())
            ],
          ),
        ),
      ),
    );
  }

  _buildAbilityWidget(String title, List<dynamic> abilities) {
    return ListView.builder(
        // physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: abilities.length,
        itemBuilder: (context, index) {
          Ability ability = abilities[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ability.toJson().entries.map((entry) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: _rowWidget(
                    entry.key[0].toUpperCase() +
                        entry.key.substring(1), // Capitalize first letter
                    entry.value.toString()),
              );
            }).toList(),
          );
        });
    // return ListView.builder(
    //     physics: const NeverScrollableScrollPhysics(),
    //     shrinkWrap: true,
    //     itemCount: abilities.toList().length,
    //     itemBuilder: (context, index) {
    //       Ability ability = abilities[index];
    //       // if (value[index] is Map) {
    //       return Column(
    //         mainAxisSize: MainAxisSize.min,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: ability.toJson().entries.map((entry) {
    //           return Padding(
    //             padding: const EdgeInsets.symmetric(vertical: 8.0),
    //             child: _rowWidget(
    //                 entry.key.toCapitalize(), entry.value.toString()),
    //           );
    //         }).toList(),
    //       );
    //       // }
    //       // return _rowWidget(title, value[index].toString());
    //     });
  }

  Widget _buildSetWidget(String title, Map<String, dynamic> value) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            title.toCapitalize(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          ListView(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: value.entries.map((entry) {
              // if (entry.value is Map) {
              // For nested maps, display each key-value pair within this map
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        '${entry.key.toCapitalize()}:',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: entry.value is Map
                          ? ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: entry.value.length,
                              itemBuilder: (context, index) {
                                String title = entry.value.keys.toList()[index];
                                dynamic value =
                                    entry.value.values.toList()[index];
                                return _rowWidget(title, value);
                              })
                          // return nestedEntry.value.toString() == ""
                          //     ? Container()
                          //     : Text(
                          //         "${nestedEntry.key}: ${nestedEntry.value.toString()}");

                          : Expanded(
                              flex: 3,
                              child: Text(
                                '${entry.value.toString()}:',
                                style: const TextStyle(fontSize: 18),
                              ),
                            ),

                      // Padding(
                      //   padding: const EdgeInsets.only(left: 16.0),
                      //   child: Column(
                      //     mainAxisSize: MainAxisSize.min,
                      //     crossAxisAlignment: CrossAxisAlignment.start,
                      //     children: (entry.value as Map<String, dynamic>)
                      //         .entries
                      //         .map((nestedEntry) {
                      //       return nestedEntry.key == 'symbol' ||
                      //               nestedEntry.key == 'logo'
                      //           ? Image.network(
                      //               nestedEntry.value,
                      //               width: 50.w,
                      //               height: 50.h,
                      //             )
                      //           : Text(
                      //               '${nestedEntry.key.toCapitalize()}: ${nestedEntry.value}',
                      //               style: const TextStyle(fontSize: 16),
                      //             );
                      //     }).toList(),
                      //   ),
                      // ),
                    ),
                  ],
                ),
              );

              //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
              // } else {
              //   // For regular key-value pairs, display directly
              //   return Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 4.0),
              //     child:
              //         // _rowWidget(
              //         //     entry.key.toCapitalize(), entry.value.toString())
              //         //     Row(
              //         //   children: [
              //         //     Expanded(
              //         //       flex: 2,
              //         //       child: Text('${entry.key}:'),
              //         //     ),
              //         //     Expanded(flex: 3, child: Text('${entry.value}')),
              //         //   ],
              //         // ),
              //
              //         Text(
              //       '${entry.key}: ${entry.value}',
              //       style: TextStyle(fontSize: 16),
              //     ),
              //   );
              // }
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildInfo(String title, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              flex: 2,
              child: Text("$title :",
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(flex: 3, child: Text(value ?? "N/A")),
        ],
      ),
    );
  }

  Widget _buildAttackInfo(String title, List<Attack> value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: Text(title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
          ),
          ListView.builder(
            // physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: value.length,
            itemBuilder: (context, index) {
              Attack singleAttack = value[index];
              Map<String, dynamic> singleAttackData = value[index].toJson();
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: singleAttackData.length,
                  itemBuilder: (context, index) {
                    String keyValue = singleAttackData.keys.toList()[index];
                    dynamic value = singleAttackData.values.toList()[index];
                    return _rowWidget(
                        keyValue,
                        value is List
                            ? List<dynamic>.from(
                                    value.toSet().map((x) => x.toString()))
                                .join(', ')
                            : value.toString());
                    //Text("${singleAttackData.keys.toLisst()[index]} : ${singleAttackData.values.toList()[index]}");
                  });
            },
          ),
        ],
      ),
    );
  }

  // Widget attackWidget(List<Attack> attacks) {
  //   return ListView.builder(
  //     itemCount: attacks.length,
  //     itemBuilder: (context, index) {
  //       final move = attacks[index].toJson();
  //       List<Widget> keyValueWidgets = [];
  //       move.forEach((key, value) {
  //         keyValueWidgets.add(
  //           Padding(
  //             padding: const EdgeInsets.symmetric(vertical: 4.0),
  //             child: Row(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   '$key: ',
  //                   style: TextStyle(fontWeight: FontWeight.bold),
  //                 ),
  //                 Expanded(
  //                   child: value is List
  //                       ? Wrap(
  //                           spacing: 8,
  //                           children: value.map<Widget>((item) {
  //                             return Chip(label: Text(item.toString()));
  //                           }).toList(),
  //                         )
  //                       : Text(value.toString()),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  //       });
  //
  //       return Card(
  //         margin: EdgeInsets.all(8.0),
  //         child: Padding(
  //           padding: EdgeInsets.all(16.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: keyValueWidgets,
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
}

Widget _rowWidget(String title, String value) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 2,
        child: Text("$title : ",
            style: const TextStyle(fontWeight: FontWeight.bold)),
      ),
      Expanded(flex: 5, child: Text(value ?? "N/A"))
    ],
  );
}
