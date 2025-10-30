//KELAS ABSTRAK TRANSPORTASI
abstract class Transportasi {
  String id, nama;
  double _tarifDasar;
  int kapasitas;
  //constructor
  Transportasi(this.id, this.nama, this._tarifDasar, this.kapasitas);
  //getter
  double get tarifDasar => _tarifDasar;
  //method abtrak
  double hitungTarif(int jumlahPenumpang);
}

//KELAS TAKSI
class Taksi extends Transportasi {
  double jarak;
  //constuctor dengan super
  Taksi(super.id, super.nama, super.tarifDasar, super.kapasitas, this.jarak);
  @override
  double hitungTarif(int j) => tarifDasar * jarak;
}

//KELAS BUS
class Bus extends Transportasi {
  bool adaWifi;
  //constructor
  Bus(super.id, super.nama, super._tarifDasar, super.kapasitas, this.adaWifi);
  @override
  double hitungTarif(int j) => (tarifDasar * j) + (adaWifi ? 5000 : 0);
}

//KELAS PESAWAT
class Pesawat extends Transportasi {
  String kelas;
  Pesawat(super.id, super.nama, super._tarifDasar, super.kapasitas, this.kelas);
  @override
  double hitungTarif(int j) => tarifDasar * j * (kelas == "Bisnis" ? 1.5 : 1.0);
}

//KELAS PEMESANAN
class Pemesanan {
  String idPemesanan, namaPelanggan;
  Transportasi t;
  int jumlahPenumpang;
  double total;

  Pemesanan(
    this.idPemesanan,
    this.namaPelanggan,
    this.t,
    this.jumlahPenumpang,
    this.total,
  );
  //method mencetak struk ke layar
  void cetakStruk() => print(
    "$idPemesanan | ${t.nama} | $namaPelanggan | penumpang;$idPemesanan | Total: Rp${total.toStringAsFixed(0)}",
  );
}

//FUNGSI GLOBAL (buatpemesanan)
Pemesanan buatPemesanan(Transportasi t, String nama, int j, String id) =>
    Pemesanan(id, nama, t, j, t.hitungTarif(j));
//FUNGSI GLOBAL (tampil semua)

void tampilSemua(List<Pemesanan> List) {
  print("\n ==== Riwayat Pemesanan");
  for (var p in List) p.cetakStruk();
}

//FUNGSI MAIN
void main() {
  var taksi = Taksi("T01", "taksi Blue Bird", 5000, 4, 10);
  var bus = Bus("B001", "BUS TRANS BANDUNG", 3500, 40, true);
  var pesawat = Pesawat("P001", "LION AIR", 3500000, 100, "Bisnis");

  //daftar
  var daftar = [
    buatPemesanan(taksi, "Salsabilah", 1, "PNM001"),
    buatPemesanan(bus, "IF@", 5, "PNM002"),
    buatPemesanan(pesawat, "akt 23", 10, "PNM003"),
  ];
  tampilSemua(daftar);
}
