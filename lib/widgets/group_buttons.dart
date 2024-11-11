
import '../imports.dart';

class GroupButtons extends StatefulWidget {
  const GroupButtons({super.key});

  @override
  State<GroupButtons> createState() => _GroupButtonsState();
}

class _GroupButtonsState extends State<GroupButtons> {
  int currentIndex = -1;
  List<String> words = [
    "Возбуждение",
    "Восторг",
    "Игривость",
    "Наслаждение",
    "Очарование",
    "Осознанность",
    "Смелость",
    "Удовольствие",
    "Чувственность",
    "Энергичность",
    "Экстравагантность",
  ];

  Widget buttonsWidget({required String title, required int index}){
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: (){
        setState(() {
          currentIndex = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
        decoration: BoxDecoration(
          color: currentIndex == index ? const Color.fromRGBO(255, 135, 2, 1) : Colors.white,
          borderRadius: BorderRadius.circular(3),
          boxShadow: currentIndex == index ? null :  [
            BoxShadow(
              offset: const Offset(2, 4),
              blurRadius: 10.r,
              color: const Color.fromRGBO(182, 161, 192, 0.11)
            )
          ]
        ),
        child: Text(title, style: TextStyle(color: const Color.fromRGBO(76, 76, 105, 1), fontSize: 11.sp, fontWeight: FontWeight.w400 , ),),

      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 40,
        child: Wrap(
          alignment: WrapAlignment.start,
          spacing: 8, runSpacing: 8,
          children: [
            for(int i = 0; i< words.length; i++)
              buttonsWidget(title: words[i], index: i)
          ],
        ),
      ),
    );
  }
}
