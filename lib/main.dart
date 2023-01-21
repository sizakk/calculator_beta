import 'package:calculator_beta/component/calculate.dart';
import 'package:calculator_beta/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // const appTitle = '피타고라스 승률 계산기';

    return MaterialApp(
      // title: appTitle,
      home: SafeArea(
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: const Scaffold(
            // appBar: AppBar(
            //   title: const Text(appTitle),
            //   centerTitle: true,
            backgroundColor: CARD_COLOR,
            // ),
            body: SingleChildScrollView(
              child: MyCustomForm(),
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({super.key});

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  final _formKey = GlobalKey<FormState>();
  int _trials = 0;
  int _wins = 0;

  double _run = 0;
  double _earedRun = 0;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'asset/img/logo_ball.jpeg',
            width: 150,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 8, 4, 8),
                  child: renderTextFormField(
                    label: '현재까지 경기 수',
                    onSaved: (value) {
                      setState(() {
                        _trials = int.parse(value!);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // return '숫자를 입력하세요';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 8, 60, 8),
                  child: renderTextFormField(
                    label: '현재까지 승 수',
                    onSaved: (value) {
                      setState(() {
                        _wins = int.parse(value!);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // return '숫자를 입력하세요';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(60, 8, 4, 8),
                  child: renderTextFormField(
                    label: '누적득점',
                    onSaved: (value) {
                      setState(() {
                        _run = double.parse(value!);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // return '숫자를 입력하세요';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(4, 8, 60, 8),
                  child: renderTextFormField(
                    label: '누적실점',
                    onSaved: (value) {
                      setState(() {
                        _earedRun = double.parse(value!);
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        // return '숫자를 입력하세요';
                      }
                      return null;
                    },
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 60.0,
            ),
            child: SizedBox(
              child: renderSubmitButton(),
              width: double.infinity,
              height: 35,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          renderStates()
        ],
      ),
    );
  }

  renderStates() {
    return Column(
      children: [
        Text(
          expPythagorean(
            run: _run,
            earedRun: _earedRun,
          ).toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ],
    );
  }

  renderSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: BACK_COLOR,
      ),
      child: const Text(
        '플레이오프 진출 확률',
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();

          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const WinRate()));

          // ScaffoldMessenger.of(context).showSnackBar(
          //   const SnackBar(content: Text('광고팝업 : 3초짜리 또는 직접 닫기')),
          // );
        }
      },
    );
  }

  renderTextFormField({
    required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 13,
                color: TEXT_COLOR,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(
            hintText: '숫자를 입력하세요',
            hintStyle: TextStyle(
              color: TEXT_COLOR,
              fontSize: 12,
            ),
          ),
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          // autovalidateMode: AutovalidateMode.always,
          onSaved: onSaved,
          validator: validator,
        ),
        const SizedBox(
          height: 10,
        )
      ],
    );
  }
}
