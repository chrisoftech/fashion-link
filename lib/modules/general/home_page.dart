import 'package:fashion_link/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildRecommendedPages({@required BoxConstraints constraints}) {
    final double height = constraints.maxHeight * 0.55;

    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final double _deviceHeight = MediaQuery.of(context).size.height;
    final double _deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.menu,
              color: Colors.black,
              size: 32.0,
            ),
            Icon(
              Icons.search,
              color: Colors.black,
              size: 32.0,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBar(
        onChangeActiveTab: (int index) {},
      ),
      body: Container(),
    );
  }
}
