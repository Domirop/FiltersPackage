import 'package:filterlist/src/choice_chip_widget.dart';
import 'package:filterlist/src/search_field_widget.dart';
import 'package:flutter/material.dart';

class FilterListWidget extends StatefulWidget {
  FilterListWidget({
    Key key,
    this.applyButtonElevation,
    this.splashColor,
    this.highlightColor,
    this.applyButtonPadding,
    this.textSelectedCounts,
    this.allButtonText,
    this.resetButtonText,
    this.applyButtonText,
    this.borderRadius,
    this.height,
    this.width,
    this.selectedTextList,
    this.allTextList,
    this.headlineText,
    this.searchFieldHintText,
    this.closeIconColor,
    this.headerTextColor,
    this.applyButonTextColor,
    this.applyButonTextBackgroundColor,
    this.allResetButonColor,
    this.selectedTextColor,
    this.backgroundColor,
    this.unselectedTextColor,
    this.searchFieldBackgroundColor,
    this.selectedTextBackgroundColor,
    this.unselectedTextbackGroundColor,
    this.hideHeader,
    this.hideheaderText,
    this.hideSearchField,
    this.hidecloseIcon,
    this.hideSelectedTextCount,
  }) : super(key: key);
  final String allButtonText;
  final EdgeInsets applyButtonPadding;
  final String textSelectedCounts;
  final String resetButtonText;
  final String applyButtonText;
  final double height;
  final double width;
  final double borderRadius;
  final List<String> selectedTextList;
  final List<String> allTextList;
  final Color closeIconColor;
  final Color headerTextColor;
  final Color backgroundColor;
  final Color splashColor;
  final Color highlightColor;
  final Color applyButonTextColor;
  final Color applyButonTextBackgroundColor;
  final Color allResetButonColor;
  final Color selectedTextColor;
  final Color unselectedTextColor;
  final Color searchFieldBackgroundColor;
  final Color selectedTextBackgroundColor;
  final Color unselectedTextbackGroundColor;
  final double applyButtonElevation;
  final String headlineText;
  final String searchFieldHintText;
  final bool hideSelectedTextCount;
  final bool hideSearchField;
  final bool hidecloseIcon;
  final bool hideHeader;
  final bool hideheaderText;

  @override
  _FilterListWidgetState createState() => _FilterListWidgetState();
}

class _FilterListWidgetState extends State<FilterListWidget> {
  List<String> _selectedTextList = List();

  List<String> _allTextList;

  @override
  void initState() {
    _allTextList =
    widget.allTextList == null ? [] : List.from(widget.allTextList);
    _selectedTextList = widget.selectedTextList != null
        ? List.from(widget.selectedTextList)
        : [];
    super.initState();
  }

  bool showApplyButton = false;

  Widget _body() {
    return Container(
      height: MediaQuery
          .of(context)
          .size
          .height - 100,
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              widget.hideHeader ? SizedBox() : _header(),
              widget.hideSelectedTextCount
                  ? SizedBox()
                  : Padding(
                padding: EdgeInsets.only(top: 5),
                child: Text(
                  '${_selectedTextList.length} ' + widget.textSelectedCounts,
                  style: Theme
                      .of(context)
                      .textTheme
                      .caption,
                ),
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.only(
                        top: 0, bottom: 0, left: 5, right: 5),
                    child: SingleChildScrollView(
                      child: Wrap(
                        children: _buildChoiceList(_allTextList),
                      ),
                    ),
                  )),
            ],
          ),
          _controlButon()
        ],
      ),
    );
  }

  Widget _header() {
    return Container(
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        boxShadow: <BoxShadow>[
          BoxShadow(
            offset: Offset(0, 5),
            blurRadius: 15,
            color: Color(0x12000000),
          )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Expanded(
                  flex: 6,
                  child: Center(
                    child: widget.hideheaderText
                        ? Container()
                        : Text(
                      widget.headlineText.toUpperCase(),
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline
                          .copyWith(
                          fontSize: 18,
                          color: widget.headerTextColor),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: InkWell(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    onTap: () {
                      Navigator.pop(context, null);
                    },
                    child: widget.hidecloseIcon
                        ? SizedBox()
                        : Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          border:
                          Border.all(color: widget.closeIconColor),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.close,
                        color: widget.closeIconColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            widget.hideSearchField
                ? SizedBox()
                : SizedBox(
              height: 10,
            ),
            widget.hideSearchField
                ? SizedBox()
                : SearchFieldWidget(
              searchFieldBackgroundColor:
              widget.searchFieldBackgroundColor,
              searchFieldHintText: widget.searchFieldHintText,
              onChanged: (value) {
                setState(() {
                  if (value.isEmpty) {}
                  _allTextList = widget.allTextList
                      .where(
                        (string) =>
                        string.toLowerCase().contains(
                          value.toLowerCase(),
                        ),
                  )
                      .toList();
                });
              },
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildChoiceList(List<String> list) {
    List<Widget> choices = List();
    list.forEach(
          (item) {
        var selectedText = _selectedTextList.contains(item);
        choices.add(
          ChoicechipWidget(
            onSelected: (value) {
              setState(
                    () {
                  selectedText
                      ? _selectedTextList.remove(item)
                      : _selectedTextList.add(item);
                },
              );
            },
            selected: selectedText,
            selectedTextColor: widget.selectedTextColor,
            selectedTextBackgroundColor: widget.selectedTextBackgroundColor,
            unselectedTextBackgroundColor: widget.unselectedTextbackGroundColor,
            unselectedTextColor: widget.unselectedTextColor,
            text: item,
          ),
        );
      },
    );
    choices.add(
      SizedBox(
        height: 70,
        width: MediaQuery
            .of(context)
            .size
            .width,
      ),
    );
    return choices;
  }

  Widget _controlButon() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 45,
        margin: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              offset: Offset(0, 5),
              blurRadius: 15,
              color: Color(0x12000000),
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              highlightColor: widget.highlightColor,
              splashColor: widget.splashColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              onPressed: () {
                setState(
                      () {
                    _selectedTextList = List.from(_allTextList);
                  },
                );
              },
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  widget.allButtonText,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline
                      .copyWith(
                      fontSize: 16, color: widget.allResetButonColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            FlatButton(
              highlightColor: widget.highlightColor,
              splashColor: widget.splashColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              onPressed: () {
                setState(() {
                  _selectedTextList.clear();
                });
              },
              child: Container(
                height: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  widget.resetButtonText,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline
                      .copyWith(
                      fontSize: 16, color: widget.allResetButonColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            FlatButton(
              highlightColor: widget.highlightColor,
              splashColor: widget.splashColor,
              color: widget.applyButonTextBackgroundColor,
              padding: widget.applyButtonPadding,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              onPressed: () {
                Navigator.pop(context, _selectedTextList);
              },
              child: Center(
                child: Text(
                  widget.applyButtonText,
                  style: Theme
                      .of(context)
                      .textTheme
                      .headline
                      .copyWith(
                      fontSize: 16, color: widget.applyButonTextColor),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(widget.borderRadius)),
        child: Container(
          height: widget.height,
          width: widget.width,
          color: widget.backgroundColor,
          child: Stack(
            children: <Widget>[
              _body(),
            ],
          ),
        ),
      ),
    );
  }
}
