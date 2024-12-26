import 'package:appointment_app/export.dart';
class HomeDoctorsProvider with ChangeNotifier {

  final List<HomeDoctorsDetails> _doctorsList = [
    HomeDoctorsDetails(name: 'Dr. John Smith', specialization: 'Neurologist', ),
    HomeDoctorsDetails(name: 'Dr. Emily Davis', specialization: 'Cardiologist', ),
    HomeDoctorsDetails(name: 'Dr. Michael Brown', specialization: 'Dermatologist', ),
    HomeDoctorsDetails(name: 'Dr. Sarah Johnson', specialization: 'Pediatrician', ),
    HomeDoctorsDetails(name: 'Dr. James Williams', specialization: 'Orthopedic Surgeon', ),
    HomeDoctorsDetails(name: 'Dr. Elizabeth Taylor', specialization: 'Gynecologist', ),
    HomeDoctorsDetails(name: 'Dr. Robert Miller', specialization: 'Oncologist',),
    HomeDoctorsDetails(name: 'Dr. Olivia Wilson', specialization: 'General Physician', ),
    HomeDoctorsDetails(name: 'Dr. William Moore', specialization: 'Psychiatrist', ),
    HomeDoctorsDetails(name: 'Dr. Charlotte ', specialization: 'ENT Specialist', ),
    HomeDoctorsDetails(name: 'Dr. Henry Thomas', specialization: 'Endocrinologist', ),
    HomeDoctorsDetails(name: 'Dr. Sophia Martin', specialization: 'Nephrologist', ),
    HomeDoctorsDetails(name: 'Dr. Benjamin Harris', specialization: 'Rheumatologist', ),
    HomeDoctorsDetails(name: 'Dr. Mia Thompson', specialization: 'Pulmonologist',),
    HomeDoctorsDetails(name: 'Dr. Christopher ', specialization: 'Ophthalmologist', ),
    HomeDoctorsDetails(name: 'Dr. Isabella Lewis', specialization: 'Plastic Surgeon'),
    HomeDoctorsDetails(name: 'Dr. Alexander Scott', specialization: 'Urologist', ),
    HomeDoctorsDetails(name: 'Dr. Grace Walker', specialization: 'Gastroenterologist',),
  ];

  List<HomeDoctorsDetails> get doctorList => _doctorsList;

  List<HomeDoctorsDetails> get favoriteDoctors {
    return _doctorsList.where((doctor) => doctor.isFavorite).toList();
  }

  void toggleFavorite(String name) {
    int index = _doctorsList.indexWhere((doctor) => doctor.name == name);
    if (index != -1) {
      _doctorsList[index].isFavorite = !_doctorsList[index].isFavorite;
      notifyListeners();
    }
  }
}


















/*

class HomeDoctorsProvider with ChangeNotifier{
  final List<HomeDoctorsDetails> _doctorsList = [
    HomeDoctorsDetails(name: 'Dr. John Smith', specialization: 'Neurologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Emily Davis', specialization: 'Cardiologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Michael Brown', specialization: 'Dermatologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Sarah Johnson', specialization: 'Pediatrician', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. James Williams', specialization: 'Orthopedic Surgeon', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Elizabeth Taylor', specialization: 'Gynecologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Robert Miller', specialization: 'Oncologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Olivia Wilson', specialization: 'General Physician', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. William Moore', specialization: 'Psychiatrist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Charlotte ', specialization: 'ENT Specialist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Henry Thomas', specialization: 'Endocrinologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Sophia Martin', specialization: 'Nephrologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Benjamin Harris', specialization: 'Rheumatologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Mia Thompson', specialization: 'Pulmonologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Christopher ', specialization: 'Ophthalmologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Isabella Lewis', specialization: 'Plastic Surgeon', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Alexander Scott', specialization: 'Urologist', isFavorite: false),
    HomeDoctorsDetails(name: 'Dr. Grace Walker', specialization: 'Gastroenterologist', isFavorite: false),
  ];
List<HomeDoctorsDetails> get doctorList=>_doctorsList;
List<HomeDoctorsDetails> get favoriteDoctors{
  return _doctorsList.where((doctor)=>doctor.isFavorite).toList();
}
void toggleFavorite(String name)
{
  int index=_doctorsList.indexWhere((doctor)=>doctor.name==name);
  if(index!= -1){
    _doctorsList[index].isFavorite=! _doctorsList[index].isFavorite;
    notifyListeners();
  }
}
}*/
