import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shefaa/features/gps/cubit/gps_cubit.dart';
import 'package:shefaa/features/gps/cubit/gps_state.dart';
import 'package:shefaa/features/gps/ui/widgets/gps_widgets.dart';
import '../../../../core/theming/app_colors.dart';

class GpsScreen extends StatelessWidget {
  const GpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GpsCubit()..getGpsData(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const GpsHeader(),
            const GpsSearchBar(),
            const GpsCategories(),
            const GpsMapView(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Nearby Facilities',
                  style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<GpsCubit, GpsState>(
                builder: (context, state) {
                  if (state is GpsLoading) {
                    return const Center(child: CircularProgressIndicator(color: AppColors.mainGreen));
                  } else if (state is GpsSuccess) {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                      itemCount: state.facilities.length,
                      itemBuilder: (context, index) {
                        final facility = state.facilities[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 12.h),
                          padding: EdgeInsets.all(12.r),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: Colors.grey.shade100),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.local_hospital_outlined, color: AppColors.mainGreen),
                              SizedBox(width: 15.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(facility['name'], style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold)),
                                    Text(facility['distance'], style: TextStyle(fontSize: 11.sp, color: Colors.grey)),
                                  ],
                                ),
                              ),
                              Icon(Icons.bookmark_outline, color: Colors.grey),
                            ],
                          ),
                        );
                      },
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
