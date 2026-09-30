import 'package:flutter/material.dart';
import 'package:portfolio/data/certificates_data.dart';
import 'package:portfolio/features/certificates/widgets/cartificate_viewer.dart';
import 'widgets/certificate_card.dart';

class CertificatesSection extends StatelessWidget {
  const CertificatesSection({super.key});

  void _showCertificate(BuildContext context, certificate) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.75),
      builder: (_) => CertificateViewer(certificate: certificate),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        int crossAxisCount;
        double cardAspectRatio;

        if (width >= 1200) {
          crossAxisCount = 3;
          cardAspectRatio = 0.85;
        } else if (width >= 800) {
          crossAxisCount = 2;
          cardAspectRatio = 0.82;
        } else {
          crossAxisCount = 1;
          cardAspectRatio = 0.95;
        }

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Certifications',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 8),
              Text(
                'Continuous learning through hands-on courses in programming, data, and machine learning.',
                style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.color?.withValues(alpha: 0.7),
                ),
              ),
              const SizedBox(height: 28),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: certificates.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: cardAspectRatio,
                ),
                itemBuilder: (context, index) {
                  final certificate = certificates[index];

                  return CertificateCard(
                    certificate: certificate,
                    onTap: () => _showCertificate(context, certificate),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}