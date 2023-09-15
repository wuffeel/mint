import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mint/l10n/l10n.dart';
import 'package:mint/presentation/pages/main/profile/personal_data/widgets/profile_date_of_birth.dart';
import 'package:mint/presentation/pages/main/profile/widgets/profile_app_bar.dart';
import 'package:mint/theme/mint_text_styles.dart';
import 'package:mint_core/mint_core.dart';

import '../../../../../bloc/user/user_bloc.dart';
import '../../../../widgets/mint_text_form_field.dart';

@RoutePage()
class ProfilePersonalDataPage extends StatelessWidget {
  const ProfilePersonalDataPage({
    super.key,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.photoUrl,
  });

  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final String? photoUrl;

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserBloc, UserState>(
      listener: (context, state) {
        if (state is UserDataUpdateSuccess) context.router.pop();
      },
      child: _ProfilePersonalDataView(
        firstName: firstName,
        lastName: lastName,
        dateOfBirth: dateOfBirth,
        photoUrl: photoUrl,
      ),
    );
  }
}

class _ProfilePersonalDataView extends StatefulWidget {
  const _ProfilePersonalDataView({
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.photoUrl,
  });

  final String? firstName;
  final String? lastName;
  final DateTime? dateOfBirth;
  final String? photoUrl;

  @override
  State<_ProfilePersonalDataView> createState() =>
      _ProfilePersonalDataViewState();
}

class _ProfilePersonalDataViewState extends State<_ProfilePersonalDataView> {
  final _formKey = GlobalKey<FormState>();

  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  var _autoValidateMode = AutovalidateMode.disabled;
  late DateTime? _dateOfBirth = widget.dateOfBirth;
  FileData? _photoData;

  @override
  void initState() {
    super.initState();
    _firstNameController.text = widget.firstName ?? '';
    _lastNameController.text = widget.lastName ?? '';
  }

  void _onSaveData() {
    final formState = _formKey.currentState;
    if (formState == null || !formState.validate() || _dateOfBirth == null) {
      setState(() => _autoValidateMode = AutovalidateMode.onUserInteraction);
      return;
    }

    final firstName = _firstNameController.text.trim();
    final lastName = _lastNameController.text.trim();
    final updateEvent = UserDataUpdateRequested(
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: _dateOfBirth,
      photoData: _photoData,
    );
    context.read<UserBloc>().add(updateEvent);
  }

  Future<void> _onPickPhoto() async {
    final image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (image != null) {
      final bytes = await image.readAsBytes();
      setState(() => _photoData = FileData(name: image.name, bytes: bytes));
    }
  }

  bool get _dataChanged =>
      _firstNameController.text.trim() != widget.firstName ||
      _lastNameController.text.trim() != widget.lastName ||
      _dateOfBirth != widget.dateOfBirth ||
      _photoData != null;

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
            onPickPhoto: _onPickPhoto,
            photoData: _photoData,
          ),
          SliverFillRemaining(
            hasScrollBody: false,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
              child: BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserFetchSuccess) {
                    return Form(
                      key: _formKey,
                      autovalidateMode: _autoValidateMode,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          MintTextFormField(
                            controller: _firstNameController,
                            hintText: l10n.firstName,
                            onChanged: (_) => setState(() {
                              // TODO(wuffel): updates state
                            }),
                            validator: (firstName) {
                              final isNotValid =
                                  firstName == null || firstName.trim().isEmpty;
                              if (isNotValid) return l10n.pleaseEnterFirstName;
                              return null;
                            },
                          ),
                          SizedBox(height: 8.h),
                          MintTextFormField(
                            controller: _lastNameController,
                            hintText: l10n.lastName,
                            onChanged: (_) => setState(() {
                              // TODO(wuffel): updates state
                            }),
                            validator: (lastName) {
                              final isNotValid =
                                  lastName == null || lastName.trim().isEmpty;
                              if (isNotValid) return l10n.pleaseEnterLastName;
                              return null;
                            },
                          ),
                          SizedBox(height: 8.h),
                          ProfileDateOfBirth(
                            dateOfBirth: _dateOfBirth,
                            onDateChange: (date) {
                              setState(() => _dateOfBirth = date);
                            },
                          ),
                          if (_dateOfBirth == null &&
                              _autoValidateMode !=
                                  AutovalidateMode.disabled) ...[
                            SizedBox(height: 8.h),
                            Padding(
                              padding: EdgeInsets.only(left: 16.w),
                              child: Text(
                                l10n.pleaseEnterDateOfBirth,
                                style: MintTextStyles.caption1.copyWith(
                                  color: Theme.of(context).colorScheme.error,
                                ),
                              ),
                            )
                          ],
                          const Spacer(),
                          SizedBox(height: 16.h),
                          if (state is! UserDataUpdateLoading)
                            ElevatedButton(
                              onPressed: _dataChanged ? _onSaveData : null,
                              child: Text(l10n.save),
                            )
                          else
                            const Center(
                              child: CircularProgressIndicator(),
                            ),
                        ],
                      ),
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
