import 'package:flutter/material.dart';
import 'package:isa_app/constants.dart';

class PageSelectorBar extends StatelessWidget {
  final List<String> pages;
  final Function onPageSelected;
  final int selectedIndex;

  PageSelectorBar(
      {this.pages = const ['abc'], this.onPageSelected, this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: kDefaultMargin/2),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onPageSelected(index),
            child: Container(
                margin: EdgeInsets.symmetric(
                    vertical: kDefaultMargin / 2,
                    horizontal: kDefaultMargin / 4),
                padding: EdgeInsets.all(kDefaultMargin / 2),
                decoration: BoxDecoration(
                    color: selectedIndex == index
                        ? Theme.of(context).accentColor
                        : Theme.of(context).accentColor.withOpacity(.6),
                    borderRadius: BorderRadius.all(
                        Radius.circular(kDefaultBorderRadius))),
                child: Center(
                    child: Text(
                  pages[index],
                  style: Theme.of(context).textTheme.headline6.copyWith(
                      color: selectedIndex == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).primaryColor.withOpacity(1)),
                ))),
          );
        },
        itemCount: pages.length,
      ),
    );
  }
}
