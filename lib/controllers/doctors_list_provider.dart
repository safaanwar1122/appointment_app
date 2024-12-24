import 'package:appointment_app/export.dart';

class DoctorsProvider with ChangeNotifier{
  final List<DoctorsDetails> _doctorsList = [
    DoctorsDetails(name: 'Dr. John Smith', specialization: 'Neurologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Emily Davis', specialization: 'Cardiologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Michael Brown', specialization: 'Dermatologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Sarah Johnson', specialization: 'Pediatrician', isFavorite: false),
    DoctorsDetails(name: 'Dr. James Williams', specialization: 'Orthopedic Surgeon', isFavorite: false),
    DoctorsDetails(name: 'Dr. Elizabeth Taylor', specialization: 'Gynecologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Robert Miller', specialization: 'Oncologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Olivia Wilson', specialization: 'General Physician', isFavorite: false),
    DoctorsDetails(name: 'Dr. William Moore', specialization: 'Psychiatrist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Charlotte ', specialization: 'ENT Specialist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Henry Thomas', specialization: 'Endocrinologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Sophia Martin', specialization: 'Nephrologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Benjamin Harris', specialization: 'Rheumatologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Mia Thompson', specialization: 'Pulmonologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Christopher ', specialization: 'Ophthalmologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Isabella Lewis', specialization: 'Plastic Surgeon', isFavorite: false),
    DoctorsDetails(name: 'Dr. Alexander Scott', specialization: 'Urologist', isFavorite: false),
    DoctorsDetails(name: 'Dr. Grace Walker', specialization: 'Gastroenterologist', isFavorite: false),
  ];
List<DoctorsDetails> get doctorList=>_doctorsList;
void toggleFavorite(String name)
{
  int index=_doctorsList.indexWhere((doctor)=>doctor.name==name);
  if(index!= -1){
    _doctorsList[index].isFavorite=! _doctorsList[index].isFavorite;
    notifyListeners();
  }
}
}