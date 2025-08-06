import 'package:doclink/views/home/model/category_model.dart';
import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final List<CategoryModel> categories = [
    CategoryModel(title: 'Cardiologist'),
    CategoryModel(title: 'Dentist'),
    CategoryModel(title: 'Dermatologist'),
    CategoryModel(title: 'Gynecologist'),
    CategoryModel(title: 'Neurologist'),
    CategoryModel(title: 'Orthopedic'),
    CategoryModel(title: 'Pediatrician'),
    CategoryModel(title: 'Psychiatrist'),
  ];
  final List<DoctorModel> doctorList = [
    DoctorModel(
      name: 'Dr. Pawan Kumar',
      specialization: 'Cardiologist',
      description:
          'Expert in treating heart diseases and chest pain. Has over 10 years of experience managing cardiac patients. Known for accurate diagnoses and compassionate care.',
      imagePath: 'assets/images/doctor1.png',
    ),
    DoctorModel(
      name: 'Dr. Ayesha Rahman',
      specialization: 'Dermatologist',
      description:
          'Specialist in skin, hair, and nail disorders. Skilled in both cosmetic and medical dermatology. Provides modern solutions for acne, eczema, and pigmentation.',
      imagePath: 'assets/images/doctor1.png',
    ),
    DoctorModel(
      name: 'Dr. Shuvo Chatterjee',
      specialization: 'Pediatrician',
      description:
          'Focused on child development and vaccinations. Provides expert care from newborn to adolescent. Friendly approach makes kids feel at ease during visits.',
      imagePath: 'assets/images/doctor1.png',
    ),
    DoctorModel(
      name: 'Dr. Nusrat Islam',
      specialization: 'Gynecologist',
      description:
          'Women\'s reproductive health expert. Handles pregnancy, menstruation, fertility, and menopause care. Offers personalized support with a warm and respectful approach.',
      imagePath: 'assets/images/doctor1.png',
    ),
    DoctorModel(
      name: 'Dr. Rahat Hossain',
      specialization: 'Neurologist',
      description:
          'Handles brain, nerve, and spinal issues. Experienced in treating migraines, epilepsy, and strokes. Dedicated to improving neurological health with advanced treatments.',
      imagePath: 'assets/images/doctor1.png',
    ),
    DoctorModel(
      name: 'Dr. Mehedi Hasan',
      specialization: 'Psychiatrist',
      description:
          'Helps with mental health and psychological issues. Provides therapy and medication for anxiety, depression, and more. Builds strong doctor-patient trust for recovery.',
      imagePath: 'assets/images/doctor1.png',
    ),
  ];
}
