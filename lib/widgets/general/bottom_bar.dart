import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  final Function(int index) onChangeActiveTab;
  final int activeIndex;

  const BottomBar(
      {Key key, @required this.onChangeActiveTab, this.activeIndex = 0})
      : super(key: key);

  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _activeIndex;
  Function(int index) get _onChangeActiveTab => widget.onChangeActiveTab;

  @override
  void initState() {
    _activeIndex = widget.activeIndex;
    super.initState();
  }

  Color _getItemColor({@required int index}) {
    return index == _activeIndex
        ? Theme.of(context).accentColor
        : Colors.grey[300];
  }

  Widget _buildBottomTabItem({@required IconData icon, @required int index}) {
    final double itemWidth = MediaQuery.of(context).size.width / 5;
    final double iconSize = 35.0;

    return Container(
      width: itemWidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              size: iconSize,
              color: _getItemColor(index: index),
            ),
            onPressed: () {
              if (index != _activeIndex) {
                setState(() {
                  _activeIndex = index;
                  _onChangeActiveTab(index);
                });
              }
            },
          ),
          Visibility(
            visible: index == _activeIndex,
            child: Container(
              height: 2.0,
              width: itemWidth / 5,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0.0,
            child: BottomAppBar(
              child: Container(
                height: 60.0,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    _buildBottomTabItem(
                      icon: Icons.home,
                      index: 0,
                    ),
                    _buildBottomTabItem(
                      icon: Icons.rss_feed,
                      index: 1,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width /
                          5, // create space for FAB
                    ),
                    _buildBottomTabItem(
                      icon: Icons.person_outline,
                      index: 2,
                    ),
                    _buildBottomTabItem(
                      icon: Icons.notifications_none,
                      index: 3,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            width: MediaQuery.of(context).size.width,
            child: Container(
              alignment: Alignment.center,
              child: FloatingActionButton(
                heroTag: 'home-FAB',
                elevation: 2.0,
                highlightElevation: 5.0,
                backgroundColor: Theme.of(context).accentColor,
                child: Icon(
                  Icons.add_a_photo,
                  size: 38.0,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
