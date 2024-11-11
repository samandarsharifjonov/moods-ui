import '../imports.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = -1;

  void callBack(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "1 января 09:00",
          style: TextStyle(
              color: const Color.fromRGBO(188, 188, 191, 1),
              fontWeight: FontWeight.w700,
              fontSize: 18.sp),
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(CalendarPage.routName);
                  },
                  icon: Image.asset(
                    "assets/icons/calendar_button_icon.png",
                    height: 24.h,
                    width: 24.w,
                    color: const Color.fromRGBO(188, 188, 191, 1),
                  )),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            children: [
              const AnimatedButton(),
              SizedBox(
                height: 30.h,
              ),
              Row(
                children: [
                  Text(
                    "Что чувствуешь?",
                    style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w800,
                        color: const Color.fromRGBO(76, 76, 105, 1)),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              MoodWidget(selectedIndex: selectedIndex, callBack: callBack),
              if (selectedIndex == 0) const GroupButtons(),
              SizedBox(
                height: 36.h,
              ),
              Row(
                children: [
                  Text(
                    "Уровень стресса",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.sp,
                        color: const Color.fromRGBO(76, 76, 105, 1)),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const SliderWidget(
                lowText: "Низкий",
                highText: "Высокий",
              ),
              SizedBox(
                height: 36.h,
              ),
              Row(
                children: [
                  Text(
                    "Самооценка",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.sp,
                        color: const Color.fromRGBO(76, 76, 105, 1)),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const SliderWidget(
                lowText: "Неуверенность",
                highText: "Уверенность",
              ),
              SizedBox(
                height: 36.h,
              ),
              Row(
                children: [
                  Text(
                    "Заметки",
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 16.sp,
                        color: const Color.fromRGBO(76, 76, 105, 1)),
                  )
                ],
              ),
              SizedBox(
                height: 20.h,
              ),
              const InputText(),
              SizedBox(
                height: 12.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
