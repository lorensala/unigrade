class Grade {
  final int grade;

  Grade({required this.grade});

  bool get passed => grade >= 6;
}
