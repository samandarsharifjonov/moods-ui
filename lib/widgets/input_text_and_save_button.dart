import '../imports.dart';

class InputText extends StatefulWidget {
  const InputText({super.key});

  @override
  State<InputText> createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  final _globalKey = GlobalKey<FormState>();
  String? text;

  void _submit() {
    if (_globalKey.currentState!.validate()) {
      _globalKey.currentState!.save();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 90.h,
          decoration: const BoxDecoration(
              color: Color.fromRGBO(255, 255, 255, 1),
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(182, 161, 192, 0.11),
                  offset: Offset(2, 4),
                  blurRadius: 10,
                  spreadRadius: 0,
                )
              ]),
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              children: [
                Form(
                  key: _globalKey,
                  child: Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          text = value.isEmpty ? null : value;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Введите текст";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Введите заметку",
                        hintStyle: TextStyle(
                          color: const Color.fromRGBO(188, 188, 191, 1),
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 35.h,
        ),
        saveButton,
      ],
    );
  }

  ClipRRect get saveButton {
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(69.r)),
        child: Container(
          height: 44.h,
          width: double.infinity,
          decoration: BoxDecoration(
            color: text != null
                ? const Color.fromRGBO(255, 135, 2, 1)
                : const Color.fromRGBO(242, 242, 242, 1),
            borderRadius: BorderRadius.all(Radius.circular(69.r)),
          ),
          child: MaterialButton(
            onPressed: text != null ? _submit : null,
            child: Text(
              "Сохранить",
              style: TextStyle(
                color: text != null
                    ? const Color.fromRGBO(255, 255, 255, 1)
                    : const Color.fromRGBO(188, 188, 191, 1),
                fontSize: 20.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      );
  }
}
