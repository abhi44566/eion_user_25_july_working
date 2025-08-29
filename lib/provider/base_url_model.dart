class BaseUrlModel {
  BaseUrlModel({
      Response? response,}){
    _response = response;
}

  BaseUrlModel.fromJson(dynamic json) {
    _response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? _response;
BaseUrlModel copyWith({Response? response,
}) => BaseUrlModel(  response: response ?? _response,
);
  Response? get response => _response;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_response != null) {
      map['response'] = _response?.toJson();
    }
    return map;
  }
}

class Response {
  Response({
      String? status, 
      String? message, 
      String? abcd, 
      String? dcba, 
      String? ue8n20, 
      String? e8k7sz, 
      String? tc9sp, 
      String? ty5x3k, 
      String? x3k44v, 
      String? z9w2q8, 
      String? w2qy2x, 
      String? poe8k, 
      String? e7szt3, 
      String? l21ty5, 
      String? ke5a21, 
      String? g5e1up, 
      String? z5a2w1q, 
      String? zw1qw2q, 
      String? fpn21, 
      String? tpcp1, 
      String? lpozm, 
      String? ww7qapd, 
      String? r3l7z9, 
      String? y2x5f3, 
      String? ja1r11m, 
      String? ha1num, 
      String? na2uva, 
      String? mu2taj, 
      String? r1tab3, 
      String? ab3xz4, 
      String? x4s3h5, 
      String? mqc9p, 
      String? s3w9qb, 
      String? w9qbs6, 
      String? bs62jp, 
      String? l4t8p, 
      String? tan4z, 
      String? mk34k, 
      String? d2m8l, 
      String? t3tkfz, 
      String? m3dfz, 
      String? dr9lz, 
      String? lz9t25, 
      String? n7q4z, 
      String? d3t3m, 
      String? znx3d, 
      String? umt2x, 
      String? dmd2n, 
      String? fqa2e, 
      String? bci4k, 
      String? l6kpe, 
      String? tcv2x, 
      String? f2flp, 
      String? stld3, 
      String? vcs9l, 
      String? tv9lg, 
      String? kf2nq, 
      String? blw4t, 
      String? gped9, 
      String? al45p, 
      String? npk39, 
      String? hw9tu, 
      String? ur4e2, 
      String? f9tcv, 
      String? dth9p, 
      String? hv9pd, 
      String? tc45m, 
      String? bua9t, 
      String? t9yt4r, 
      String? tp34l, 
      String? t9mtv, 
      String? dt7c9, 
      String? t6rpg, 
      String? up9al, 
      String? m4kvr, 
      String? fg45u, 
      String? uk7un, 
      String? tuv7p, 
      String? dtc6b, 
      String? tv9bp, 
      String? xm35t, 
      String? upy4k, 
      String? atsv9, 
      String? tkr7m, 
      String? atsv910, 
      String? xx9820, 
      String? vrn, 
      String? updt, 
      String? newversion, 
      String? lastupdateon, 
      String? messageupdate, 
      String? s2fpk2, 
      String? uchp9, 
      String? s2fpk, 
      String? ja60o, 
      String? hl2cz, 
      String? t8lxur, 
      String? t8lxur2, 
      String? t20kbg, 
      String? t20kbg01, 
      String? cwesk, 
      String? g7140, 
      String? t8xqyt, 
      String? kdfkd49, 
      String? ytsxk, 
      String? t5f1t4, 
      String? yjnet, 
      String? lngkr, 
      String? av15m, 
      String? t3oz4q, 
      String? t0y8kf, 
      String? xx8722, 
      String? xx8723, 
      String? xx8724, 
      String? xx8725, 
      String? xxcmb8726, 
      String? xxgm8727, 
      String? xxghlt8728, 
      String? xxhgr8729, 
      String? xxhco8730, 
      String? r9d4p7m, 
      String? xxccb8731, 
      String? xxgcb8732, 
      String? xxgvasc8733, 
      String? xxgrssc8734, 
      String? xxgric8735, 
      String? xxrscrc8736, 
      String? xxbcc8737, 
      String? xxbcr8738, 
      String? xxecc8739, 
      String? xxecrc8740, 
      String? xxgcc8741, 
      String? xxggjlc8742, 
      String? xxgilc8743, 
      String? xxfcc8744, 
      String? xxfcic8745, 
      String? xxfcrc8746, 
      String? xxfcrc8756, 
      String? xxfgvdl8757, 
      String? xxfgvc8758, 
      String? xxfgpvw8759, 
      String? xxfsga8760, 
      String? xxfsga8761, 
      String? xxord8762, 
      String? xxordh8763, 
      String? xxords8764, 
      String? xxordd8765, 
      String? xxordm8766, 
      String? xxordos8767, 
      String? xxhpdl8768, 
      String? xxhpdl8769, 
      String? xxhpdl8771, 
      String? xxfsoh8774, 
      String? xxfsoh8775, 
      String? xxfsoh8776, 
      String? xxfsoh8777, 
      String? xxfsoh8778, 
      String? xxfsoh8779, 
      String? xxfsoh8780, 
      String? xxfsoh8781, 
      String? xxfsoh8782, 
      String? xxfsoh8783, 
      String? xxfsoh8784, 
      String? xxfsoh8785, 
      String? xxfsoh8786, 
      String? xxfsoh8787, 
      String? xxfsoh8788, 
      String? xxfsoh8789, 
      String? xxfsoh8790, 
      String? xxfsoh8791, 
      String? xxfsoh8792, 
      String? xxfsoh8793,}){
    _status = status;
    _message = message;
    _abcd = abcd;
    _dcba = dcba;
    _ue8n20 = ue8n20;
    _e8k7sz = e8k7sz;
    _tc9sp = tc9sp;
    _ty5x3k = ty5x3k;
    _x3k44v = x3k44v;
    _z9w2q8 = z9w2q8;
    _w2qy2x = w2qy2x;
    _poe8k = poe8k;
    _e7szt3 = e7szt3;
    _l21ty5 = l21ty5;
    _ke5a21 = ke5a21;
    _g5e1up = g5e1up;
    _z5a2w1q = z5a2w1q;
    _zw1qw2q = zw1qw2q;
    _fpn21 = fpn21;
    _tpcp1 = tpcp1;
    _lpozm = lpozm;
    _ww7qapd = ww7qapd;
    _r3l7z9 = r3l7z9;
    _y2x5f3 = y2x5f3;
    _ja1r11m = ja1r11m;
    _ha1num = ha1num;
    _na2uva = na2uva;
    _mu2taj = mu2taj;
    _r1tab3 = r1tab3;
    _ab3xz4 = ab3xz4;
    _x4s3h5 = x4s3h5;
    _mqc9p = mqc9p;
    _s3w9qb = s3w9qb;
    _w9qbs6 = w9qbs6;
    _bs62jp = bs62jp;
    _l4t8p = l4t8p;
    _tan4z = tan4z;
    _mk34k = mk34k;
    _d2m8l = d2m8l;
    _t3tkfz = t3tkfz;
    _m3dfz = m3dfz;
    _dr9lz = dr9lz;
    _lz9t25 = lz9t25;
    _n7q4z = n7q4z;
    _d3t3m = d3t3m;
    _znx3d = znx3d;
    _umt2x = umt2x;
    _dmd2n = dmd2n;
    _fqa2e = fqa2e;
    _bci4k = bci4k;
    _l6kpe = l6kpe;
    _tcv2x = tcv2x;
    _f2flp = f2flp;
    _stld3 = stld3;
    _vcs9l = vcs9l;
    _tv9lg = tv9lg;
    _kf2nq = kf2nq;
    _blw4t = blw4t;
    _gped9 = gped9;
    _al45p = al45p;
    _npk39 = npk39;
    _hw9tu = hw9tu;
    _ur4e2 = ur4e2;
    _f9tcv = f9tcv;
    _dth9p = dth9p;
    _hv9pd = hv9pd;
    _tc45m = tc45m;
    _bua9t = bua9t;
    _t9yt4r = t9yt4r;
    _tp34l = tp34l;
    _t9mtv = t9mtv;
    _dt7c9 = dt7c9;
    _t6rpg = t6rpg;
    _up9al = up9al;
    _m4kvr = m4kvr;
    _fg45u = fg45u;
    _uk7un = uk7un;
    _tuv7p = tuv7p;
    _dtc6b = dtc6b;
    _tv9bp = tv9bp;
    _xm35t = xm35t;
    _upy4k = upy4k;
    _atsv9 = atsv9;
    _tkr7m = tkr7m;
    _atsv910 = atsv910;
    _xx9820 = xx9820;
    _vrn = vrn;
    _updt = updt;
    _newversion = newversion;
    _lastupdateon = lastupdateon;
    _messageupdate = messageupdate;
    _s2fpk2 = s2fpk2;
    _uchp9 = uchp9;
    _s2fpk = s2fpk;
    _ja60o = ja60o;
    _hl2cz = hl2cz;
    _t8lxur = t8lxur;
    _t8lxur2 = t8lxur2;
    _t20kbg = t20kbg;
    _t20kbg01 = t20kbg01;
    _cwesk = cwesk;
    _g7140 = g7140;
    _t8xqyt = t8xqyt;
    _kdfkd49 = kdfkd49;
    _ytsxk = ytsxk;
    _t5f1t4 = t5f1t4;
    _yjnet = yjnet;
    _lngkr = lngkr;
    _av15m = av15m;
    _t3oz4q = t3oz4q;
    _t0y8kf = t0y8kf;
    _xx8722 = xx8722;
    _xx8723 = xx8723;
    _xx8724 = xx8724;
    _xx8725 = xx8725;
    _xxcmb8726 = xxcmb8726;
    _xxgm8727 = xxgm8727;
    _xxghlt8728 = xxghlt8728;
    _xxhgr8729 = xxhgr8729;
    _xxhco8730 = xxhco8730;
    _r9d4p7m = r9d4p7m;
    _xxccb8731 = xxccb8731;
    _xxgcb8732 = xxgcb8732;
    _xxgvasc8733 = xxgvasc8733;
    _xxgrssc8734 = xxgrssc8734;
    _xxgric8735 = xxgric8735;
    _xxrscrc8736 = xxrscrc8736;
    _xxbcc8737 = xxbcc8737;
    _xxbcr8738 = xxbcr8738;
    _xxecc8739 = xxecc8739;
    _xxecrc8740 = xxecrc8740;
    _xxgcc8741 = xxgcc8741;
    _xxggjlc8742 = xxggjlc8742;
    _xxgilc8743 = xxgilc8743;
    _xxfcc8744 = xxfcc8744;
    _xxfcic8745 = xxfcic8745;
    _xxfcrc8746 = xxfcrc8746;
    _xxfcrc8756 = xxfcrc8756;
    _xxfgvdl8757 = xxfgvdl8757;
    _xxfgvc8758 = xxfgvc8758;
    _xxfgpvw8759 = xxfgpvw8759;
    _xxfsga8760 = xxfsga8760;
    _xxfsga8761 = xxfsga8761;
    _xxord8762 = xxord8762;
    _xxordh8763 = xxordh8763;
    _xxords8764 = xxords8764;
    _xxordd8765 = xxordd8765;
    _xxordm8766 = xxordm8766;
    _xxordos8767 = xxordos8767;
    _xxhpdl8768 = xxhpdl8768;
    _xxhpdl8769 = xxhpdl8769;
    _xxhpdl8771 = xxhpdl8771;
    _xxfsoh8774 = xxfsoh8774;
    _xxfsoh8775 = xxfsoh8775;
    _xxfsoh8776 = xxfsoh8776;
    _xxfsoh8777 = xxfsoh8777;
    _xxfsoh8778 = xxfsoh8778;
    _xxfsoh8779 = xxfsoh8779;
    _xxfsoh8780 = xxfsoh8780;
    _xxfsoh8781 = xxfsoh8781;
    _xxfsoh8782 = xxfsoh8782;
    _xxfsoh8783 = xxfsoh8783;
    _xxfsoh8784 = xxfsoh8784;
    _xxfsoh8785 = xxfsoh8785;
    _xxfsoh8786 = xxfsoh8786;
    _xxfsoh8787 = xxfsoh8787;
    _xxfsoh8788 = xxfsoh8788;
    _xxfsoh8789 = xxfsoh8789;
    _xxfsoh8790 = xxfsoh8790;
    _xxfsoh8791 = xxfsoh8791;
    _xxfsoh8792 = xxfsoh8792;
    _xxfsoh8793 = xxfsoh8793;
}

  Response.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _abcd = json['abcd'];
    _dcba = json['dcba'];
    _ue8n20 = json['UE8N20'];
    _e8k7sz = json['E8K7SZ'];
    _tc9sp = json['TC9SP'];
    _ty5x3k = json['TY5X3K'];
    _x3k44v = json['X3K44V'];
    _z9w2q8 = json['Z9W2Q8'];
    _w2qy2x = json['W2QY2X'];
    _poe8k = json['POE8K'];
    _e7szt3 = json['E7SZT3'];
    _l21ty5 = json['L21TY5'];
    _ke5a21 = json['KE5A21'];
    _g5e1up = json['G5E1UP'];
    _z5a2w1q = json['Z5A2W1Q'];
    _zw1qw2q = json['ZW1QW2Q'];
    _fpn21 = json['FPN21'];
    _tpcp1 = json['TPCP1'];
    _lpozm = json['LPOZM'];
    _ww7qapd = json['WW7QAPD'];
    _r3l7z9 = json['R3L7Z9'];
    _y2x5f3 = json['Y2X5F3'];
    _ja1r11m = json['JA1R11M'];
    _ha1num = json['HA1NUM'];
    _na2uva = json['NA2UVA'];
    _mu2taj = json['MU2TAJ'];
    _r1tab3 = json['R1TAB3'];
    _ab3xz4 = json['AB3XZ4'];
    _x4s3h5 = json['X4S3H5'];
    _mqc9p = json['MQC9P'];
    _s3w9qb = json['S3W9QB'];
    _w9qbs6 = json['W9QBS6'];
    _bs62jp = json['BS62JP'];
    _l4t8p = json['L4T8P'];
    _tan4z = json['TAN4Z'];
    _mk34k = json['MK34K'];
    _d2m8l = json['D2M8L'];
    _t3tkfz = json['T3TKFZ'];
    _m3dfz = json['M3DFZ'];
    _dr9lz = json['DR9LZ'];
    _lz9t25 = json['LZ9T25'];
    _n7q4z = json['N7Q4Z'];
    _d3t3m = json['D3T3M'];
    _znx3d = json['ZNX3D'];
    _umt2x = json['UMT2X'];
    _dmd2n = json['DMD2N'];
    _fqa2e = json['FQA2E'];
    _bci4k = json['BCI4K'];
    _l6kpe = json['L6KPE'];
    _tcv2x = json['TCV2X'];
    _f2flp = json['F2FLP'];
    _stld3 = json['STLD3'];
    _vcs9l = json['VCS9L'];
    _tv9lg = json['TV9LG'];
    _kf2nq = json['KF2NQ'];
    _blw4t = json['BLW4T'];
    _gped9 = json['GPED9'];
    _al45p = json['AL45P'];
    _npk39 = json['NPK39'];
    _hw9tu = json['HW9TU'];
    _ur4e2 = json['UR4E2'];
    _f9tcv = json['F9TCV'];
    _dth9p = json['DTH9P'];
    _hv9pd = json['HV9PD'];
    _tc45m = json['TC45M'];
    _bua9t = json['BUA9T'];
    _t9yt4r = json['T9YT4R'];
    _tp34l = json['TP34L'];
    _t9mtv = json['T9MTV'];
    _dt7c9 = json['DT7C9'];
    _t6rpg = json['T6RPG'];
    _up9al = json['UP9AL'];
    _m4kvr = json['M4KVR'];
    _fg45u = json['FG45U'];
    _uk7un = json['UK7UN'];
    _tuv7p = json['TUV7P'];
    _dtc6b = json['DTC6B'];
    _tv9bp = json['TV9BP'];
    _xm35t = json['XM35T'];
    _upy4k = json['UPY4K'];
    _atsv9 = json['ATSV9'];
    _tkr7m = json['TKR7M'];
    _atsv910 = json['ATSV910'];
    _xx9820 = json['xx9820'];
    _vrn = json['VRN'];
    _updt = json['UPDT'];
    _newversion = json['newversion'];
    _lastupdateon = json['Lastupdateon'];
    _messageupdate = json['messageupdate'];
    _s2fpk2 = json['S2FPK2'];
    _uchp9 = json['UCHP9'];
    _s2fpk = json['S2FPK'];
    _ja60o = json['JA60O'];
    _hl2cz = json['HL2CZ'];
    _t8lxur = json['T8LXUR'];
    _t8lxur2 = json['T8LXUR2'];
    _t20kbg = json['T20KBG'];
    _t20kbg01 = json['T20KBG01'];
    _cwesk = json['CWESK'];
    _g7140 = json['G7140'];
    _t8xqyt = json['T8XQYT'];
    _kdfkd49 = json['KDFKD49'];
    _ytsxk = json['YTSXK'];
    _t5f1t4 = json['T5F1T4'];
    _yjnet = json['YJNET'];
    _lngkr = json['LNGKR'];
    _av15m = json['AV15M'];
    _t3oz4q = json['T3OZ4Q'];
    _t0y8kf = json['T0Y8KF'];
    _xx8722 = json['xx8722'];
    _xx8723 = json['xx8723'];
    _xx8724 = json['xx8724'];
    _xx8725 = json['xx8725'];
    _xxcmb8726 = json['xxcmb8726'];
    _xxgm8727 = json['xxgm8727'];
    _xxghlt8728 = json['xxghlt8728'];
    _xxhgr8729 = json['xxhgr8729'];
    _xxhco8730 = json['xxhco8730'];
    _r9d4p7m = json['R9D4P7M'];
    _xxccb8731 = json['xxccb8731'];
    _xxgcb8732 = json['xxgcb8732'];
    _xxgvasc8733 = json['xxgvasc8733'];
    _xxgrssc8734 = json['xxgrssc8734'];
    _xxgric8735 = json['xxgric8735'];
    _xxrscrc8736 = json['xxrscrc8736'];
    _xxbcc8737 = json['xxbcc8737'];
    _xxbcr8738 = json['xxbcr8738'];
    _xxecc8739 = json['xxecc8739'];
    _xxecrc8740 = json['xxecrc8740'];
    _xxgcc8741 = json['xxgcc8741'];
    _xxggjlc8742 = json['xxggjlc8742'];
    _xxgilc8743 = json['xxgilc8743'];
    _xxfcc8744 = json['xxfcc8744'];
    _xxfcic8745 = json['xxfcic8745'];
    _xxfcrc8746 = json['xxfcrc8746'];
    _xxfcrc8756 = json['xxfcrc8756'];
    _xxfgvdl8757 = json['xxfgvdl8757'];
    _xxfgvc8758 = json['xxfgvc8758'];
    _xxfgpvw8759 = json['xxfgpvw8759'];
    _xxfsga8760 = json['xxfsga8760'];
    _xxfsga8761 = json['xxfsga8761'];
    _xxord8762 = json['xxord8762'];
    _xxordh8763 = json['xxordh8763'];
    _xxords8764 = json['xxords8764'];
    _xxordd8765 = json['xxordd8765'];
    _xxordm8766 = json['xxordm8766'];
    _xxordos8767 = json['xxordos8767'];
    _xxhpdl8768 = json['xxhpdl8768'];
    _xxhpdl8769 = json['xxhpdl8769'];
    _xxhpdl8771 = json['xxhpdl8771'];
    _xxfsoh8774 = json['xxfsoh8774'];
    _xxfsoh8775 = json['xxfsoh8775'];
    _xxfsoh8776 = json['xxfsoh8776'];
    _xxfsoh8777 = json['xxfsoh8777'];
    _xxfsoh8778 = json['xxfsoh8778'];
    _xxfsoh8779 = json['xxfsoh8779'];
    _xxfsoh8780 = json['xxfsoh8780'];
    _xxfsoh8781 = json['xxfsoh8781'];
    _xxfsoh8782 = json['xxfsoh8782'];
    _xxfsoh8783 = json['xxfsoh8783'];
    _xxfsoh8784 = json['xxfsoh8784'];
    _xxfsoh8785 = json['xxfsoh8785'];
    _xxfsoh8786 = json['xxfsoh8786'];
    _xxfsoh8787 = json['xxfsoh8787'];
    _xxfsoh8788 = json['xxfsoh8788'];
    _xxfsoh8789 = json['xxfsoh8789'];
    _xxfsoh8790 = json['xxfsoh8790'];
    _xxfsoh8791 = json['xxfsoh8791'];
    _xxfsoh8792 = json['xxfsoh8792'];
    _xxfsoh8793 = json['xxfsoh8793'];
  }
  String? _status;
  String? _message;
  String? _abcd;
  String? _dcba;
  String? _ue8n20;
  String? _e8k7sz;
  String? _tc9sp;
  String? _ty5x3k;
  String? _x3k44v;
  String? _z9w2q8;
  String? _w2qy2x;
  String? _poe8k;
  String? _e7szt3;
  String? _l21ty5;
  String? _ke5a21;
  String? _g5e1up;
  String? _z5a2w1q;
  String? _zw1qw2q;
  String? _fpn21;
  String? _tpcp1;
  String? _lpozm;
  String? _ww7qapd;
  String? _r3l7z9;
  String? _y2x5f3;
  String? _ja1r11m;
  String? _ha1num;
  String? _na2uva;
  String? _mu2taj;
  String? _r1tab3;
  String? _ab3xz4;
  String? _x4s3h5;
  String? _mqc9p;
  String? _s3w9qb;
  String? _w9qbs6;
  String? _bs62jp;
  String? _l4t8p;
  String? _tan4z;
  String? _mk34k;
  String? _d2m8l;
  String? _t3tkfz;
  String? _m3dfz;
  String? _dr9lz;
  String? _lz9t25;
  String? _n7q4z;
  String? _d3t3m;
  String? _znx3d;
  String? _umt2x;
  String? _dmd2n;
  String? _fqa2e;
  String? _bci4k;
  String? _l6kpe;
  String? _tcv2x;
  String? _f2flp;
  String? _stld3;
  String? _vcs9l;
  String? _tv9lg;
  String? _kf2nq;
  String? _blw4t;
  String? _gped9;
  String? _al45p;
  String? _npk39;
  String? _hw9tu;
  String? _ur4e2;
  String? _f9tcv;
  String? _dth9p;
  String? _hv9pd;
  String? _tc45m;
  String? _bua9t;
  String? _t9yt4r;
  String? _tp34l;
  String? _t9mtv;
  String? _dt7c9;
  String? _t6rpg;
  String? _up9al;
  String? _m4kvr;
  String? _fg45u;
  String? _uk7un;
  String? _tuv7p;
  String? _dtc6b;
  String? _tv9bp;
  String? _xm35t;
  String? _upy4k;
  String? _atsv9;
  String? _tkr7m;
  String? _atsv910;
  String? _xx9820;
  String? _vrn;
  String? _updt;
  String? _newversion;
  String? _lastupdateon;
  String? _messageupdate;
  String? _s2fpk2;
  String? _uchp9;
  String? _s2fpk;
  String? _ja60o;
  String? _hl2cz;
  String? _t8lxur;
  String? _t8lxur2;
  String? _t20kbg;
  String? _t20kbg01;
  String? _cwesk;
  String? _g7140;
  String? _t8xqyt;
  String? _kdfkd49;
  String? _ytsxk;
  String? _t5f1t4;
  String? _yjnet;
  String? _lngkr;
  String? _av15m;
  String? _t3oz4q;
  String? _t0y8kf;
  String? _xx8722;
  String? _xx8723;
  String? _xx8724;
  String? _xx8725;
  String? _xxcmb8726;
  String? _xxgm8727;
  String? _xxghlt8728;
  String? _xxhgr8729;
  String? _xxhco8730;
  String? _r9d4p7m;
  String? _xxccb8731;
  String? _xxgcb8732;
  String? _xxgvasc8733;
  String? _xxgrssc8734;
  String? _xxgric8735;
  String? _xxrscrc8736;
  String? _xxbcc8737;
  String? _xxbcr8738;
  String? _xxecc8739;
  String? _xxecrc8740;
  String? _xxgcc8741;
  String? _xxggjlc8742;
  String? _xxgilc8743;
  String? _xxfcc8744;
  String? _xxfcic8745;
  String? _xxfcrc8746;
  String? _xxfcrc8756;
  String? _xxfgvdl8757;
  String? _xxfgvc8758;
  String? _xxfgpvw8759;
  String? _xxfsga8760;
  String? _xxfsga8761;
  String? _xxord8762;
  String? _xxordh8763;
  String? _xxords8764;
  String? _xxordd8765;
  String? _xxordm8766;
  String? _xxordos8767;
  String? _xxhpdl8768;
  String? _xxhpdl8769;
  String? _xxhpdl8771;
  String? _xxfsoh8774;
  String? _xxfsoh8775;
  String? _xxfsoh8776;
  String? _xxfsoh8777;
  String? _xxfsoh8778;
  String? _xxfsoh8779;
  String? _xxfsoh8780;
  String? _xxfsoh8781;
  String? _xxfsoh8782;
  String? _xxfsoh8783;
  String? _xxfsoh8784;
  String? _xxfsoh8785;
  String? _xxfsoh8786;
  String? _xxfsoh8787;
  String? _xxfsoh8788;
  String? _xxfsoh8789;
  String? _xxfsoh8790;
  String? _xxfsoh8791;
  String? _xxfsoh8792;
  String? _xxfsoh8793;
Response copyWith({  String? status,
  String? message,
  String? abcd,
  String? dcba,
  String? ue8n20,
  String? e8k7sz,
  String? tc9sp,
  String? ty5x3k,
  String? x3k44v,
  String? z9w2q8,
  String? w2qy2x,
  String? poe8k,
  String? e7szt3,
  String? l21ty5,
  String? ke5a21,
  String? g5e1up,
  String? z5a2w1q,
  String? zw1qw2q,
  String? fpn21,
  String? tpcp1,
  String? lpozm,
  String? ww7qapd,
  String? r3l7z9,
  String? y2x5f3,
  String? ja1r11m,
  String? ha1num,
  String? na2uva,
  String? mu2taj,
  String? r1tab3,
  String? ab3xz4,
  String? x4s3h5,
  String? mqc9p,
  String? s3w9qb,
  String? w9qbs6,
  String? bs62jp,
  String? l4t8p,
  String? tan4z,
  String? mk34k,
  String? d2m8l,
  String? t3tkfz,
  String? m3dfz,
  String? dr9lz,
  String? lz9t25,
  String? n7q4z,
  String? d3t3m,
  String? znx3d,
  String? umt2x,
  String? dmd2n,
  String? fqa2e,
  String? bci4k,
  String? l6kpe,
  String? tcv2x,
  String? f2flp,
  String? stld3,
  String? vcs9l,
  String? tv9lg,
  String? kf2nq,
  String? blw4t,
  String? gped9,
  String? al45p,
  String? npk39,
  String? hw9tu,
  String? ur4e2,
  String? f9tcv,
  String? dth9p,
  String? hv9pd,
  String? tc45m,
  String? bua9t,
  String? t9yt4r,
  String? tp34l,
  String? t9mtv,
  String? dt7c9,
  String? t6rpg,
  String? up9al,
  String? m4kvr,
  String? fg45u,
  String? uk7un,
  String? tuv7p,
  String? dtc6b,
  String? tv9bp,
  String? xm35t,
  String? upy4k,
  String? atsv9,
  String? tkr7m,
  String? atsv910,
  String? xx9820,
  String? vrn,
  String? updt,
  String? newversion,
  String? lastupdateon,
  String? messageupdate,
  String? s2fpk2,
  String? uchp9,
  String? s2fpk,
  String? ja60o,
  String? hl2cz,
  String? t8lxur,
  String? t8lxur2,
  String? t20kbg,
  String? t20kbg01,
  String? cwesk,
  String? g7140,
  String? t8xqyt,
  String? kdfkd49,
  String? ytsxk,
  String? t5f1t4,
  String? yjnet,
  String? lngkr,
  String? av15m,
  String? t3oz4q,
  String? t0y8kf,
  String? xx8722,
  String? xx8723,
  String? xx8724,
  String? xx8725,
  String? xxcmb8726,
  String? xxgm8727,
  String? xxghlt8728,
  String? xxhgr8729,
  String? xxhco8730,
  String? r9d4p7m,
  String? xxccb8731,
  String? xxgcb8732,
  String? xxgvasc8733,
  String? xxgrssc8734,
  String? xxgric8735,
  String? xxrscrc8736,
  String? xxbcc8737,
  String? xxbcr8738,
  String? xxecc8739,
  String? xxecrc8740,
  String? xxgcc8741,
  String? xxggjlc8742,
  String? xxgilc8743,
  String? xxfcc8744,
  String? xxfcic8745,
  String? xxfcrc8746,
  String? xxfcrc8756,
  String? xxfgvdl8757,
  String? xxfgvc8758,
  String? xxfgpvw8759,
  String? xxfsga8760,
  String? xxfsga8761,
  String? xxord8762,
  String? xxordh8763,
  String? xxords8764,
  String? xxordd8765,
  String? xxordm8766,
  String? xxordos8767,
  String? xxhpdl8768,
  String? xxhpdl8769,
  String? xxhpdl8771,
  String? xxfsoh8774,
  String? xxfsoh8775,
  String? xxfsoh8776,
  String? xxfsoh8777,
  String? xxfsoh8778,
  String? xxfsoh8779,
  String? xxfsoh8780,
  String? xxfsoh8781,
  String? xxfsoh8782,
  String? xxfsoh8783,
  String? xxfsoh8784,
  String? xxfsoh8785,
  String? xxfsoh8786,
  String? xxfsoh8787,
  String? xxfsoh8788,
  String? xxfsoh8789,
  String? xxfsoh8790,
  String? xxfsoh8791,
  String? xxfsoh8792,
  String? xxfsoh8793,
}) => Response(  status: status ?? _status,
  message: message ?? _message,
  abcd: abcd ?? _abcd,
  dcba: dcba ?? _dcba,
  ue8n20: ue8n20 ?? _ue8n20,
  e8k7sz: e8k7sz ?? _e8k7sz,
  tc9sp: tc9sp ?? _tc9sp,
  ty5x3k: ty5x3k ?? _ty5x3k,
  x3k44v: x3k44v ?? _x3k44v,
  z9w2q8: z9w2q8 ?? _z9w2q8,
  w2qy2x: w2qy2x ?? _w2qy2x,
  poe8k: poe8k ?? _poe8k,
  e7szt3: e7szt3 ?? _e7szt3,
  l21ty5: l21ty5 ?? _l21ty5,
  ke5a21: ke5a21 ?? _ke5a21,
  g5e1up: g5e1up ?? _g5e1up,
  z5a2w1q: z5a2w1q ?? _z5a2w1q,
  zw1qw2q: zw1qw2q ?? _zw1qw2q,
  fpn21: fpn21 ?? _fpn21,
  tpcp1: tpcp1 ?? _tpcp1,
  lpozm: lpozm ?? _lpozm,
  ww7qapd: ww7qapd ?? _ww7qapd,
  r3l7z9: r3l7z9 ?? _r3l7z9,
  y2x5f3: y2x5f3 ?? _y2x5f3,
  ja1r11m: ja1r11m ?? _ja1r11m,
  ha1num: ha1num ?? _ha1num,
  na2uva: na2uva ?? _na2uva,
  mu2taj: mu2taj ?? _mu2taj,
  r1tab3: r1tab3 ?? _r1tab3,
  ab3xz4: ab3xz4 ?? _ab3xz4,
  x4s3h5: x4s3h5 ?? _x4s3h5,
  mqc9p: mqc9p ?? _mqc9p,
  s3w9qb: s3w9qb ?? _s3w9qb,
  w9qbs6: w9qbs6 ?? _w9qbs6,
  bs62jp: bs62jp ?? _bs62jp,
  l4t8p: l4t8p ?? _l4t8p,
  tan4z: tan4z ?? _tan4z,
  mk34k: mk34k ?? _mk34k,
  d2m8l: d2m8l ?? _d2m8l,
  t3tkfz: t3tkfz ?? _t3tkfz,
  m3dfz: m3dfz ?? _m3dfz,
  dr9lz: dr9lz ?? _dr9lz,
  lz9t25: lz9t25 ?? _lz9t25,
  n7q4z: n7q4z ?? _n7q4z,
  d3t3m: d3t3m ?? _d3t3m,
  znx3d: znx3d ?? _znx3d,
  umt2x: umt2x ?? _umt2x,
  dmd2n: dmd2n ?? _dmd2n,
  fqa2e: fqa2e ?? _fqa2e,
  bci4k: bci4k ?? _bci4k,
  l6kpe: l6kpe ?? _l6kpe,
  tcv2x: tcv2x ?? _tcv2x,
  f2flp: f2flp ?? _f2flp,
  stld3: stld3 ?? _stld3,
  vcs9l: vcs9l ?? _vcs9l,
  tv9lg: tv9lg ?? _tv9lg,
  kf2nq: kf2nq ?? _kf2nq,
  blw4t: blw4t ?? _blw4t,
  gped9: gped9 ?? _gped9,
  al45p: al45p ?? _al45p,
  npk39: npk39 ?? _npk39,
  hw9tu: hw9tu ?? _hw9tu,
  ur4e2: ur4e2 ?? _ur4e2,
  f9tcv: f9tcv ?? _f9tcv,
  dth9p: dth9p ?? _dth9p,
  hv9pd: hv9pd ?? _hv9pd,
  tc45m: tc45m ?? _tc45m,
  bua9t: bua9t ?? _bua9t,
  t9yt4r: t9yt4r ?? _t9yt4r,
  tp34l: tp34l ?? _tp34l,
  t9mtv: t9mtv ?? _t9mtv,
  dt7c9: dt7c9 ?? _dt7c9,
  t6rpg: t6rpg ?? _t6rpg,
  up9al: up9al ?? _up9al,
  m4kvr: m4kvr ?? _m4kvr,
  fg45u: fg45u ?? _fg45u,
  uk7un: uk7un ?? _uk7un,
  tuv7p: tuv7p ?? _tuv7p,
  dtc6b: dtc6b ?? _dtc6b,
  tv9bp: tv9bp ?? _tv9bp,
  xm35t: xm35t ?? _xm35t,
  upy4k: upy4k ?? _upy4k,
  atsv9: atsv9 ?? _atsv9,
  tkr7m: tkr7m ?? _tkr7m,
  atsv910: atsv910 ?? _atsv910,
  xx9820: xx9820 ?? _xx9820,
  vrn: vrn ?? _vrn,
  updt: updt ?? _updt,
  newversion: newversion ?? _newversion,
  lastupdateon: lastupdateon ?? _lastupdateon,
  messageupdate: messageupdate ?? _messageupdate,
  s2fpk2: s2fpk2 ?? _s2fpk2,
  uchp9: uchp9 ?? _uchp9,
  s2fpk: s2fpk ?? _s2fpk,
  ja60o: ja60o ?? _ja60o,
  hl2cz: hl2cz ?? _hl2cz,
  t8lxur: t8lxur ?? _t8lxur,
  t8lxur2: t8lxur2 ?? _t8lxur2,
  t20kbg: t20kbg ?? _t20kbg,
  t20kbg01: t20kbg01 ?? _t20kbg01,
  cwesk: cwesk ?? _cwesk,
  g7140: g7140 ?? _g7140,
  t8xqyt: t8xqyt ?? _t8xqyt,
  kdfkd49: kdfkd49 ?? _kdfkd49,
  ytsxk: ytsxk ?? _ytsxk,
  t5f1t4: t5f1t4 ?? _t5f1t4,
  yjnet: yjnet ?? _yjnet,
  lngkr: lngkr ?? _lngkr,
  av15m: av15m ?? _av15m,
  t3oz4q: t3oz4q ?? _t3oz4q,
  t0y8kf: t0y8kf ?? _t0y8kf,
  xx8722: xx8722 ?? _xx8722,
  xx8723: xx8723 ?? _xx8723,
  xx8724: xx8724 ?? _xx8724,
  xx8725: xx8725 ?? _xx8725,
  xxcmb8726: xxcmb8726 ?? _xxcmb8726,
  xxgm8727: xxgm8727 ?? _xxgm8727,
  xxghlt8728: xxghlt8728 ?? _xxghlt8728,
  xxhgr8729: xxhgr8729 ?? _xxhgr8729,
  xxhco8730: xxhco8730 ?? _xxhco8730,
  r9d4p7m: r9d4p7m ?? _r9d4p7m,
  xxccb8731: xxccb8731 ?? _xxccb8731,
  xxgcb8732: xxgcb8732 ?? _xxgcb8732,
  xxgvasc8733: xxgvasc8733 ?? _xxgvasc8733,
  xxgrssc8734: xxgrssc8734 ?? _xxgrssc8734,
  xxgric8735: xxgric8735 ?? _xxgric8735,
  xxrscrc8736: xxrscrc8736 ?? _xxrscrc8736,
  xxbcc8737: xxbcc8737 ?? _xxbcc8737,
  xxbcr8738: xxbcr8738 ?? _xxbcr8738,
  xxecc8739: xxecc8739 ?? _xxecc8739,
  xxecrc8740: xxecrc8740 ?? _xxecrc8740,
  xxgcc8741: xxgcc8741 ?? _xxgcc8741,
  xxggjlc8742: xxggjlc8742 ?? _xxggjlc8742,
  xxgilc8743: xxgilc8743 ?? _xxgilc8743,
  xxfcc8744: xxfcc8744 ?? _xxfcc8744,
  xxfcic8745: xxfcic8745 ?? _xxfcic8745,
  xxfcrc8746: xxfcrc8746 ?? _xxfcrc8746,
  xxfcrc8756: xxfcrc8756 ?? _xxfcrc8756,
  xxfgvdl8757: xxfgvdl8757 ?? _xxfgvdl8757,
  xxfgvc8758: xxfgvc8758 ?? _xxfgvc8758,
  xxfgpvw8759: xxfgpvw8759 ?? _xxfgpvw8759,
  xxfsga8760: xxfsga8760 ?? _xxfsga8760,
  xxfsga8761: xxfsga8761 ?? _xxfsga8761,
  xxord8762: xxord8762 ?? _xxord8762,
  xxordh8763: xxordh8763 ?? _xxordh8763,
  xxords8764: xxords8764 ?? _xxords8764,
  xxordd8765: xxordd8765 ?? _xxordd8765,
  xxordm8766: xxordm8766 ?? _xxordm8766,
  xxordos8767: xxordos8767 ?? _xxordos8767,
  xxhpdl8768: xxhpdl8768 ?? _xxhpdl8768,
  xxhpdl8769: xxhpdl8769 ?? _xxhpdl8769,
  xxhpdl8771: xxhpdl8771 ?? _xxhpdl8771,
  xxfsoh8774: xxfsoh8774 ?? _xxfsoh8774,
  xxfsoh8775: xxfsoh8775 ?? _xxfsoh8775,
  xxfsoh8776: xxfsoh8776 ?? _xxfsoh8776,
  xxfsoh8777: xxfsoh8777 ?? _xxfsoh8777,
  xxfsoh8778: xxfsoh8778 ?? _xxfsoh8778,
  xxfsoh8779: xxfsoh8779 ?? _xxfsoh8779,
  xxfsoh8780: xxfsoh8780 ?? _xxfsoh8780,
  xxfsoh8781: xxfsoh8781 ?? _xxfsoh8781,
  xxfsoh8782: xxfsoh8782 ?? _xxfsoh8782,
  xxfsoh8783: xxfsoh8783 ?? _xxfsoh8783,
  xxfsoh8784: xxfsoh8784 ?? _xxfsoh8784,
  xxfsoh8785: xxfsoh8785 ?? _xxfsoh8785,
  xxfsoh8786: xxfsoh8786 ?? _xxfsoh8786,
  xxfsoh8787: xxfsoh8787 ?? _xxfsoh8787,
  xxfsoh8788: xxfsoh8788 ?? _xxfsoh8788,
  xxfsoh8789: xxfsoh8789 ?? _xxfsoh8789,
  xxfsoh8790: xxfsoh8790 ?? _xxfsoh8790,
  xxfsoh8791: xxfsoh8791 ?? _xxfsoh8791,
  xxfsoh8792: xxfsoh8792 ?? _xxfsoh8792,
  xxfsoh8793: xxfsoh8793 ?? _xxfsoh8793,
);
  String? get status => _status;
  String? get message => _message;
  String? get abcd => _abcd;
  String? get dcba => _dcba;
  String? get ue8n20 => _ue8n20;
  String? get e8k7sz => _e8k7sz;
  String? get tc9sp => _tc9sp;
  String? get ty5x3k => _ty5x3k;
  String? get x3k44v => _x3k44v;
  String? get z9w2q8 => _z9w2q8;
  String? get w2qy2x => _w2qy2x;
  String? get poe8k => _poe8k;
  String? get e7szt3 => _e7szt3;
  String? get l21ty5 => _l21ty5;
  String? get ke5a21 => _ke5a21;
  String? get g5e1up => _g5e1up;
  String? get z5a2w1q => _z5a2w1q;
  String? get zw1qw2q => _zw1qw2q;
  String? get fpn21 => _fpn21;
  String? get tpcp1 => _tpcp1;
  String? get lpozm => _lpozm;
  String? get ww7qapd => _ww7qapd;
  String? get r3l7z9 => _r3l7z9;
  String? get y2x5f3 => _y2x5f3;
  String? get ja1r11m => _ja1r11m;
  String? get ha1num => _ha1num;
  String? get na2uva => _na2uva;
  String? get mu2taj => _mu2taj;
  String? get r1tab3 => _r1tab3;
  String? get ab3xz4 => _ab3xz4;
  String? get x4s3h5 => _x4s3h5;
  String? get mqc9p => _mqc9p;
  String? get s3w9qb => _s3w9qb;
  String? get w9qbs6 => _w9qbs6;
  String? get bs62jp => _bs62jp;
  String? get l4t8p => _l4t8p;
  String? get tan4z => _tan4z;
  String? get mk34k => _mk34k;
  String? get d2m8l => _d2m8l;
  String? get t3tkfz => _t3tkfz;
  String? get m3dfz => _m3dfz;
  String? get dr9lz => _dr9lz;
  String? get lz9t25 => _lz9t25;
  String? get n7q4z => _n7q4z;
  String? get d3t3m => _d3t3m;
  String? get znx3d => _znx3d;
  String? get umt2x => _umt2x;
  String? get dmd2n => _dmd2n;
  String? get fqa2e => _fqa2e;
  String? get bci4k => _bci4k;
  String? get l6kpe => _l6kpe;
  String? get tcv2x => _tcv2x;
  String? get f2flp => _f2flp;
  String? get stld3 => _stld3;
  String? get vcs9l => _vcs9l;
  String? get tv9lg => _tv9lg;
  String? get kf2nq => _kf2nq;
  String? get blw4t => _blw4t;
  String? get gped9 => _gped9;
  String? get al45p => _al45p;
  String? get npk39 => _npk39;
  String? get hw9tu => _hw9tu;
  String? get ur4e2 => _ur4e2;
  String? get f9tcv => _f9tcv;
  String? get dth9p => _dth9p;
  String? get hv9pd => _hv9pd;
  String? get tc45m => _tc45m;
  String? get bua9t => _bua9t;
  String? get t9yt4r => _t9yt4r;
  String? get tp34l => _tp34l;
  String? get t9mtv => _t9mtv;
  String? get dt7c9 => _dt7c9;
  String? get t6rpg => _t6rpg;
  String? get up9al => _up9al;
  String? get m4kvr => _m4kvr;
  String? get fg45u => _fg45u;
  String? get uk7un => _uk7un;
  String? get tuv7p => _tuv7p;
  String? get dtc6b => _dtc6b;
  String? get tv9bp => _tv9bp;
  String? get xm35t => _xm35t;
  String? get upy4k => _upy4k;
  String? get atsv9 => _atsv9;
  String? get tkr7m => _tkr7m;
  String? get atsv910 => _atsv910;
  String? get xx9820 => _xx9820;
  String? get vrn => _vrn;
  String? get updt => _updt;
  String? get newversion => _newversion;
  String? get lastupdateon => _lastupdateon;
  String? get messageupdate => _messageupdate;
  String? get s2fpk2 => _s2fpk2;
  String? get uchp9 => _uchp9;
  String? get s2fpk => _s2fpk;
  String? get ja60o => _ja60o;
  String? get hl2cz => _hl2cz;
  String? get t8lxur => _t8lxur;
  String? get t8lxur2 => _t8lxur2;
  String? get t20kbg => _t20kbg;
  String? get t20kbg01 => _t20kbg01;
  String? get cwesk => _cwesk;
  String? get g7140 => _g7140;
  String? get t8xqyt => _t8xqyt;
  String? get kdfkd49 => _kdfkd49;
  String? get ytsxk => _ytsxk;
  String? get t5f1t4 => _t5f1t4;
  String? get yjnet => _yjnet;
  String? get lngkr => _lngkr;
  String? get av15m => _av15m;
  String? get t3oz4q => _t3oz4q;
  String? get t0y8kf => _t0y8kf;
  String? get xx8722 => _xx8722;
  String? get xx8723 => _xx8723;
  String? get xx8724 => _xx8724;
  String? get xx8725 => _xx8725;
  String? get xxcmb8726 => _xxcmb8726;
  String? get xxgm8727 => _xxgm8727;
  String? get xxghlt8728 => _xxghlt8728;
  String? get xxhgr8729 => _xxhgr8729;
  String? get xxhco8730 => _xxhco8730;
  String? get r9d4p7m => _r9d4p7m;
  String? get xxccb8731 => _xxccb8731;
  String? get xxgcb8732 => _xxgcb8732;
  String? get xxgvasc8733 => _xxgvasc8733;
  String? get xxgrssc8734 => _xxgrssc8734;
  String? get xxgric8735 => _xxgric8735;
  String? get xxrscrc8736 => _xxrscrc8736;
  String? get xxbcc8737 => _xxbcc8737;
  String? get xxbcr8738 => _xxbcr8738;
  String? get xxecc8739 => _xxecc8739;
  String? get xxecrc8740 => _xxecrc8740;
  String? get xxgcc8741 => _xxgcc8741;
  String? get xxggjlc8742 => _xxggjlc8742;
  String? get xxgilc8743 => _xxgilc8743;
  String? get xxfcc8744 => _xxfcc8744;
  String? get xxfcic8745 => _xxfcic8745;
  String? get xxfcrc8746 => _xxfcrc8746;
  String? get xxfcrc8756 => _xxfcrc8756;
  String? get xxfgvdl8757 => _xxfgvdl8757;
  String? get xxfgvc8758 => _xxfgvc8758;
  String? get xxfgpvw8759 => _xxfgpvw8759;
  String? get xxfsga8760 => _xxfsga8760;
  String? get xxfsga8761 => _xxfsga8761;
  String? get xxord8762 => _xxord8762;
  String? get xxordh8763 => _xxordh8763;
  String? get xxords8764 => _xxords8764;
  String? get xxordd8765 => _xxordd8765;
  String? get xxordm8766 => _xxordm8766;
  String? get xxordos8767 => _xxordos8767;
  String? get xxhpdl8768 => _xxhpdl8768;
  String? get xxhpdl8769 => _xxhpdl8769;
  String? get xxhpdl8771 => _xxhpdl8771;
  String? get xxfsoh8774 => _xxfsoh8774;
  String? get xxfsoh8775 => _xxfsoh8775;
  String? get xxfsoh8776 => _xxfsoh8776;
  String? get xxfsoh8777 => _xxfsoh8777;
  String? get xxfsoh8778 => _xxfsoh8778;
  String? get xxfsoh8779 => _xxfsoh8779;
  String? get xxfsoh8780 => _xxfsoh8780;
  String? get xxfsoh8781 => _xxfsoh8781;
  String? get xxfsoh8782 => _xxfsoh8782;
  String? get xxfsoh8783 => _xxfsoh8783;
  String? get xxfsoh8784 => _xxfsoh8784;
  String? get xxfsoh8785 => _xxfsoh8785;
  String? get xxfsoh8786 => _xxfsoh8786;
  String? get xxfsoh8787 => _xxfsoh8787;
  String? get xxfsoh8788 => _xxfsoh8788;
  String? get xxfsoh8789 => _xxfsoh8789;
  String? get xxfsoh8790 => _xxfsoh8790;
  String? get xxfsoh8791 => _xxfsoh8791;
  String? get xxfsoh8792 => _xxfsoh8792;
  String? get xxfsoh8793 => _xxfsoh8793;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    map['abcd'] = _abcd;
    map['dcba'] = _dcba;
    map['UE8N20'] = _ue8n20;
    map['E8K7SZ'] = _e8k7sz;
    map['TC9SP'] = _tc9sp;
    map['TY5X3K'] = _ty5x3k;
    map['X3K44V'] = _x3k44v;
    map['Z9W2Q8'] = _z9w2q8;
    map['W2QY2X'] = _w2qy2x;
    map['POE8K'] = _poe8k;
    map['E7SZT3'] = _e7szt3;
    map['L21TY5'] = _l21ty5;
    map['KE5A21'] = _ke5a21;
    map['G5E1UP'] = _g5e1up;
    map['Z5A2W1Q'] = _z5a2w1q;
    map['ZW1QW2Q'] = _zw1qw2q;
    map['FPN21'] = _fpn21;
    map['TPCP1'] = _tpcp1;
    map['LPOZM'] = _lpozm;
    map['WW7QAPD'] = _ww7qapd;
    map['R3L7Z9'] = _r3l7z9;
    map['Y2X5F3'] = _y2x5f3;
    map['JA1R11M'] = _ja1r11m;
    map['HA1NUM'] = _ha1num;
    map['NA2UVA'] = _na2uva;
    map['MU2TAJ'] = _mu2taj;
    map['R1TAB3'] = _r1tab3;
    map['AB3XZ4'] = _ab3xz4;
    map['X4S3H5'] = _x4s3h5;
    map['MQC9P'] = _mqc9p;
    map['S3W9QB'] = _s3w9qb;
    map['W9QBS6'] = _w9qbs6;
    map['BS62JP'] = _bs62jp;
    map['L4T8P'] = _l4t8p;
    map['TAN4Z'] = _tan4z;
    map['MK34K'] = _mk34k;
    map['D2M8L'] = _d2m8l;
    map['T3TKFZ'] = _t3tkfz;
    map['M3DFZ'] = _m3dfz;
    map['DR9LZ'] = _dr9lz;
    map['LZ9T25'] = _lz9t25;
    map['N7Q4Z'] = _n7q4z;
    map['D3T3M'] = _d3t3m;
    map['ZNX3D'] = _znx3d;
    map['UMT2X'] = _umt2x;
    map['DMD2N'] = _dmd2n;
    map['FQA2E'] = _fqa2e;
    map['BCI4K'] = _bci4k;
    map['L6KPE'] = _l6kpe;
    map['TCV2X'] = _tcv2x;
    map['F2FLP'] = _f2flp;
    map['STLD3'] = _stld3;
    map['VCS9L'] = _vcs9l;
    map['TV9LG'] = _tv9lg;
    map['KF2NQ'] = _kf2nq;
    map['BLW4T'] = _blw4t;
    map['GPED9'] = _gped9;
    map['AL45P'] = _al45p;
    map['NPK39'] = _npk39;
    map['HW9TU'] = _hw9tu;
    map['UR4E2'] = _ur4e2;
    map['F9TCV'] = _f9tcv;
    map['DTH9P'] = _dth9p;
    map['HV9PD'] = _hv9pd;
    map['TC45M'] = _tc45m;
    map['BUA9T'] = _bua9t;
    map['T9YT4R'] = _t9yt4r;
    map['TP34L'] = _tp34l;
    map['T9MTV'] = _t9mtv;
    map['DT7C9'] = _dt7c9;
    map['T6RPG'] = _t6rpg;
    map['UP9AL'] = _up9al;
    map['M4KVR'] = _m4kvr;
    map['FG45U'] = _fg45u;
    map['UK7UN'] = _uk7un;
    map['TUV7P'] = _tuv7p;
    map['DTC6B'] = _dtc6b;
    map['TV9BP'] = _tv9bp;
    map['XM35T'] = _xm35t;
    map['UPY4K'] = _upy4k;
    map['ATSV9'] = _atsv9;
    map['TKR7M'] = _tkr7m;
    map['ATSV910'] = _atsv910;
    map['xx9820'] = _xx9820;
    map['VRN'] = _vrn;
    map['UPDT'] = _updt;
    map['newversion'] = _newversion;
    map['Lastupdateon'] = _lastupdateon;
    map['messageupdate'] = _messageupdate;
    map['S2FPK2'] = _s2fpk2;
    map['UCHP9'] = _uchp9;
    map['S2FPK'] = _s2fpk;
    map['JA60O'] = _ja60o;
    map['HL2CZ'] = _hl2cz;
    map['T8LXUR'] = _t8lxur;
    map['T8LXUR2'] = _t8lxur2;
    map['T20KBG'] = _t20kbg;
    map['T20KBG01'] = _t20kbg01;
    map['CWESK'] = _cwesk;
    map['G7140'] = _g7140;
    map['T8XQYT'] = _t8xqyt;
    map['KDFKD49'] = _kdfkd49;
    map['YTSXK'] = _ytsxk;
    map['T5F1T4'] = _t5f1t4;
    map['YJNET'] = _yjnet;
    map['LNGKR'] = _lngkr;
    map['AV15M'] = _av15m;
    map['T3OZ4Q'] = _t3oz4q;
    map['T0Y8KF'] = _t0y8kf;
    map['xx8722'] = _xx8722;
    map['xx8723'] = _xx8723;
    map['xx8724'] = _xx8724;
    map['xx8725'] = _xx8725;
    map['xxcmb8726'] = _xxcmb8726;
    map['xxgm8727'] = _xxgm8727;
    map['xxghlt8728'] = _xxghlt8728;
    map['xxhgr8729'] = _xxhgr8729;
    map['xxhco8730'] = _xxhco8730;
    map['R9D4P7M'] = _r9d4p7m;
    map['xxccb8731'] = _xxccb8731;
    map['xxgcb8732'] = _xxgcb8732;
    map['xxgvasc8733'] = _xxgvasc8733;
    map['xxgrssc8734'] = _xxgrssc8734;
    map['xxgric8735'] = _xxgric8735;
    map['xxrscrc8736'] = _xxrscrc8736;
    map['xxbcc8737'] = _xxbcc8737;
    map['xxbcr8738'] = _xxbcr8738;
    map['xxecc8739'] = _xxecc8739;
    map['xxecrc8740'] = _xxecrc8740;
    map['xxgcc8741'] = _xxgcc8741;
    map['xxggjlc8742'] = _xxggjlc8742;
    map['xxgilc8743'] = _xxgilc8743;
    map['xxfcc8744'] = _xxfcc8744;
    map['xxfcic8745'] = _xxfcic8745;
    map['xxfcrc8746'] = _xxfcrc8746;
    map['xxfcrc8756'] = _xxfcrc8756;
    map['xxfgvdl8757'] = _xxfgvdl8757;
    map['xxfgvc8758'] = _xxfgvc8758;
    map['xxfgpvw8759'] = _xxfgpvw8759;
    map['xxfsga8760'] = _xxfsga8760;
    map['xxfsga8761'] = _xxfsga8761;
    map['xxord8762'] = _xxord8762;
    map['xxordh8763'] = _xxordh8763;
    map['xxords8764'] = _xxords8764;
    map['xxordd8765'] = _xxordd8765;
    map['xxordm8766'] = _xxordm8766;
    map['xxordos8767'] = _xxordos8767;
    map['xxhpdl8768'] = _xxhpdl8768;
    map['xxhpdl8769'] = _xxhpdl8769;
    map['xxhpdl8771'] = _xxhpdl8771;
    map['xxfsoh8774'] = _xxfsoh8774;
    map['xxfsoh8775'] = _xxfsoh8775;
    map['xxfsoh8776'] = _xxfsoh8776;
    map['xxfsoh8777'] = _xxfsoh8777;
    map['xxfsoh8778'] = _xxfsoh8778;
    map['xxfsoh8779'] = _xxfsoh8779;
    map['xxfsoh8780'] = _xxfsoh8780;
    map['xxfsoh8781'] = _xxfsoh8781;
    map['xxfsoh8782'] = _xxfsoh8782;
    map['xxfsoh8783'] = _xxfsoh8783;
    map['xxfsoh8784'] = _xxfsoh8784;
    map['xxfsoh8785'] = _xxfsoh8785;
    map['xxfsoh8786'] = _xxfsoh8786;
    map['xxfsoh8787'] = _xxfsoh8787;
    map['xxfsoh8788'] = _xxfsoh8788;
    map['xxfsoh8789'] = _xxfsoh8789;
    map['xxfsoh8790'] = _xxfsoh8790;
    map['xxfsoh8791'] = _xxfsoh8791;
    map['xxfsoh8792'] = _xxfsoh8792;
    map['xxfsoh8793'] = _xxfsoh8793;
    return map;
  }

}