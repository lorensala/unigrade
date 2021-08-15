import 'package:unigrade/data/idao.dart';

class StatisticsDao implements IDao<StatisticsDao> {
  StatisticsDao._privateConstructor();

  static final StatisticsDao instance = StatisticsDao._privateConstructor();

  @override
  Future<void> add(StatisticsDao object) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete(StatisticsDao object) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<StatisticsDao> obtain(StatisticsDao object) {
    // TODO: implement obtain
    throw UnimplementedError();
  }

  @override
  Future<void> update(StatisticsDao object) {
    // TODO: implement update
    throw UnimplementedError();
  }

  // Future<List<Map<String, dynamic>>> getData(Student _student) async {
  //   List<Map<String, dynamic>> _list = [];

  //   try {
  //     CollectionReference collRef = FirebaseFirestore.instance
  //         .collection('student')
  //         .doc(_student.getStudentDocRef())
  //         .collection('career_student')
  //         .doc(_student.getCareerDocRefs()[0])
  //         .collection('subject_student');

  //     Future<QuerySnapshot> docs = FirebaseFirestore.instance
  //         .collection(collRef.path)
  //         .where('passed', isEqualTo: true)
  //         .get();

  //     await docs.then((value) {
  //       value.docs.forEach((element) {
  //         Map<String, dynamic> _sub = element.data();

  //         if (_sub.isNotEmpty) _list.add(_sub);
  //       });
  //       print('=====succed====');
  //     });
  //   } catch (e) {
  //     print(e);
  //     print('=======error======');
  //   }
  //   return _list;
  // }
}
