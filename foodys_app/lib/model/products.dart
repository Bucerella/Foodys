class Products {
  int proId;
  String proName;
  String proDesc;
  double proPrice;
  int proCatId;
  String proImgUrl;
  bool proIsAvailable;
  String proTag;

  Products(
    this.proId,
    this.proName,
    this.proDesc,
    this.proPrice,
    this.proCatId,
    this.proImgUrl,
    this.proIsAvailable,
    this.proTag,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Products &&
          runtimeType == other.runtimeType &&
          proId == other.proId &&
          proName == other.proName &&
          proDesc == other.proDesc &&
          proPrice == other.proPrice &&
          proCatId == other.proCatId &&
          proImgUrl == other.proImgUrl &&
          proIsAvailable == other.proIsAvailable &&
          proTag == other.proTag;

  @override
  int get hashCode =>
      proId.hashCode ^
      proName.hashCode ^
      proDesc.hashCode ^
      proPrice.hashCode ^
      proCatId.hashCode ^
      proImgUrl.hashCode ^
      proIsAvailable.hashCode ^
      proTag.hashCode;

  @override
  String toString() {
    return 'Products{proId: $proId, proName: $proName, proDesc: $proDesc, proPrice: $proPrice, proCatId: $proCatId, proImgUrl: $proImgUrl, proIsAvailable: $proIsAvailable, proTag: $proTag}';
  }
}
