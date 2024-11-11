import '../imports.dart';

class SliderProgress extends StatefulWidget {
  const SliderProgress({super.key});

  @override
  State<SliderProgress> createState() => _SliderProgressState();
}

class _SliderProgressState extends State<SliderProgress> {
  double _currentValue = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: _currentValue > 0
                ? const Color.fromRGBO(255, 135, 2, 1)
                : const Color.fromRGBO(225, 221, 216, 1),
            inactiveTrackColor: const Color(0xffE1DDD8),
            thumbColor: _currentValue > 0
                ? const Color.fromRGBO(255, 135, 2, 1)
                : const Color.fromRGBO(225, 221, 216, 1),
            thumbShape:  RoundSliderThumbShape(
              enabledThumbRadius: 6.r,
            ),
            overlayColor: const Color.fromRGBO(255, 221, 216, 1),
            trackHeight: 6.h,
            //trackShape: const RectangularSliderTrackShape()
          ),
          child: SizedBox(
            width: constraints.maxWidth,
            child: Slider(
              max: 100,
              value: _currentValue,
              label: _currentValue.round().toString(),
              onChanged: (value) {
                setState(() {
                  _currentValue = value;
                });
              },
            ),
          ),
        );
      },
    );
  }
}

