import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:doclink/views/doctor/widgets/icon_button.dart';
import 'package:flutter/material.dart';

class DoctorDetailsFeatureCard extends StatelessWidget {
  const DoctorDetailsFeatureCard({super.key, required this.doctor});

  final DoctorModel doctor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    return Container(
      height: size.height * 0.2,
      decoration: BoxDecoration(
        color: AppColors.secondary.withAlpha(30),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        spacing: 12,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade400,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage(doctor.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: WrapAlignment.spaceBetween,
                  spacing: 20,
                  children: [
                    Text(doctor.name, style: textTheme.bodyLarge),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceBetween,
                      spacing: 8,
                      children: [
                        IconButtonWidget(
                          onTap: () {},
                          icon: Icons.chat_outlined,
                        ),
                        IconButtonWidget(
                          onTap: () {},
                          icon: Icons.call_outlined,
                        ),
                        IconButtonWidget(
                          onTap: () {},
                          icon: Icons.video_call_outlined,
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      doctor.specialization,
                      style: textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '${doctor.experience} yr exp',
                      style: textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Payment', style: textTheme.bodyLarge),
                    Text(
                      "\$${doctor.fees}",
                      style: textTheme.bodyLarge?.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
