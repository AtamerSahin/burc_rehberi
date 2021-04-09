class Horoscope {
  String _horoscopeName;
  String _horoscopeDate;
  String _horoscopeDetail;
  String _horoscopeSmallSizeImg;
  String _horoscopeBigSizeImg;

  Horoscope(
    this._horoscopeName,
    this._horoscopeDate,
    this._horoscopeDetail,
    this._horoscopeSmallSizeImg,
    this._horoscopeBigSizeImg,
  );

  
  get horoscopeName => this._horoscopeName;

 set horoscopeName( value) => this._horoscopeName = value;

  get horoscopeDate => this._horoscopeDate;

 set horoscopeDate( value) => this._horoscopeDate = value;

  get horoscopeDetail => this._horoscopeDetail;

 set horoscopeDetail( value) => this._horoscopeDetail = value;

  get horoscopeSmallSizeImg => this._horoscopeSmallSizeImg;

 set horoscopeSmallSizeImg( value) => this._horoscopeSmallSizeImg = value;

  get horoscopeBigSizeImg => this._horoscopeBigSizeImg;

 set horoscopeBigSizeImg( value) => this._horoscopeBigSizeImg = value;
  
}
