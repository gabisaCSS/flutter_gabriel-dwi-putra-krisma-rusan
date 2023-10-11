import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_gabriel/bloc/db_list_contact_bloc/db_list_contact_bloc.dart';
import 'package:project_gabriel/bloc/phone_field_bloc/phone_field_bloc.dart';
import 'package:project_gabriel/bloc/username_field_bloc/username_field_bloc.dart';
import 'package:project_gabriel/routes/routes.dart';
import 'package:project_gabriel/theme/color_theme/ligth_theme.dart';
import 'package:project_gabriel/theme/text_style_theme/text_style_theme.dart';
import 'package:project_gabriel/widget/jarak_widget.dart';

class ListContactWidget extends StatefulWidget {
  const ListContactWidget({super.key});

  @override
  State<ListContactWidget> createState() => _ListContactWidgetState();
}

class _ListContactWidgetState extends State<ListContactWidget> {
  @override
  void initState() {
    super.initState();
    context.read<DbListContactBloc>().add(DbListContactFetchingDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DbListContactBloc, DbListContactState>(
      builder: (context, state) {
        if (state is DbListContactValueState) {
          return Column(
            children: [
              Text(
                'List Contacts',
                style: TextStyleTheme().m3HeadlineSmall(),
              ),
              const JarakVertikal(16),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: LightTheme().m3SysLightSurface,
                    borderRadius: BorderRadius.circular(28)),
                child: ListView.builder(
                  itemCount: state.listContact.length,
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var data = state.listContact[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor:
                            LightTheme().m3SysLightPrimaryContainer,
                        child: Text(data.name[0]),
                      ),
                      title: Text(
                        data.name,
                        style: TextStyleTheme().m3BodyLarge(),
                      ),
                      subtitle: Text(
                        data.phone,
                        style: TextStyleTheme().m3BodyMedium(),
                      ),
                      trailing: Wrap(
                        // spacing: 4,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, Routes.halamanEdit,
                                    arguments: data);
                                // await Future.delayed(
                                //     const Duration(milliseconds: 200));
                                context.read<UsernameFieldBloc>().add(
                                    UsernameFieldEditEvent(
                                        currentNameValue: data.name));

                                context.read<PhoneFieldBloc>().add(
                                    PhoneFieldEditEvent(
                                        currentPhoneValue: data.phone));
                              },
                              icon: const Icon(Icons.edit)),
                          IconButton(
                              onPressed: () {
                                context
                                    .read<DbListContactBloc>()
                                    .add(DbListContactDeleteEvent(id: data.id));
                              },
                              icon: const Icon(Icons.delete))
                        ],
                      ),
                    );
                  },
                ),
              )
            ],
          );
        } else if (state is DbListContactLoadingState) {
          return Column(
            children: [
              Text(
                'List Contacts',
                style: TextStyleTheme().m3HeadlineSmall(),
              ),
              const JarakVertikal(16),
              const Center(child: CircularProgressIndicator()),
            ],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
