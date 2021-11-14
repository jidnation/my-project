class ModelClass {
  static void imageFiller(List<String> tofill, int unit) {
    for (int i = 1; i <= unit; i++) {
      tofill.add("images/carousel-$i.jpg");
    }

    // return tofill;
  }
}
