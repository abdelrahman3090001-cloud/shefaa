import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/widgets/app_button.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.delete_outline, color: Colors.red, size: 60.r),
          SizedBox(height: 20.h),
          Text(
            'Are you sure you want to delete\nyour account?',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 30.h),
          AppButton(
            title: 'Yes',
            onTap: () => Navigator.pop(context),
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showDeleteAccountDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) => const DeleteAccountDialog(),
  );
}
