import 'package:flutter/material.dart';

class CategoryNavigator extends StatefulWidget {
  final List<String> categories;
  final Function(int index) onChangeActiveTab;

  const CategoryNavigator(
      {Key key, @required this.categories, @required this.onChangeActiveTab})
      : super(key: key);
  @override
  _CategoryNavigatorState createState() => _CategoryNavigatorState();
}

class _CategoryNavigatorState extends State<CategoryNavigator> {
  int _activeIndex;

  List<String> get _categories => widget.categories;
  Function(int index) get _onChangeActiveTab => widget.onChangeActiveTab;

  Color _getItemColor({@required int index}) {
    return index == _activeIndex ? Colors.black54 : Colors.grey[300];
  }

  @override
  Widget build(BuildContext context) {
    double _deviceHeight = MediaQuery.of(context).size.height;
    double _deviceWidth = MediaQuery.of(context).size.width;

    List<Widget> items = [];

    for (int index = 0; index < _categories.length; index++) {
      items.add(
        GestureDetector(
          onTap: () {
            if (index != _activeIndex) {
              setState(() {
                _activeIndex = index;
                _onChangeActiveTab(index);
              });
            }
          },
          child: Row(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '${_categories[index]}',
                    style: TextStyle(
                        color: _getItemColor(index: index),
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Visibility(
                    visible: index == _activeIndex,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        height: 5.0,
                        width: 5.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).accentColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: _deviceWidth / 8)
            ],
          ),
        ),
      );
    }

    return Container(
      height: 40.0,
      width: _deviceWidth,
      child: ListView(
        padding: EdgeInsets.only(left: 20.0),
        scrollDirection: Axis.horizontal,
        children: items.toList(),
      ),
    );
  }
}
