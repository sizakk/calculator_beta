import 'package:calculator_beta/constant/color.dart';
import 'package:calculator_beta/screen/result_rate.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
                height: 100,
              ),
              const _Body(),
              _Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  State<_Body> createState() => __BodyState();
}

class __BodyState extends State<_Body> {
  final _formKey = GlobalKey<FormState>();

  final _runController = TextEditingController();
  final _earnedRunController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '득점 수',
                  ),
                  controller: _runController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '득점을 입력하세요';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 50,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    hintText: '실점 수',
                  ),
                  controller: _earnedRunController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return '실점을 입력하세요';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  final _runController = TextEditingController();
  final _earnedRunController = TextEditingController();

  _Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(0, 50),
          primary: BLUE_COLOR,
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => WinRate(
                          runs: int.parse(_runController.text.trim()),
                          earendRuns:
                              int.parse(_earnedRunController.text.trim()),
                        )));
          }
        },
        child: const Text(
          '승률 계산하기',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'sunflower',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
