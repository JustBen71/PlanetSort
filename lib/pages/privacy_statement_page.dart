import 'package:flutter/material.dart';
import 'package:planetsort/component/planetsort_text_title.dart';
import 'package:planetsort/component/planetsort_text_normal.dart';
import 'package:planetsort/pages/main_page.dart';
import 'package:planetsort/utils/constant.dart';

class PrivacyStatementPage extends StatelessWidget {

  const PrivacyStatementPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: green,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: beige
          ),
          onPressed: () {
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const MainView()),
              (Route<dynamic> route) => false,
            );
          },
        ),
        title: const PlanetSortTitleText(
          data: "Privacy Statement",
          fontSize: sizetitle,
          color: beige,
        ),
        centerTitle: true,
        backgroundColor: green,
      ),
      body: ListView(
          padding: const EdgeInsets.all(16.0),
          //shrinkWrap: true,
          children: const [
            PlanetSortText(
              data:"1. This is an application from the company PlanetsSort.\n",
              color: beige,
              fontSize: paragraph,
              textAlign: TextAlign.left,
            ),
            PlanetSortText(
              data:"2. By registering, accessing and using any part of our application, you consent to our collection and use of the information you provide, including your personal data, in accordance with the terms of this Privacy Statement.\n",
              fontSize: paragraph,
              textAlign: TextAlign.justify,
            ),
            PlanetSortText(
              data: 'Definitions',
              fontSize: sizetitle3,
              textAlign: TextAlign.center,
            ),
            PlanetSortText(
              data:"""3. In this privacy statement, the words:
a. “We”, “us” and “our” refer to the PlanetSort business.
b. “Personal Data” has the same meaning as its definition in the Personal Data Protection Act 2012 (No. 26 of 2012).\n""",
              fontSize: paragraph,
              textAlign: TextAlign.justify,
            ),
            PlanetSortText(
              data: 'Types of information that we collect',
              fontSize: sizetitle3,
              textAlign: TextAlign.center,
            ),
            PlanetSortText(
              data:"4. We may collect information, which may include Personal Data, provided by you when you register for an account, and access and use the services within our digital services.\n",
              fontSize: paragraph,
              textAlign: TextAlign.justify,
            ),
            PlanetSortText(
              data:"""Examples of the types of information and personal data we may request and collect include, but are not limited to:
a. your personal information, including but not limited to your contact details and email address;
b. information from your device, including but not limited to your location information, camera and microphone.\n""",
              fontSize: paragraph,
              textAlign: TextAlign.justify,
            ),
            PlanetSortText(
              data: 'Security and safeguarding of your Personal Data',
              fontSize: sizetitle3,
              textAlign: TextAlign.center,
            ),
            PlanetSortText(
              data:"5. To safeguard your Personal Data, all electronic storage and transmission of Personal Data is secured with appropriate security technologies.\n",
              fontSize: paragraph,
              textAlign: TextAlign.justify,
            ),
            PlanetSortText(
              data: 'Links to other digital services',
              fontSize: sizetitle3,
              textAlign: TextAlign.center,
            ),
            PlanetSortText(
              data:"6. This digital service may contain links to digital services whose data protection and privacy practices may differ from ours. We are not responsible for the content or privacy practices of these other digital services and encourage you to review the privacy notices of these digital services.\n",
              fontSize: paragraph,
              textAlign: TextAlign.justify,
            ),
            PlanetSortText(
              data: 'Changes to the Privacy Statement',
              fontSize: sizetitle3,
              textAlign: TextAlign.center,
            ),
            PlanetSortText(
              data:"7. This Privacy Statement was last updated on 16 Feb 2024.\n",
              fontSize: paragraph,
              textAlign: TextAlign.justify,
            ),
            PlanetSortText(
              textAlign: TextAlign.justify,
              fontSize: paragraph,
              data:"""8. This Privacy Statement may be changed, modified or supplemented by us from time to time, 
and the updated versions will be posted on this site and date stamped so that you are aware of when the Privacy Statement 
was last updated. Your continued use of our digital services after such notification will constitute your acceptance 
of such amendments.\n"""
            ),
            PlanetSortText(
              data: 'Contact us',
              fontSize: sizetitle3,
              textAlign: TextAlign.center,
            ),
            PlanetSortText(
              textAlign: TextAlign.justify,
              data:"""9. Please contact us at planetsort@contact.sg if you:
a. Have any enquiries or feedback on our data collection, policies, and procedures; or
b. Need more information on or access to data which you have provided to us in the past.\n""",
              fontSize: paragraph,
            ),
          ],
        )
    );
  }
}