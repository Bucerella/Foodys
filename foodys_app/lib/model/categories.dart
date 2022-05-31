class Categories {
  int catId;
  String catName;
  String catImgUrl;

  Categories(
    this.catId,
    this.catName,
    this.catImgUrl,
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Categories &&
          runtimeType == other.runtimeType &&
          catId == other.catId &&
          catName == other.catName &&
          catImgUrl == other.catImgUrl;

  @override
  int get hashCode => catId.hashCode ^ catName.hashCode ^ catImgUrl.hashCode;

  @override
  String toString() {
    return 'Categories{catId: $catId, catName: $catName, catImgUrl: $catImgUrl}';
  }
}
