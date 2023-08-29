class Hewan {
  double berat;

  // constructor
  Hewan({required this.berat});
}

class Mobil {
  double kapasitasMax;
  List<Hewan> muatan;
  double totalBebanMuatan = 0;

  // constructor
  Mobil({required this.kapasitasMax, required this.muatan}) {
    totalBebanMuatan = totalMuatan(muatan);
  }

  // method untuk menghitung beban pada mobil sekarang
  double totalMuatan(List<Hewan> hewans) {
    double beban = 0;
    for (Hewan hewan in hewans) {
      beban += hewan.berat;
    }
    return beban;
  }

  // method untuk menambahkan muatan baru jika kapasitas mencukupi
  void tambahMuatan(Hewan hewan) {
    if (kapasitasMax > totalBebanMuatan + hewan.berat) {
      muatan.add(hewan);
      totalBebanMuatan += hewan.berat;
      print("Hewan ditambahkan");
      return;
    }
    print("Kapasitas tidak cukup!");
  }
}

void main() {
  List<Hewan> muatanHewan = [
    Hewan(berat: 120),
    Hewan(berat: 55),
    Hewan(berat: 39)
  ];

  Mobil mobil1 = Mobil(kapasitasMax: 700, muatan: muatanHewan);
  print('Berat Sekarang : ${mobil1.totalBebanMuatan}');

  mobil1.tambahMuatan(Hewan(berat: 200));

  print('Berat Sekarang : ${mobil1.totalBebanMuatan}');
}
