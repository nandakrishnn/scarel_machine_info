import 'package:flutter/material.dart';

Widget _buildForm() {
    return Container(
      padding: EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Create New Email Campaign",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text("Fill out these details to build your broadcast"),
          SizedBox(height: 24),
          _buildTextField("Campaign Subject", "Enter Subject"),
          SizedBox(height: 16),
          _buildTextField("Preview text", "Enter text here..."),
          SizedBox(height: 8),
          Text("Keep this simple of 50 character"),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: _buildTextField("From Name", "From Anne")),
              SizedBox(width: 16),
              Expanded(child: _buildTextField("From Email", "Anne@example.com")),
            ],
          ),
          SizedBox(height: 16),
          _buildSwitchRow("Run only once per customer"),
          _buildSwitchRow("Custom audience"),
          SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {},
                  child: Text("Save Draft"),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {},
                  child: Text("Next Step"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildTextField(String label, String hint) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        SizedBox(height: 8),
        TextField(
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSwitchRow(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label),
        Switch(
          value: false,
          onChanged: (value) {},
        ),
      ],
    );
  }
