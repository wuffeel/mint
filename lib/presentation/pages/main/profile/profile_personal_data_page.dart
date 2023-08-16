import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_app_bar.dart';
import 'package:mint/presentation/widgets/mint_text_field.dart';
import 'package:mint/theme/mint_text_styles.dart';

import '../../../../bloc/user/user_bloc.dart';

@RoutePage()
class ProfilePersonalDataPage extends StatefulWidget {
  const ProfilePersonalDataPage({super.key});

  @override
  State<ProfilePersonalDataPage> createState() =>
      _ProfilePersonalDataPageState();
}

class _ProfilePersonalDataPageState extends State<ProfilePersonalDataPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  DateTime? _dateOfBirth;

  Future<void> _showDatePicker(DateTime? dateOfBirth) async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: dateOfBirth ?? DateTime.now(),
      firstDate: DateTime(now.year - 80),
      lastDate: now,
      currentDate: dateOfBirth,
      locale: Locale(context.l10n.localeName),
    );
    if (date != null) {
      setState(() {
        _dateOfBirth = date;
      });
    }
  }

  String _getDateOfBirthText(DateTime? dateOfBirth) {
    final l10n = context.l10n;
    return dateOfBirth != null
        ? DateFormat.yMd(l10n.localeName).format(dateOfBirth)
        : l10n.dateOfBirth;
  }

  Color _getDateOfBirthColor(DateTime? dateOfBirth) {
    return dateOfBirth != null
        ? Theme.of(context).primaryColor
        : Theme.of(context).hintColor.withOpacity(0.3);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          ProfileAppBar(
            minHeight: kToolbarHeight + MediaQuery.paddingOf(context).top,
            maxHeight: 244.h,
            collapseFactor: 0.5,
            onPickPhoto: () {
              // TODO(wuffeel): add onPickPhoto callback
            },
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserFetchSuccess) {
                    final dateOfBirth = state.user.dateOfBirth ?? _dateOfBirth;
                    return Column(
                      children: <Widget>[
                        MintTextField(
                          controller: _firstNameController,
                          hintText: l10n.firstName,
                        ),
                        SizedBox(height: 8.h),
                        MintTextField(
                          controller: _lastNameController,
                          hintText: l10n.lastName,
                        ),
                        SizedBox(height: 8.h),
                        InkWell(
                          onTap: () => _showDatePicker(dateOfBirth),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              color: Theme.of(context).colorScheme.secondary,
                            ),
                            padding: EdgeInsets.symmetric(
                              vertical: 14.h,
                              horizontal: 16.w,
                            ),
                            child: Text(
                              _getDateOfBirthText(dateOfBirth),
                              style: MintTextStyles.body.copyWith(
                                color: _getDateOfBirthColor(dateOfBirth),
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        ElevatedButton(
                          onPressed: () {
                            // TODO(wuffeel): add save user data functionality
                          },
                          child: Text(l10n.save),
                        ),
                      ],
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
