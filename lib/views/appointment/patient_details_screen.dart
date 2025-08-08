import 'package:doclink/controllers/doctor_appointment_controller.dart';
import 'package:doclink/routes/route_names.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/appointment/widgets/custom_text_form_field.dart';
import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:doclink/widgets/custom_app_bar.dart';
import 'package:doclink/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientDetailsScreen extends StatelessWidget {
  const PatientDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final doctor = args['doctor'] as DoctorModel;
    final selectedDay = args['selectedDay'] as String;
    final selectedHour = args['selectedHour'] as String;
    final controller = Get.find<DoctorAppointmentController>();
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const CustomAppBar(titleText: 'Patient Details'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 12,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Full name', style: textTheme.bodyLarge),
              CustomTextFormField(
                hintText: 'Enter Patient Full Name',
                controller: controller.patientNameTEController,
              ),
              const SizedBox(height: 8),
              Text('Age', style: textTheme.bodyLarge),
              CustomTextFormField(
                hintText: 'Enter Patient Age',
                controller: controller.patientAgeTEController,
              ),
              const SizedBox(height: 8),
              Text('Gender', style: textTheme.bodyLarge),
              Obx(
                () => Row(
                  children: [
                    _genderButton(controller, 'Male'),
                    const SizedBox(width: 20),
                    _genderButton(controller, 'Female'),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Text('Write your problem', style: textTheme.bodyLarge),
              CustomTextFormField(
                hintText: 'Write your problem',
                maxLines: 4,
                controller: controller.patientProblemTEController,
              ),
              const SizedBox(height: 48),
              CustomElevatedButton(
                btnText: 'Next',
                onTap: () {
                  if (controller.patientOnPress()) {
                    final patient = controller.getPatientData();
                    Get.toNamed(
                      RouteNames.bookingDetailScreen,
                      arguments: {
                        'doctor': doctor,
                        'patient': patient,
                        'selectedDay': selectedDay,
                        'selectedHour': selectedHour,
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _genderButton(
    DoctorAppointmentController controller,
    String gender,
  ) {
    final isSelected = controller.selectedGender.value == gender;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.setGender(gender),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primary : AppColors.surface,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.primary),
          ),
          alignment: Alignment.center,
          child: Text(
            gender,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
