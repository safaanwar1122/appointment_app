class HomeDoctorsDetails{
  late final String name;
  late final String specialization;
 bool  isFavorite;
 // final String imagePath;
  HomeDoctorsDetails(
      //this.imagePath,
      {
   required this.name,
    required this.specialization,
     this.isFavorite=false,
});
}