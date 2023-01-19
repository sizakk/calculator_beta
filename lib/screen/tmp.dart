import 'package:calculator_beta/constant/color.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  String run = '';
  String earedRun = '';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white, //PRIMARY_COLOR,
        appBar: AppBar(
          title: const Text('피타고라스 승률 계산기'),
          centerTitle: true,
          backgroundColor: RED_COLOR,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    key: _formKey,
                    children: [
                      renderTextFormField(
                        label: '득점',
                        validator: (val) {
                          if (val!.isEmpty || val!.length < 1) {
                            return '필수사항입니다.';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            run = val!;
                          });
                        },
                      ),
                      renderTextFormField(
                        label: '실점',
                        validator: (val) {
                          if (val!.isEmpty || val!.length < 1) {
                            return '필수사항입니다.';
                          }
                          return null;
                        },
                        onSaved: (val) {
                          setState(() {
                            earedRun = val!;
                          });
                        },
                      ),
                      renderSubmitButton(),
                      renderStates(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  renderStates() {
    return Column(
      children: [
        Text(
          'R : $run',
          style: const TextStyle(color: Colors.black),
        ),
        Text(
          'ER : $earedRun',
          style: const TextStyle(color: Colors.black),
        )
      ],
    );
  }

  renderSubmitButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: BLUE_COLOR,
      ),
      child: const Text(
        '계산하기',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState!.save();
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) => const WinRate()));
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
