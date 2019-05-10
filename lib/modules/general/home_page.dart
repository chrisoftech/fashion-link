import 'package:fashion_link/widgets/widgets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget _buildLatestPost(
      {@required BoxConstraints constraints, @required double deviceWidth}) {
    print(deviceWidth);
    return Row(
      children: <Widget>[
        Container(
          width: deviceWidth - 40.0,
          child: GestureDetector(
            onTap: () {},
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0.0,
                  width: deviceWidth - 45.0,
                  height: constraints.maxHeight * 0.65,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/temp3.jpg'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0.0,
                  width: deviceWidth - 45.0,
                  height: constraints.maxHeight <= 264.0
                      ? 145.0
                      : constraints.maxHeight * 0.55,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  backgroundImage:
                                      AssetImage('assets/images/temp4.jpg'),
                                ),
                                title: Text('by John Doe'),
                                subtitle: Text('Monday 6, January 2019'),
                                trailing: IconButton(
                                    icon:
                                        Icon(Icons.favorite, color: Colors.red),
                                    onPressed: () {
                                      print('Favorite tapped');
                                    }),
                                onTap: () {
                                  print('ListTile tapped');
                                },
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text('Affordable Wears',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                subtitle: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dolor purus, isaculis ac dolor nec, laoreet imperdiet eros.',
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            SizedBox(height: 10.0),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        SizedBox(width: 10.0),
      ],
    );
  }

  Widget _buildRecommendedPosts({@required BoxConstraints constraints}) {
    final double height =
        constraints.maxHeight <= 264.0 ? 140.0 : constraints.maxHeight * 0.55;

    return Container(
      height: height,
      width: constraints.maxWidth,
      child: Stack(
        children: <Widget>[
          Positioned(
            left: 15.0,
            bottom: 0.0,
            height: height - 15.0,
            width: constraints.maxWidth - 70.0,
            child: Material(
              elevation: 5.0,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                padding: EdgeInsets.only(left: constraints.maxWidth * 0.25),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: ListTile(
                        contentPadding: EdgeInsets.only(left: 8.0, top: 5.0),
                        leading: CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage:
                              AssetImage('assets/images/temp4.jpg'),
                        ),
                        title: Text('John Doe', overflow: TextOverflow.fade),
                        subtitle: Text('January 6, 2019'),
                        trailing: IconButton(
                            icon: Icon(Icons.favorite, color: Colors.red),
                            onPressed: () {
                              print('Favorite tapped');
                            }),
                        onTap: () {
                          print('ListTile tapped');
                        },
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: Text('Affordable Wears',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        subtitle: Text(
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc dolor purus, iaculis ac dolor nec, laoreet imperdiet eros.',
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    SizedBox(height: 5.0)
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 0.0,
            left: 0.0,
            height: height - 15.0,
            width: constraints.maxWidth * 0.26,
            child: Material(
              elevation: 3.0,
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/temp7.jpg'),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
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
      body: Container(
        height: _deviceHeight,
        width: _deviceWidth,
        child: Column(
          children: <Widget>[
            CategoryNavigator(
              categories: ['Latest', 'Wears', 'Jeweries', 'Shoes', 'Others'],
              onChangeActiveTab: (int index) {},
            ),
            SizedBox(height: 10.0),
            Flexible(
              flex: 1,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(left: 20.0),
                    children: <Widget>[
                      _buildLatestPost(
                          constraints: constraints, deviceWidth: _deviceWidth),
                      _buildLatestPost(
                          constraints: constraints, deviceWidth: _deviceWidth),
                      _buildLatestPost(
                          constraints: constraints, deviceWidth: _deviceWidth),
                      _buildLatestPost(
                          constraints: constraints, deviceWidth: _deviceWidth),
                      _buildLatestPost(
                          constraints: constraints, deviceWidth: _deviceWidth),
                    ],
                  );
                },
              ),
            ),
            Flexible(
              flex: 1,
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Recommended',
                          style: TextStyle(
                            fontSize: 23.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Expanded(
                          child: Container(
                            height: constraints.maxHeight,
                            width: constraints.maxWidth,
                            child: ListView(
                              children: <Widget>[
                                _buildRecommendedPosts(
                                    constraints: constraints),
                                SizedBox(height: 10.0),
                                _buildRecommendedPosts(
                                    constraints: constraints),
                                SizedBox(height: 10.0),
                                _buildRecommendedPosts(
                                    constraints: constraints),
                                SizedBox(height: 10.0),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
