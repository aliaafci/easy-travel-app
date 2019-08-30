import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'all_widgets_defintion.dart';
class CustomTabBar extends StatefulWidget {
  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
    int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return _buildBottomNavigationBar(context);
  }
    BottomNavigationBarItem _buildItem(
        {IconData icon, String layoutName , Color colorItem}) {
      String text = layoutName;
      return BottomNavigationBarItem(
        icon: Icon(
          icon,
          color:colorItem,
        ),
        title: Text(
          text,
          style: TextStyle(
            color: colorItem,
          ),
        ),
      );
    }

    Widget _buildBottomNavigationBar(context) {
      return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          _buildItem(
              icon: Icons.explore, layoutName: S.of(context).bottom_bar_item_explore,colorItem:activeIndex==0?Colors.red:Colors.grey),
          _buildItem(
              icon: FontAwesomeIcons.calendarAlt, layoutName: S.of(context).bottom_bar_item_my_trip,colorItem:activeIndex==1?Colors.red:Colors.grey),
          _buildItem(
              icon: FontAwesomeIcons.bookmark, layoutName: S.of(context).bottom_bar_item_favourite,colorItem:activeIndex==2?Colors.red:Colors.grey),
          _buildItem(
              icon: FontAwesomeIcons.idBadge, layoutName: S.of(context).bottom_bar_item_profile,colorItem:activeIndex==3?Colors.red:Colors.grey),
        ],
        onTap: _onSelectTab,
      );
    }
    void _onSelectTab(int index) {
      setState(() {
        this.activeIndex = index;
      });
      switch (index) {
        case 0:
          _onLayoutSelected(index);
          break;
        case 1:
          _onLayoutSelected(index);
          break;
        case 2:
          _onLayoutSelected(index);
          break;
        case 3:
          _onLayoutSelected(index);
          break;
        case 4:
          _onLayoutSelected(index);
          break;
      }

    }
    void _onLayoutSelected(index) {
      print("tap on $index ");
    }

}
