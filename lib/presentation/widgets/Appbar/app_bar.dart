// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scancart/application/bloc/Search/search_bloc.dart';
import 'package:scancart/core/colors/colors.dart';
import 'package:scancart/core/constant.dart';
import 'package:scancart/core/fonts/fonts.dart';
import 'package:scancart/infrastructure/services/CommonServies.dart';
import 'package:scancart/infrastructure/services/SearchService.dart';
import 'package:scancart/presentation/Product/product_screen.dart';
import 'package:scancart/presentation/Scan/ScanPage.dart';
import 'package:scancart/presentation/widgets/Appbar/slide_animation.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class AppHeader extends StatelessWidget {
  final bool isHomePage;
  const AppHeader({required this.isHomePage, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        return AppBar(
          title: state.isSearch
              ? SlideAnimation(
                  child: TypeAheadFormField(
                    noItemsFoundBuilder: (context) => Text("No item found",style: GoogleFonts.getFont(baseFont,fontSize: mediumFontSize),),
                    suggestionsCallback: (value){
                      // return data.where((element) => element.name.toLowerCase().contains(value.toLowerCase()));
                      return searchProduct(value);
                    },
                    onSuggestionsBoxToggle: (val){
                      if(!val){
                        FocusManager.instance.primaryFocus?.unfocus();
                        context
                            .read<SearchBloc>()
                            .add(ChangeSearching(value: false));
                      }
                    },
                    minCharsForSuggestions: 1,
                    itemBuilder: (context, itemData) => 
                    ListTile(
                      leading: Image.network(itemData.coverImage),
                      title: Text(itemData.name.capitalizeFirst(),style: GoogleFonts.getFont(baseFont,fontSize: mediumFontSize),),),
                    onSuggestionSelected: (product) => Navigator.pushNamed(context, ProductScreen.routeName,arguments: product),
                    textFieldConfiguration: TextFieldConfiguration(
                      onTapOutside: (event) {
                        FocusManager.instance.primaryFocus?.unfocus();
                        context
                            .read<SearchBloc>()
                            .add(ChangeSearching(value: false));
                      },
                      cursorColor: mainLogoColor,
                      autofocus: true,
                      style: searchTextStyle,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: searchTextStyle,
                          suffixIcon: const Icon(
                            Icons.search,
                            color: mainLogoColor,
                            size: 25,
                          ),
                          hintText: "Search Here"),
                    ),
                  ))
              : Text(appName, style: titleStyle),
          backgroundColor: primaryColor,
          automaticallyImplyLeading: false,
          actions: [
            Visibility(
              visible: !state.isSearch,
              child: SizedBox(
                width: 120,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    isHomePage
                        ? InkWell(
                            onTap: () {
                              context
                                  .read<SearchBloc>()
                                  .add(ChangeSearching(value: true));
                            },
                            child: const Icon(
                              Icons.search,
                              size: 30,
                              color: mainLogoColor,
                            ))
                        : const SizedBox(
                            width: 0,
                          ),
                    InkWell(
                        onTap: () =>
                            Navigator.pushNamed(context, ScanPage.routeName),
                        child: const Icon(
                          Icons.qr_code_scanner,
                          size: 30,
                          color: mainLogoColor,
                        ))
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }
}


class ScreenAppBar extends StatelessWidget {
  final String title;
  final bool isCenter;
  const ScreenAppBar({required this.title, required this.isCenter, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: isCenter,
      title: Text(title,style: GoogleFonts.getFont(baseFont,fontSize: bigFontSize,fontWeight: mediumFontWeight,color: mainLogoColor),),
      backgroundColor: primaryColor,
      automaticallyImplyLeading: false,
    );
  }
}
