import 'package:flutter/material.dart';

class DaftarAnggotaPage extends StatelessWidget {
  final List<Map<String, String>> members = [
    {
      "nama": "Yeheskiel Pambuko Aji",
      "nim": "123210100",
      "photo": "https://lh3.googleusercontent.com/pw/AP1GczOAQOkBbmCUFybn4X1kWKy_BpC5wskJ4XjbEvu0H9GydkS6zZAeWEzz34rLU_Y-2kVKMC6C6cnJBtzqC-OhkTCbFfL760bdqY4pPiPpIQts-ZWWIaFMWcdsV_Ky3s0J8udiEwCbqQHYC-lfrWIOiLVY6XwnpKTuKvbOAnJ27Pu9TlSz5NH4DcDCKLrMcqSZC8LY13PExeicczReMAylK4GwnCr1aclhtDYQq-bXJw8pZWiiBYrDO7EPf3hnrpPWvKw1dri3b_eDuHdvL707lCSfTuEm0rt2bjynbfJlg1Uj_fLZdaI0RSikDqWWIywSMnkmIz3Tt7JhZ3pK4ULVe-VRe-i8fKRETFo4G8b4kPQhvvP-nL5dxlbe4ltYsqXpR5ap3FiPD7ux4o_ZxXGach02vZm8BZWFh1-UoWRF0uCyFIO7CeF-GLwVuK4BKpitx9dS4Ud9mj4CdpvmkCz-Hlw56qlijRH27bh3UiP14fEHuFsVaCl836hjvhQ5Mi7dtWSo2aLr0rFUqNEEKluU5_pi42Dn-s4TqDHD0gVXXjjRGdRtO9HcQWk8N3L_Y3gjQ0BRCRJLCPABvXDnvfUXtjBOjrMtSoqeIEhgOF53EURklL6nbajXblNjCCYQzbeB_Somnve0BcfLxNtM797qgQhyAf4DTf5lBmD3txLzsNESMenNNP6WWs73a4p-5Q7jT6i8_-RQpDUJFnWBP4zwONesulLErtPT-Vnl_8WQMAx4RX5Qbve9jyhy90s3nxjNc3qFB0yBKhTEpdlgKiV0mExk38Nm8F0TNv5wxnPSE3BLpLMAOOvbSIXpWvrwZqSuc_JhRotlN55HPSIBV4HzaAxww1MITIderq8I_6yeU15XdNrCBMbEJwi5FMPM8-G3hQgvJjz_PsMeJmH6K556UA=w598-h399-s-no-gm?authuser=0",
    },
    {
      "nama": "Faza Denandra",
      "nim": "123210111",
      "photo": "https://via.placeholder.com/300/FF0000/FFFFFF?Text=WebsiteBuilders.com",
    },
    {
      "nama": "Muhammad Aditya Nugraha",
      "nim": "123210164",
      "photo": "https://lh3.googleusercontent.com/pw/AP1GczO1sAZpxdmngAD8QGZqQj50VIbyUjTmTBYkjjNuw4tcVeJC5w-f5t9ef1WOHRrd8Tk3fkyS8UNRRYfERkTNKxD6Csdh5UAjhhBOXKJClMl-3ip6-y1Q0Ot8amCxG0QtGO9cSR5V2dSrPuYJLFjwRMCgUlYZsQXUgFqWjg66Kor0EQ9D2r4IH5XC-thUMQ_A39Jz3iVQwuKd3omYTB1PPhp19mPu_k_yPMEG-jIxJd2sulPeEE8_NZJhcopEMWLRpcZ87mYIrV5LgHNhZiur7ACMHIr--RkTQxd_HSdRQeOf0kVCszN7Np7-IHYLXiJeZ_YpTN4wMY_PEbIaFXkRY4SL2tfmaaU9tWOM9HujuxXNcoInY76qqPkJX6fbBHsMuRBCen12qiUds-vuWIMjv2FuYT7kN8xpXLlQ8NjPdsXspLbfmfzGS6k5RGY4Z2TpoUzkL8Qu5FjLUvhwPelLj8pEBPVD2Iq9OZCoydloq7EAlw-WKK04DNIK_SdBTTP5YxgoJgqgxDA4aDD-AYrEqNjbGEGbyNoDaY4TdWjfpCPbSTIJgJdJSQDQGMsoTbcr3CyoX3N4t48lUh70NxBndQSIBby8NnKKvBffcOdieJnWPROJlJKc_8_QNk0jecS3evUpSI8WBz7wcQCWI53eaYqzI9Q8tgaHiQptfaG9Bj1PIn3aTSGEjAwHS3pq3SG6HmW6OmIzrDe7374RLqCVLLirw9XugNNNbUKwNXS3DQz3BPNamz7Q1CCpjMcy_w0l_4NK6FugYXik-ajpqgIQA_2zMAXH-RK6wddobPT0kE5QyuSQe2u3n0T0-6GMJDFeA0ymcsGWo47aQml2eLd--mCf69oLuLi_nopCLCQDH-xxPi9bL0msfr9CGGU5Q2YgNXwUwizxX3lyx51v96lwEg=w944-h944-s-no-gm?authuser=0",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Daftar Anggota'),
        backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Violet theme for AppBar
      ),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          final member = members[index];
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircleAvatar(
                  backgroundImage: NetworkImage(member["photo"]!),  // Larger profile image
                  radius: 100,  // Adjust the radius for a larger image
                ),
                SizedBox(height: 20),  // Space between image and text
                Text(
                  member["nama"]!,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,  // Adjusting text color to fit theme
                  ),
                ),
                Text(
                  member["nim"]!,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white70,  // Lighter white for secondary text
                  ),
                ),
                SizedBox(height: 40),  // Extra space before next member
              ],
            ),
          );
        },
      ),
      backgroundColor: Color.fromRGBO(143, 148, 251, 1), // Consistent background color
    );
  }
}
