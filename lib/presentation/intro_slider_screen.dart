import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intro_slider/intro_slider.dart';

final sliderListProvider = StateProvider<List<ContentConfig>>((ref) => []);

class IntroSliderScreen extends ConsumerWidget {
  const IntroSliderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sliderListNotifier = ref.watch(sliderListProvider.notifier);
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => const IntroSliderExampleSlidePage()));
            sliderListNotifier.state.add(
              const ContentConfig(
                  title: "HTML",
                  styleTitle: TextStyle(color: Colors.cyan, fontSize: 30),
                  description: "欲しい商品を探す",
                  styleDescription: TextStyle(color: Colors.cyan, fontSize: 20),
                  pathImage: "assets/images/waiting.png",
                  backgroundColor: Colors.white
              ),
            );
            sliderListNotifier.state.add(
              const ContentConfig(
                  title: "CSS",
                  styleTitle: TextStyle(color: Colors.cyan, fontSize: 30),
                  description: "CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/CSS/",
                  styleDescription: TextStyle(color: Colors.cyan, fontSize: 20),
                  pathImage: "assets/images/waiting.png",
                  backgroundColor: Colors.white
              ),
            );
            sliderListNotifier.state.add(
              const ContentConfig(
                title: "JavaScript",
                styleTitle: TextStyle(color: Colors.cyan, fontSize: 30),
                description: "JavaScript/JavaScript/JavaScript/JavaScript/JavaScript/JavaScript/JavaScript/JavaScript/",
                styleDescription: TextStyle(color: Colors.cyan, fontSize: 20),
                pathImage: "assets/images/waiting.png",
                backgroundColor: Colors.white,
              ),
            );
          },
          child: const Text("チュートリアル"),
        ),
      ),
    );
  }
}


class IntroSliderExampleSlidePage extends ConsumerWidget {
  const IntroSliderExampleSlidePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final slideList = ref.watch(sliderListProvider);
    return IntroSlider(
      listContentConfig: slideList,
      renderSkipBtn: const Text("スキップ"),
      renderNextBtn: const Text("次へ"),
      renderDoneBtn: renderDoneBtn(context),
    );
  }

  // Widget renderNextBtn() {
  //   return TextButton(
  //       onPressed: (){},
  //       child: const Text("NEXT"));
  // }

  Widget renderDoneBtn(BuildContext context) {
    return TextButton(
        onPressed: (){
          print("チュートリアル終了");
          Navigator.pushNamed(context, "/sign_in");
        },
        child: const Text("終了"));
  }

  Widget renderPrevBtn() {
    return TextButton(
        onPressed: (){},
        child: const Text("戻る"));
  }
}
