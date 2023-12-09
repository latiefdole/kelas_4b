class Pegawai {
  int? id;
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

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
      id: int.parse(json["id"]),
      nip: json["nip"],
      namaPegawai: json["nama"],
      email: json["email"],
      password: json["password"],
      nomorTelepon: json["nomor_telepon"],
      tanggalLahir: json["tanggal_lahir"]);
  Map<String, dynamic> toJson() => {
        "id": id.toString(),
        "nip": nip,
        "nama": namaPegawai,
        "email": email,
        "tanggal_lahir": tanggalLahir,
        "nomor_telepon": nomorTelepon,
        "password": password
      };
}
