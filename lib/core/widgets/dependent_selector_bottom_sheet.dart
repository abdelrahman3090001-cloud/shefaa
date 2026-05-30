import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theming/app_colors.dart';

class DependentSelectorBottomSheet extends StatelessWidget {
  final List<String> dependents;
  final String selectedDependent;
  final Function(String) onDependentSelected;

  const DependentSelectorBottomSheet({
    super.key,
    required this.dependents,
    required this.selectedDependent,
    required this.onDependentSelected,
  });

  @override
  Widget build(BuildContext context) {
    // كـ Software Engineer: قمنا بجعل الـ Bottom Sheet مرناً (MainAxisSize.min) ليأخذ مساحة المحتوى فقط
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // مؤشر السحب العلوي (Handle)
          Center(
            child: Container(
              width: 50.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Text(
            'Select a Dependent',
            style: TextStyle(
              fontSize: 16.sp,
              color: Colors.grey.shade600,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 15.h),
          // قائمة الأسماء
          Flexible(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: dependents.length,
              itemBuilder: (context, index) {
                final dependent = dependents[index];
                final isSelected = dependent == selectedDependent;
                return ListTile(
                  onTap: () {
                    onDependentSelected(dependent);
                    Navigator.pop(context);
                  },
                  contentPadding: EdgeInsets.zero,
                  leading: isSelected
                      ? Icon(Icons.check, color: AppColors.mainGreen, size: 20.r)
                      : SizedBox(width: 20.r), // مساحة فارغة للحفاظ على المحاذاة
                  title: Text(
                    dependent,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      color: isSelected ? AppColors.mainGreen : Colors.black87,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }

  // دالة مساعدة لتسهيل استدعاء الـ Bottom Sheet من أي مكان
  static void show(
    BuildContext context, {
    required List<String> dependents,
    required String selectedDependent,
    required Function(String) onDependentSelected,
  }) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => DependentSelectorBottomSheet(
        dependents: dependents,
        selectedDependent: selectedDependent,
        onDependentSelected: onDependentSelected,
      ),
    );
  }
}
