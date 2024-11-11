import '../imports.dart';

class AnimatedButton extends StatelessWidget {
  const AnimatedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedButtonBar(
      invertedSelection: true,
      radius: 47.0.r,
      padding: const EdgeInsets.all(16.0),
      backgroundColor: const Color.fromRGBO(242, 242, 242, 1),
      foregroundColor: const Color.fromRGBO(255, 135, 2, 1),
      elevation: 0,
      children: [
        ButtonBarEntry(
            onTap: (){},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/book_icons.png", height: 12.h, width: 12.w,
                    color: const Color(0xffBCBCBF)
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text("Дневник настроения", style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: const Color(0xffBCBCBF)
                ),)
              ],
            )),
          ButtonBarEntry(
            onTap: (){
              Navigator.of(context).pushNamed(MoodStatisticsPage.routName);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/icons/statistic_icon.png", height: 12.h, width: 12.w, color: const Color(0xffBCBCBF)
                ),
                SizedBox(
                  width: 6.w,
                ),
                Text("Статистика", style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                     color: const Color(0xffBCBCBF)
                ),)
              ],
            )),
      ],
    );
  }
}
