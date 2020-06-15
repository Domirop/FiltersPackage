library filter_list;

import 'package:filterlist/src/filter_list_widget.dart';
import 'package:flutter/material.dart';

class FilterList {
  static Future<List<String>> showFilterList(context, {
    double height,
    double width,
    EdgeInsets applyButtonPadding,
    String textSelectedCounts = "Selected items",
    String allButtonText = "All",
    String resetButtonText = "Reset",
    String applyButtonText = "Apply",
    double borderRadius = 20,
    List<String> selectedTextList,
    List<String> allTextList,
    String headlineText = "Select here",
    String searchFieldHintText = "Search here",
    bool hideSelectedTextCount = false,
    bool hideSearchField = false,
    bool hidecloseIcon = false,
    bool hideheader = false,
    bool hideheaderText = false,
    Color closeIconColor = Colors.black,
    Color headerTextColor = Colors.black,
    Color applyButonTextColor = Colors.white,
    Color applyButonTextBackgroundColor = Colors.blue,
    double applyButtonElevation = 2.0,
    Color splashColor = Colors.transparent,
    Color highlightColor = Colors.transparent,
    Color allResetButonColor = Colors.blue,
    Color selectedTextColor = Colors.white,
    Color backgroundColor = Colors.white,
    Color unselectedTextColor = Colors.black,
    Color searchFieldBackgroundColor = const Color(0xfff5f5f5),
    Color selectedTextBackgroundColor = Colors.blue,
    Color unselectedTextbackGroundColor = const Color(0xfff8f8f8),
  }) async {
    if (height == null) {
      height = MediaQuery
          .of(context)
          .size
          .height * .8;
    }
    if (width == null) {
      width = MediaQuery
          .of(context)
          .size
          .width;
    }
    if (applyButtonPadding == null) {
      applyButtonPadding = EdgeInsets.only(bottom: 5);
    }
    var list = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            height: height,
            width: width,
            color: Colors.transparent,
            child: FilterListWidget(
              height: height,
              applyButtonElevation: applyButtonElevation,
              textSelectedCounts: textSelectedCounts,
              allButtonText: allButtonText,
              splashColor: splashColor,
              highlightColor: highlightColor,
              applyButtonText: applyButtonText,
              resetButtonText: resetButtonText,
              width: width,
              borderRadius: borderRadius,
              allTextList: allTextList,
              headlineText: headlineText,
              searchFieldHintText: searchFieldHintText,
              selectedTextList: selectedTextList,
              allResetButonColor: allResetButonColor,
              applyButonTextBackgroundColor: applyButonTextBackgroundColor,
              applyButonTextColor: applyButonTextColor,
              backgroundColor: backgroundColor,
              closeIconColor: closeIconColor,
              headerTextColor: headerTextColor,
              searchFieldBackgroundColor: searchFieldBackgroundColor,
              selectedTextBackgroundColor: selectedTextBackgroundColor,
              selectedTextColor: selectedTextColor,
              hideSelectedTextCount: hideSelectedTextCount,
              unselectedTextbackGroundColor: unselectedTextbackGroundColor,
              unselectedTextColor: unselectedTextColor,
              hidecloseIcon: hidecloseIcon,
              hideHeader: hideheader,
              hideheaderText: hideheaderText,
              hideSearchField: hideSearchField,
            ),
          ),
        );
      },
    );
    return list ?? selectedTextList;
  }
}

