import 'package:finder_seller/presentation/widgets/link_button.dart';
import 'package:flutter/material.dart';

class SettingList extends StatelessWidget {
  SettingList({Key? key, required this.leading}) : super(key: key);

  final List<String> _labelTextList = ["", "利用規約", "公式Twitter", "公式Instagram"];
  final List<String> _linkURLList = [
    "https://koichi5.github.io/finder_seller/",
    "https://twitter.com/home",
    "https://www.instagram.com/"
  ];
  final List<Widget> leading;
  final _linkButton = LinkButton();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _labelTextList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(_labelTextList[index]),
              leading: leading[index],
              trailing: const Icon(Icons.arrow_forward_ios, size: 20,),
              onTap: () {
                _linkButton.launchUriWithString(context, _linkURLList[index]);
              });
        });
  }
}
