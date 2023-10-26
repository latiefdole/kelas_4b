class Pegawai {
  String? id;
  String namaPegawai;
  String? nip;
  String tanggalLahir;
  String nomorTelepon;
  String email;
  String? password;
  Pegawai(
      {this.id,
      this.nip,
      required this.namaPegawai,
      required this.tanggalLahir,
      required this.nomorTelepon,
      required this.email,
      this.password});
}
