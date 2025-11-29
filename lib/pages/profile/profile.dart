import 'package:flutter/material.dart';
import 'package:pharmacy_system/pages/custom-widgets/appbar_title.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();
  String _selectedGender = 'Male';
  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: CustomAppbar(pageName: "My Profile"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 6,
            children: [
              Text('Full Name'),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your full name', // <-- Added
                ),
              ),
              SizedBox(height: 10),

              Text('Email Address'),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(border: OutlineInputBorder(),
                  hintText: 'Enter your email address',),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 10),

              Text('Date of Birth'),
              TextFormField(
                controller: _dobController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.calendar_today_outlined),
                  hintText: 'Select your date of birth',
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime(2000, 1, 1),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (picked != null) {
                    _dobController.text =
                        "${picked.day}/${picked.month}/${picked.year}";
                  }
                },
              ),
              SizedBox(height: 10),

              Text('Gender'),
              DropdownButtonFormField<String>(
                value: _selectedGender,
                decoration: InputDecoration(border: OutlineInputBorder()),
                items: ['Male', 'Female', 'Other']
                    .map(
                      (gender) =>
                          DropdownMenuItem(value: gender, child: Text(gender)),
                    )
                    .toList(),
                onChanged: (val) {
                  setState(() => _selectedGender = val!);
                },
              ),
              SizedBox(height: 10),

              Text('Phone Number'),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter your phone number',
                ),
                keyboardType: TextInputType.phone,
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[100],
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    // handle save action
                    if (_formKey.currentState!.validate()) {
                      // save data
                    }
                  },
                  child: Text('Saved', style: TextStyle(fontSize: 16)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
