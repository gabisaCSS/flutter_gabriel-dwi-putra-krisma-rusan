class Course {
  String judul, deskripsi;

  //constructor
  Course({required this.judul, required this.deskripsi});
}

class Student {
  String nama, kelas;
  List<Course> courseList;

  // constructor
  Student({required this.nama, required this.kelas, required this.courseList});

  // method untuk menambahkan course
  void tambahCourse(Course course) {
    print('Course baru telah ditambahkan!');
    courseList.add(course);
  }

  // method untuk menghapus course berdasarkan judul course
  void hapusCourse(String judul) {
    for (var i = 0; i < courseList.length; i++) {
      if (courseList[i].judul.toLowerCase() == judul.toLowerCase()) {
        courseList.removeAt(i);
        print('Course dengan judul $judul telah dihapus dari list!');
        return;
      }
    }
    print('Course dengan judul $judul tidak ada! Tidak bisa menghapus!');
  }

  // method untuk menampilkan semua course
  void tampilkanCourse() {
    print('Nama Siswa  : $nama');
    print('Kelas       : $kelas');
    print('List Course : ');
    courseList.asMap().forEach((index, course) {
      print('''Course ${index + 1} 
      Judul     : ${course.judul}
      Deskripsi : ${course.deskripsi}''');
    });
  }
}

void main() {
  List<Course> courseList = [
    Course(judul: 'Data Science', deskripsi: 'Ngitung-ngitung dan analisis'),
    Course(judul: 'Machine Learning', deskripsi: 'Mining dan Bersihin data')
  ];

  Student student =
      Student(nama: 'Gabriel', kelas: '10 IPS', courseList: courseList);

  student.tampilkanCourse();
  print('');

  student.tambahCourse(Course(judul: 'Flutter', deskripsi: 'Front end mobile'));

  print('');
  student.tampilkanCourse();
  print('');

  student.hapusCourse('data science');

  print('');
  student.tampilkanCourse();
}
