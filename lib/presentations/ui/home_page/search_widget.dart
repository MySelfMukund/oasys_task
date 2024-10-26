import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokemon_card_list/business_logic/blocs/search/search_bloc.dart';

class SearchWidget extends StatefulWidget {
  const SearchWidget({super.key});

  @override
  State<SearchWidget> createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final _formKey = GlobalKey<FormState>();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? _searchText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Form(
        key: _formKey,
        child: TextFormField(
          autovalidateMode: autoValidateMode,
          autofocus: true,
          decoration: InputDecoration(
            // labelText: 'Pokemon Name...',
            hintText: 'Enter name to search',
            suffixIcon: const Icon(Icons.search),
            contentPadding:
                EdgeInsets.only(left: 20.w, right: 20.w, top: 5, bottom: 5),
            border: const OutlineInputBorder(
              borderSide: BorderSide(width: 0.5, color: Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
          ),
          onChanged: (String newSearchText) {
            if (newSearchText.isNotEmpty) {
              autoValidateMode = AutovalidateMode.always;
              context
                  .read<SearchBloc>()
                  .add(SetSearchTextEvent(newSearchText: newSearchText));
            }
          },
        ),
      ),
    );
  }
}
