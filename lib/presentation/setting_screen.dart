import 'package:finder_seller/presentation/widgets/link_button.dart';
import 'package:finder_seller/presentation/widgets/setting_list.dart';
import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  SettingScreen({Key? key}) : super(key: key);

  final List<String> _labelTextList = [
    "プロフィール",
    "利用規約",
    "公式Twitter",
    "公式Instagram"
  ];
  final List<String> _linkURLList = [
    "https://koichi5.github.io/finder_seller/",
    "https://twitter.com/home",
    "https://www.instagram.com/",
  ];
  final List<Widget> _leadingWidget = [
    const Icon(
      Icons.person,
      size: 30,
      color: Colors.black,
    ),
    const Icon(
      Icons.list_alt,
      size: 30,
      color: Colors.black,
    ),
    Image.asset(width: 30, height: 30, "assets/images/twitter.png"),
    Image.asset(width: 30, height: 30, "assets/images/instagram.png")
  ];

  final _linkButton = LinkButton();

  @override
  Widget build(BuildContext context) {
    final List onTapList = [
      () => Navigator.pushNamed(context, '/store_edit'),
      () => _linkButton.launchUriWithString(context, _linkURLList[0]),
      () => _linkButton.launchUriWithString(context, _linkURLList[1]),
      () => _linkButton.launchUriWithString(context, _linkURLList[2]),
    ];
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: _labelTextList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
              title: Text(_labelTextList[index]),
              leading: _leadingWidget[index],
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 20,
              ),
              onTap: onTapList[index]);
        });

    // // Link to terms of service
    // ElevatedButton(
    //   onPressed: (){
    //     _linkButton.launchUriWithString(context, urlToTermsOfService);
    //   },
    //   child: const Text("利用規約")),
    // // Link to twitter
    // GestureDetector(
    //   onTap: (){
    //     _linkButton.launchUriWithString(context, urlToTwitter);
    //   },
    //   child: Image.asset("assets/images/icons8-twitter-50.png",),
    // ),
    // SettingList(
    //   leading: [
    //     Icon(Icons.list_alt, size: 30, color: Colors.black,),
    //     Image.asset(width: 30, height: 30, "assets/images/twitter.png"),
    //     Image.asset(width: 30, height: 30, "assets/images/instagram.png")
    //   ],
    // )
  }
}
