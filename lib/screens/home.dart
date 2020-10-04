import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../res/res.dart';
import 'feed_screen.dart';
import 'demo_screen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  int currentTab = 0;
  final PageStorageBucket bucket = PageStorageBucket();

  List<Widget> pages = [
    Feed(key: PageStorageKey('FeedPage')),
    Container(),
    Container()
  ];

  final List<BottomNavyBarItem> _tab = [
    BottomNavyBarItem(
        asset: AppIcons.home,
        title: Text('Feed'),
        activeColor: AppColors.dodgerBlue,
        inactiveColor: AppColor.manatee),
    BottomNavyBarItem(
        asset: AppIcons.home,
        title: Text('Search'),
        activeColor: AppColors.dodgerBlue,
        inactiveColor: AppColor.manatee),
    BottomNavyBarItem(
        asset: AppIcons.home,
        title: Text('User'),
        activeColor: AppColors.dodgerBlue,
        inactiveColor: AppColor.manatee)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavyBar(
          showElevation: true,
          itemCornerRadius: 8,
          curve: Curves.ease,
          items: _tabs,
          currentTab: currentTab,
          onItemSelected: (index) async {
            if (index == 1) {
              var value = await Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return DemoScreen();
              }));
            } else {
              setState(() {
                currentTab = index;
              });
            }
          }),
      body: PageStorage(bucket: bucket, child: pages[currentTab]),
    );
  }
}

class BottomNavyBar extends StatelessWidget {
  const BottomNavyBar({
    Key key,
    this.currentTab,
    this.showElevation = true,
    this.backgroundColor,
    this.itemCornerRadius = 50,
    this.containerHeight = 56,
    this.animationDuration = const Duration(microseconds: 270),
    this.mainAxisAligment = MainAxisAlignment.spaceBetween,
    @required this.items,
    @required this.onItemSelected,
    this.curve Curves.linear
  }) {
    assert(items != null);
    assert(items.length >= 2 && items.length <= 5);
    assert(onItemSelected != null);
  }
  
  final Color backgroundColor;
  final bool showElevation;
  final double itemCornerRadius; 
  final double containerHeight;
  final Duration animationDuration; 
  final MainAxisAlignment mainAxisAligment;
  final List<BottomNavyBarItem> items;
  final ValueChanged<int> onItemSelected;
  final Curve curve;
  final int currentTab; 




  @override
  Widget build(BuildContext context) {
    final bgColor = (backgroundColor == null) ? Theme.of(context).bottomAppBarColor : backgroundColor;

    return Container(
      decoration: BoxDecoration(
        color: bgColor,
        boxShadow: [
          if(showElevation) 
            const BoxShadow(
              color: Colors.black12,
              blurRadius: 2,
            )
        ]
      ),
      child: SafeArea(
        child: Container(
          width: double.infinity,
          height: containerHeight,
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
          child: Row(
            mainAxisAlignment: mainAxisAligment,
            children: [
              items.map((item) => {
                var index = items.indexOf(item);
                return GestureDetector(
                  onTap: () {
                    onItemSelected(index)
                  },
                  child: _ItemWidget(
                    item: item,
                    isSelected: currentTab == index ? true : false,
                    backgroundColor: bgColor,
                    itemCornerRadius: itemCornerRadius,
                    animationDuration: animationDuration,
                    curve: curve,
                  ) 
                ); 
              }).toList(),
            ],
          )

        )
        ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key key,
    @required this.item,
    @required this.isSelected,
    @required this.backgroundColor,
    @required this.animationDuration,
    @required this.itemCornerRadius,
    this.curve = Curves.linear,
  }) {
    assert(isSelected != null);
    assert(item != null);
    assert(backgroundColor != null);
    assert(animationDuration != null);
    assert(itemCornerRadius != null);
    assert(curve != null);
  }

  final BottomNavyBarItem item;
  final bool isSelected;
  final Color backgroundColor;
  final Duration animationDuration;
  final double itemCornerRadius;
  final Curve curve;



  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isSelected ? 150 : (MediaQuery.of(context).size.width -150 - 8*4 - 4*2)/2,
      height: double.maxFinite,
      duration: animationDuration,
      curve: curve,
      decoration: BoxDecoration(
        color: isSelected ? item.activeColor.withOpacity(0.2) : backgroundColor,
        borderRadius: BorderRadius.circular(itemCornerRadius), 
      ),
      child: Container(
        width: isSelected ? 150 : (MediaQuery.of(context).size.width -150 - 8*4 - 4*2)/2,
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              item.asset,
              size: 20,
              color: isSelected ? item.activeColor : item.inactiveColor,
            ),
            SizedBox(width: 4),
            Expanded(child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4),
              child: DefaultTextStyle.merge(
                style: TextStyle(
                  color: isSelected ? item.activeColor : item.inactiveColor,
                  fontWeight: FontWeight.bold
                ),
                maxLines: 1,
                textAlign: item.textAlign,
                child: item.title,
              )
            ))  
           
          ],
        ),
      ),
      
    );
  }
}


class BottomNavyBarItem {
  BottomNavyBarItem({
    @required this.asset,
    @required this.title,
    this.activeColor = Colors.blue,
    this.textAlign,
    this.inactiveColor,  
  }) {
    assert(asset != null);
    assert(title != null);
  }

  final IconData asset;
  final Text title;
  final Color activeColor;
  final Color inactiveColor;
  final TextAlign textAlign;

}