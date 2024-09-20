String getImagePathByTheme(int themeParameter, String imageName) {
  switch (themeParameter) {
    case 1:
      return 'assets/dark/$imageName';
    case 2:
      return 'assets/pastel/$imageName';
    case 3:
      return 'assets/pink/$imageName';
    case 4:
      return 'assets/purple/$imageName';
    default:
      return 'assets/dark/$imageName';
  }
}
