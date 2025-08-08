import 'package:doclink/views/home/model/banner_model.dart';
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
          'Expert in treating heart diseases and chest pain. Has over 10 years of experience managing cardiac patients. Known for accurate diagnoses and compassionate care. Uses cutting-edge technologies to improve heart health outcomes and prevent complications.',
      imagePath: 'assets/images/doctor1.png',
      rating: 4.8,
      fees: 120,
      workingDays: ['Monday', 'Wednesday', 'Friday'],
      workingHours: [
        '10:00 AM',
        '11:00 AM',
        '12:00 PM',
        '01:00 PM',
        '02:00 PM',
      ],
      experience: 7,
    ),
    DoctorModel(
      name: 'Dr. Ayesha Rahman',
      specialization: 'Dermatologist',
      description:
          'Specialist in skin, hair, and nail disorders. Skilled in both cosmetic and medical dermatology. Provides modern solutions for acne, eczema, and pigmentation. Focuses on long-term skin care strategies and improving patients’ confidence.',
      imagePath: 'assets/images/doctor2.png',
      rating: 4.7,
      fees: 100,
      workingDays: ['Tuesday', 'Thursday'],
      workingHours: ['09:00 AM', '10:00 AM', '11:00 AM', '12:00 PM'],
      experience: 5,
    ),
    DoctorModel(
      name: 'Dr. Shuvo Chatterjee',
      specialization: 'Pediatrician',
      description:
          'Focused on child development and vaccinations. Provides expert care from newborn to adolescent. Friendly approach makes kids feel at ease during visits. Offers guidance to parents on nutrition, milestones, and preventive health.',
      imagePath: 'assets/images/doctor1.png',
      rating: 4.9,
      fees: 90,
      workingDays: ['Monday', 'Wednesday', 'Saturday'],
      workingHours: ['10:00 AM', '11:00 AM', '12:00 PM', '01:00 PM'],
      experience: 3,
    ),
    DoctorModel(
      name: 'Dr. Nusrat Islam',
      specialization: 'Gynecologist',
      description:
          'Women\'s reproductive health expert. Handles pregnancy, menstruation, fertility, and menopause care. Offers personalized support with a warm and respectful approach. Known for educating women on holistic health and lifestyle improvements.',
      imagePath: 'assets/images/doctor3.png',
      rating: 4.6,
      fees: 110,
      workingDays: ['Tuesday', 'Thursday'],
      workingHours: ['11:00 AM', '12:00 PM', '01:00 PM', '02:00 PM'],
      experience: 7,
    ),
    DoctorModel(
      name: 'Dr. Rahat Hossain',
      specialization: 'Neurologist',
      description:
          'Handles brain, nerve, and spinal issues. Experienced in treating migraines, epilepsy, and strokes. Dedicated to improving neurological health with advanced treatments. Advocates for mental clarity, memory care, and patient education.',
      imagePath: 'assets/images/doctor4.png',
      rating: 4.5,
      fees: 130,
      workingDays: ['Wednesday', 'Friday'],
      workingHours: ['10:00 AM', '11:00 AM', '12:00 PM', '01:00 PM'],
      experience: 2,
    ),
    DoctorModel(
      name: 'Dr. Mehedi Hasan',
      specialization: 'Psychiatrist',
      description:
          'Helps with mental health and psychological issues. Provides therapy and medication for anxiety, depression, and more. Builds strong doctor-patient trust for recovery. Emphasizes empathy, listening, and evidence-based practices.',
      imagePath: 'assets/images/doctor5.png',
      rating: 4.7,
      fees: 115,
      workingDays: ['Monday', 'Thursday'],
      workingHours: ['09:00 AM', '10:00 AM', '11:00 AM', '12:00 PM'],
      experience: 6,
    ),
  ];

  final List<BannerModel> banners = [
    BannerModel(
      name: 'Medical Center',
      description:
          'Expert in treating heart diseases and chest pain. Has over 10 years of experience managing cardiac patients. Known for accurate diagnoses and compassionate care. Uses cutting-edge technologies to improve heart health outcomes and prevent complications.',
      imagePath: 'assets/images/doctor1.png',
    ),
    BannerModel(
      name: 'City Cardiology Clinic',
      description:
          'Specialized in cardiac emergencies and routine heart checkups. Equipped with advanced diagnostic tools. Staffed with renowned cardiologists.',
      imagePath: 'assets/images/doctor2.png',
    ),
    BannerModel(
      name: 'HeartCare Hospital',
      description:
          'Offers comprehensive cardiac rehabilitation and surgical procedures. Focus on prevention, treatment, and recovery support.',
      imagePath: 'assets/images/doctor3.png',
    ),
  ];
}
