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
            //   backgroundColor: PRIMARY_COLOR,
            // ),
            body: SingleChildScrollView(child: MyCustomForm()),
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
            width: 100,
          ),
          renderTextFormField(
            label: '득점',
            onSaved: (value) {
              setState(() {
                _run = double.parse(value!);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '숫자를 입력하세요';
              }
              return null;
            },
          ),
          renderTextFormField(
            label: '실점',
            onSaved: (value) {
              setState(() {
                _earedRun = double.parse(value!);
              });
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '숫자를 입력하세요';
              }
              return null;
            },
          ),
          renderSubmitButton(),
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
        primary: BLUE_COLOR,
      ),
      child: const Text(
        '승률 계산',
        style: TextStyle(
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
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
        TextFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          keyboardType: TextInputType.number,
          autovalidateMode: AutovalidateMode.always,
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
