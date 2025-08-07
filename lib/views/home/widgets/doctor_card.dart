import 'package:doclink/routes/route_names.dart';
import 'package:doclink/theme/app_colors.dart';
import 'package:doclink/views/home/model/doctor_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorCard extends StatelessWidget {
  final DoctorModel doctor;

  const DoctorCard({super.key, required this.doctor});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;
    void onTap() {
      Get.toNamed(RouteNames.doctorDetailScreen, arguments: doctor);
    }

    return InkWell(
      onTap: () => onTap(),
      child: Container(
        height: size.height * 0.22,
        width: double.infinity,
        padding: const EdgeInsets.only(left: 10, top: 10),
        decoration: BoxDecoration(
          color: AppColors.background.withAlpha(122),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                doctor.imagePath,
                fit: BoxFit.cover,
                height: size.height * 0.2,
                width: size.width * 0.3,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          doctor.name,
                          style: textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),

                  Text(
                    doctor.description,
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    style: textTheme.bodySmall,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0, right: 14.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: onTap,
                          child: const Text(
                            'Book',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 20,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              "${doctor.rating}",
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
