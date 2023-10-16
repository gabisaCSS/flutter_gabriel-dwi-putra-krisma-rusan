// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:project_gabriel/bloc/list_contact_bloc/list_contact_bloc.dart';
// import 'package:project_gabriel/bloc/phone_field_bloc/phone_field_bloc.dart';
// import 'package:project_gabriel/bloc/username_field_bloc/username_field_bloc.dart';
// import 'package:project_gabriel/routes/routes.dart';
// import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
// import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';
// import 'package:project_gabriel/widget/jarak_widget.dart';

// class ListContactWidget extends StatelessWidget {
//   const ListContactWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ListContactBloc, ListContactValueState>(
//       builder: (context, state) {
//         return Column(
//           children: [
//             Text(
//               'List Contacts',
//               style: TextStyleTheme().m3HeadlineSmall(),
//             ),
//             const JarakVertikal(16),
//             Container(
//               margin: const EdgeInsets.symmetric(horizontal: 16),
//               decoration: BoxDecoration(
//                   color: LightTheme().m3SysLightSurface,
//                   borderRadius: BorderRadius.circular(28)),
//               child: ListView.builder(
//                 itemCount: state.listContact.length,
//                 shrinkWrap: true,
//                 physics: const ClampingScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   var data = state.listContact[index];
//                   return ListTile(
//                     leading: CircleAvatar(
//                       backgroundColor: LightTheme().m3SysLightPrimaryContainer,
//                       child: Text(data.name[0]),
//                     ),
//                     title: Text(
//                       data.name,
//                       style: TextStyleTheme().m3BodyLarge(),
//                     ),
//                     subtitle: Text(
//                       data.phone,
//                       style: TextStyleTheme().m3BodyMedium(),
//                     ),
//                     trailing: Wrap(
//                       // spacing: 4,
//                       children: [
//                         IconButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, Routes.halamanEdit,
//                                   arguments: index);
//                               // await Future.delayed(
//                               //     const Duration(milliseconds: 200));
//                               context.read<UsernameFieldBloc>().add(
//                                   UsernameFieldEditEvent(
//                                       currentNameValue: data.name));

//                               context.read<PhoneFieldBloc>().add(
//                                   PhoneFieldEditEvent(
//                                       currentPhoneValue: data.phone));
//                             },
//                             icon: const Icon(Icons.edit)),
//                         IconButton(
//                             onPressed: () {
//                               context
//                                   .read<ListContactBloc>()
//                                   .add(DeleteContactEvent(index: index));
//                             },
//                             icon: const Icon(Icons.delete))
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             )
//           ],
//         );
//       },
//     );
//   }
// }
