import '../imports.dart';

class MoodWidget extends StatelessWidget {
  final void Function(int index) callBack;
  final int selectedIndex;
   MoodWidget({super.key, required this.callBack, required this.selectedIndex});
   final _moods = Moods();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 118.h,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _moods.list.length,
        itemBuilder: (context, index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            onTap: () {
              callBack(index);
            },
            child: Container(
              height: 118.h,
              width: 83.w,
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(76.r),
                border: Border.all(
                  color: isSelected
                      ? const Color.fromRGBO(255, 135, 2, 1)
                      : Colors.transparent,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromRGBO(182, 161, 192, 0.11),
                    blurRadius: 10.8,
                    spreadRadius: 2,
                    offset: Offset(2, 4),
                  ),
                ],
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(_moods.list[index].img,
                      width: 53.w, height: 50.h),
                  Text(
                    _moods.list[index].title,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 11.sp,
                        color: const Color.fromRGBO(76, 76, 105, 1)),
                  ),
                ],
              )),
            ),
          );
        },
      ),
    );
  }
}


