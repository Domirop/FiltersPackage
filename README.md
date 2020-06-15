filter_list Plugin

pub package Codemagic build status GitHub last commit Open Source Love GitHub GitHub stars GitHub forks

FilterList is a flutter plugin which is designed to provide ease in filter data from list of strings.
Download App GitHub All Releases

Data flow

    Pass list of strings to FilterList.showFilterList().
    Pass list of selected strings to show pre-selected text otherwise ignore it.
    Invoke method FilterList.showFilterList() to display filter dialog.
    Make selection from list.
    Click All button to select all text from list.
    Click Reset button to make all text unselected.
    Click Apply buton to return selected list of strings.
    On close icon clicked it close dialog and return null value.
    Without making any selection Apply button is pressed it will return empty list of string.

Getting Started
1. Add library to your pubspec.yaml

dependencies:
  filter_list: ^0.0.1

2. Import library in dart file

import package:filter_list/filter_list.dart';

3. How to use FilterList
Create a list of Strings

  List<String> countList = [
    "One",
    "Two",
    "Three",
    "Four",
    "Five",
    "Six",
    "Seven",
    "Eight",
    "Nine",
    "Ten",
    "Eleven",
    "Tweleve",
    "Thirteen",
    "Fourteen",
    "Fifteen",
    "Sixteen",
    "Seventeen",
    "Eighteen",
    "Nineteen",
    "Twenty"
  ];
  List<String> selectedCountList = [];

Create a function and call FilterList.showFilterList() dialog on button clicked

  void _openFilterList() async {
    var list = await FilterList.showFilterList(
      context,
      allTextList: countList,
      height: 450,
      borderRadius: 20,
      headlineText: "Select Count",
      searchFieldHintText: "Search Here",
      selectedTextList: selectedCountList,
    );

    if (list != null) {
      setState(() {
        selectedCountList = List.from(list);
      });
    }
  }

Call _openFilterList function on floatingActionButton pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _openFilterList,
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
        /// check for empty or null value selctedCountList
        body: selectedCountList == null || selectedCountList.length == 0
            ? Center(
                child: Text('No text selected'),
              )
            : ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(selectedCountList[index]),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: selectedCountList.length));
  }

Screenshots
No selected text from list 	FilterList widget 	Make selection 	Selected text from list

Hidden close Icon 	Hidden text field 	Hidden header text 	Hidden full header

Customised control button 	Customised selected text 	Customised unselected text 	Customised text field background color

Parameters and Value

height Type: double

    Set height of filter dialog.

width Type: double

    Set width of filter dialog.

borderRadius Type: double

    Set border radius of filter dialog.

allTextList Type: List<String>()

    Populate filter dialog with text list.

selectedTextList Type: List<String>()

    Marked selected text in filter dialog.

headlineText Type: String

    Set header text of filter dialog.

searchFieldHintText Type: String

    Set hint text in search field.

hideSelectedTextCount Type: bool

    Hide selected text count.

hideSearchField Type: bool

    Hide search text field.

hidecloseIcon Type: bool

    Hide close Icon.

hideheader Type: bool

    Hide complete header section from filter dialog.

closeIconColor Type: Color

    set color of close Icon.

headerTextColor Type: Color

    Set color of header text.

applyButonTextColor Type: Color

    Set text color of apply button.

applyButonTextBackgroundColor Type: Color

    Set background color of apply button.

allResetButonColor Type: Color

    Set text color of all and reset button.

selectedTextColor Type: Color

    Set color of selected text in filter dialog.

selectedTextBackgroundColor Type: Color

    Set background color of selected text field.

unselectedTextbackGroundColor Type: Color

    Set background color of unselected text field.

unselectedTextColor Type: Color

    Set text color of unselected text in filter dialog

searchFieldBackgroundColor Type: Color

    Set background color of Search field.

backgroundColor Type: Color

    Set background color of filter color.

Flutter plugins
Plugin Name 	Stars
Empty widget 	GitHub stars
Add Thumbnail 	GitHub stars
Pull Requests

I welcome and encourage all pull requests. It usually will take me within 24-48 hours to respond to any issue or request.
Created & Maintained By

Sonu Sharma (Twitter) (Youtube) (Insta) Twitter Follow

    If you found this project helpful or you learned something from the source code and want to thank me, consider buying me a cup of ☕

        PayPal


