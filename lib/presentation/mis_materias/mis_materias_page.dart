import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:unigrade/presentation/widgets/back_button.dart';
import 'package:unigrade/presentation/widgets/line_painter.dart';

class MisMateriasPage extends StatelessWidget {
  const MisMateriasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            width: context.width,
            height: context.height,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
            child: Column(children: const <Widget>[
              CustomBackButton(),
              SizedBox(height: 20),
              _CustomTitle(),
              SizedBox(height: 15),
              _SearchBar(),
              SizedBox(height: 15),
              _SubjectsListView()
            ]),
          ),
        ),
      ),
    );
  }
}

class _SubjectsListView extends StatelessWidget {
  const _SubjectsListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: 10,
          itemExtent: 140,
          itemBuilder: (BuildContext context, int index) => Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26.0),
                  color: const Color(0xffb3a5ef),
                ),
              )),
    );
  }
}

class _SearchBar extends StatelessWidget {
  const _SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26.0),
        color: const Color(0xfff7f7f7),
      ),
    );
  }
}

class _CustomTitle extends StatelessWidget {
  const _CustomTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Mis Materias',
            style: TextStyle(
              fontFamily: 'Avenir LT Std',
              fontSize: 30,
              color: Color(0xff000000),
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        SizedBox(height: 8),
        Align(
          alignment: Alignment.centerLeft,
          child: SizedBox(
            height: 5,
            width: 200,
            child: CustomPaint(
              painter: LinePainter(
                  strokeWidth: 5,
                  color: Color(0xFF4CACFF),
                  dashWidth: 3,
                  dashSpace: 0,
                  direction: Direction.Horizontal),
            ),
          ),
        ),
      ],
    );
  }
}
