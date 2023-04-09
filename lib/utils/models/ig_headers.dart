class IgHeaders {
  String? xCSRFToken;
  String? xIGAppID;
  String? xASBDID;
  String? xIGWWWClaim;
  String? xRequestedWith;
  String? cookie;
  String accept = "*/*";
  String host = "i.instagram.com";
  String userAgent =
      "Mozilla/5.0 (iPhone; CPU iPhone OS 16_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/16.3 Mobile/15E148 Safari/604.1";

  IgHeaders(
      {this.xCSRFToken,
      this.xIGAppID,
      this.xASBDID,
      this.xIGWWWClaim,
      this.xRequestedWith});

  IgHeaders.fromJson(Map<String, dynamic> json) {
    xCSRFToken = json['X-CSRFToken'];
    xIGAppID = json['X-IG-App-ID'];
    xASBDID = json['X-ASBD-ID'];
    xIGWWWClaim = json['X-IG-WWW-Claim'];
    xRequestedWith = json['X-Requested-With'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['X-CSRFToken'] = xCSRFToken;
    data['X-IG-App-ID'] = xIGAppID;
    data['X-ASBD-ID'] = xASBDID;
    data['X-IG-WWW-Claim'] = xIGWWWClaim;
    data['X-Requested-With'] = xRequestedWith;
    data['Accept'] = accept;
    data['Host'] = host;
    data['User-Agent'] = userAgent;
    data['Cookie'] = cookie;
    return data;
  }
}
