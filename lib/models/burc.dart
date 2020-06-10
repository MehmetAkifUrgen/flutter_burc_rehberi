class Burc{
  String _burcAdi;
  String _burcTarihi;
  String _burcDetay;
  String _kucukResim;
  String _buyukResim;

  Burc(this._burcAdi, this._burcTarihi, this._burcDetay, this._kucukResim,
      this._buyukResim);

  String get buyukResim => _buyukResim;

  set buyukResim(String value) {
    _buyukResim = value;
  }

  String get kucukResim => _kucukResim;

  set kucukResim(String value) {
    _kucukResim = value;
  }

  String get burcDetay => _burcDetay;

  set burcDetay(String value) {
    _burcDetay = value;
  }

  String get burcTarihi => _burcTarihi;

  set burcTarihi(String value) {
    _burcTarihi = value;
  }

  String get burcAdi => _burcAdi;

  set burcAdi(String value) {
    _burcAdi = value;
  }


}