/// FileName pie_demo
///
/// @Author yinjiangtao
/// @Date 2023/10/8 09:12
///
/// @Description Pie demo
///


import 'package:flutter/material.dart';
import 'package:flutter_echart/flutter_echart.dart';

//定义一个全局的内容主颜色
Color mainColor = const Color(0xFFCADCED);

///默认显示的首页面
class PieAnimationPage extends StatefulWidget {
  const PieAnimationPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _PieAnimationPageState();
  }

}

class _PieAnimationPageState extends State<PieAnimationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
//页面的主内容 先来个居中
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              //来个高度
              height: 260,
              //宽度填充
              width: MediaQuery.of(context).size.width,
              //设置一下背景
              color: mainColor,
              //封装一个方法构建左右排列的
              child: buildPieChatWidget(),
            ),
          ],
        ),
      ),
    );
  }

  final List<EChartPieBean> _dataList = [
    EChartPieBean(title: "生活费", number: 200, color: Colors.lightBlueAccent),
    EChartPieBean(title: "游玩费", number: 200, color: Colors.deepOrangeAccent),
    EChartPieBean(title: "交通费", number: 400, color: Colors.green),
    EChartPieBean(title: "贷款费", number: 300, color: Colors.amber),
    EChartPieBean(title: "电话费", number: 200, color: Colors.orange),
  ];

  PieChatWidget buildPieChatWidget() {
    return PieChatWidget(
      dataList: _dataList,
      //是否输出日志
      isLog: true,
      //是否需要背景
      isBackground: true,
      //是否画直线
      isLineText: true,
      //背景
      bgColor: Colors.white,
      //是否显示最前面的内容
      isFrontgText: true,
      //默认选择放大的块
      initSelect: 1,
      //初次显示以动画方式展开
      openType: OpenType.ANI,
      //旋转类型
      loopType: LoopType.AUTO_LOOP,
      //点击回调
      clickCallBack: (int value) {
        print("当前点击显示 $value");
      },
    );
  }
}