import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    super.key,
    required this.title,
    required this.onPress,
    required this.icon,
    required this.iconcolor,
    this.endIcon=true,
    this.textColor,
  });
  final String title;
  final bool endIcon;
  final VoidCallback onPress;
  final IconData icon;
  final Color? iconcolor;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: Icon(icon,color: iconcolor,),
      ),
      title: Text(title,style: Theme.of(context).textTheme.bodySmall?.apply(color: textColor),),
      trailing: endIcon? Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Theme.of(context).primaryColor.withOpacity(0.1),
        ),
        child: Icon(LineAwesomeIcons.angle_right,size:18,color: Colors.grey,),
      ):null,
    );
  }
}
