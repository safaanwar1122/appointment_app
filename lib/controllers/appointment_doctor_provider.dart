
import 'package:appointment_app/utils/app_images.dart';

import '../models/appointment_doctor_details_model.dart';


import 'package:flutter/material.dart';
import 'package:appointment_app/models/appointment_doctor_details_model.dart';

class AppointmentProvider with ChangeNotifier {
  List<AppointmentDoctorsDetails> _appointments = [
    AppointmentDoctorsDetails(name: 'Dr. John Smith', specialization: 'Neurologist', time: 'Today 03:00 PM',imagePath:AppImages.doctorJohn ),
    AppointmentDoctorsDetails(name: 'Dr. Sarah Brown', specialization: 'Cardiologist', time: 'August 20, 2024 - 2:00 PM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Emily Davis', specialization: 'Dermatologist', time: 'August 20, 2024 - 4:00 PM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. James Wilson', specialization: 'Orthopedic Surgeon', time: 'Tomorrow 11:00 AM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Olivia Johnson', specialization: 'Pediatrician', time: 'August 21, 2024 - 9:30 AM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. William Martinez', specialization: 'General Practitioner', time: 'August 21, 2024 - 1:00 PM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Ava Taylor', specialization: 'Psychiatrist', time: 'August 22, 2024 - 10:00 AM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Matthew Lee', specialization: 'Gastroenterologist', time: 'August 22, 2024 - 3:00 PM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Isabella Moore', specialization: 'Ophthalmologist', time: 'Tomorrow 02:00 PM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Jack Harris', specialization: 'ENT Specialist', time: 'August 23, 2024 - 10:30 AM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Mia Clark', specialization: 'Endocrinologist', time: 'August 23, 2024 - 5:00 PM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Lucas Lewis', specialization: 'Plastic Surgeon', time: 'August 24, 2024 - 1:30 PM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Sophia Walker', specialization: 'Obstetrician', time: 'August 24, 2024 - 4:30 PM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Benjamin Hall', specialization: 'Oncologist', time: 'August 25, 2024 - 10:00 AM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Charlotte Young', specialization: 'Gynaecologist', time: 'August 25, 2024 - 2:30 PM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Henry King', specialization: 'Urologist', time: 'Tomorrow 09:00 AM',imagePath:AppImages.doctorJohn),
    AppointmentDoctorsDetails(name: 'Dr. Amelia Wright', specialization: 'Radiologist', time: 'August 26, 2024 - 11:00 AM',imagePath:AppImages.doctorJohn),
  ];

List<AppointmentDoctorsDetails> get appointments=> _appointments;
void addAppointment(AppointmentDoctorsDetails appointment){
  _appointments.add(appointment);
  notifyListeners();
}

}
