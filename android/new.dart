Positioned
(
top: 5.h, // رفعنا المكان شوية عشان الاسم ياخد راحته
left: 20.w,
child: InkWell(
onTap: onProfileTap,
child: Column(
mainAxisSize: MainAxisSize.min,
children: [
Assets.images.user4.image(
height: 35.h, // مقاس مناسب للأيقونة
width: 35.w,
color: Colors.white,
),
// شلت الـ SizedBox عشان يبقوا "مباشرة" تحت بعض
Text(
'Ahmed',
style: TextStyle(
color: Colors.white,
fontSize: 12.sp,
fontWeight: FontWeight.bold,
),
),
],
),
),
),
Positioned(
top: 20.h,
right: 20.w,
child: InkWell(
onTap: onNotificationsTap,
child: Assets.images.bell.image(
height: 28.r, // مقاس أيقونة الجرس الطبيعي
width: 28.r,
color: Colors.white,
),
),
),
Center(
child: Padding(
padding: EdgeInsets.only(top: 20.h),
child: Assets.images.splash.image(
height: 60.h, // مقاس مناسب للوجو في النص
color: Colors.white,
),
),
)
,