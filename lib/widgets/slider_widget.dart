import '../imports.dart';

class SliderWidget extends StatefulWidget {
  final String highText;
  final String lowText;
  const SliderWidget({super.key, required this.highText, required this.lowText});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 77.h,
      decoration:  BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: const BorderRadius.all(Radius.circular(13)),
        boxShadow: [
          BoxShadow(
              color: const Color.fromRGBO(182, 161, 192, 0.11),
              blurRadius: 10.r,
              offset: const Offset(2, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 16.h,
            ),
            const Expanded(
              child: SliderSize(),
            ),
            SizedBox(
              height: 8.h,
            ),
            const Expanded(
              child: SliderProgress(),
            ),
            SizedBox(
              height: 8.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.lowText, style: const TextStyle(color: Color.fromRGBO(145, 158, 171, 1), fontSize: 11, fontWeight: FontWeight.w400)),
                Text(widget.highText, style: const TextStyle(color: Color.fromRGBO(145, 158, 171, 1), fontSize: 11, fontWeight: FontWeight.w400)),
              ],
            ),
            SizedBox(
              height: 16.h,
            )
          ],
        ),
      ),
    );
  }
}
