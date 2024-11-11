import '../imports.dart';

class SliderSize extends StatelessWidget {
  const SliderSize({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(6,(_) => Container(
        height: 8.h,
        width: 2.w,
        decoration:  BoxDecoration(
          color: const Color(0xffE1DDD8),
          borderRadius: BorderRadius.all(Radius.circular(25.r)),
        ),
      ),),
    );
  }
}
