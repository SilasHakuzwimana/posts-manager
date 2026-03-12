import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/post.dart';
import '../screens/post_form_screen.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  const PostDetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xFF6C63FF),
      const Color(0xFF00D2D3),
      const Color(0xFFFF9F43),
      const Color(0xFF2ECC71),
      const Color(0xFFE056FD),
    ];
    final accent = colors[post.id! % colors.length];

    return Scaffold(
      backgroundColor: const Color(0xFF0F0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0F0F1A),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded,
              color: Colors.white70, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Post Details',
          style: GoogleFonts.spaceGrotesk(
              color: Colors.white, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_rounded, color: Color(0xFF6C63FF)),
            onPressed: () async {
              final edited = await Navigator.push<bool>(
                context,
                MaterialPageRoute(builder: (_) => PostFormScreen(post: post)),
              );
              if (edited == true && context.mounted) {
                Navigator.pop(context, true);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ID badge
            Row(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: accent.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: accent.withOpacity(0.4)),
                  ),
                  child: Text(
                    'Post #${post.id}',
                    style: GoogleFonts.spaceGrotesk(
                        color: accent,
                        fontWeight: FontWeight.bold,
                        fontSize: 13),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'User ${post.userId}',
                    style:
                        GoogleFonts.inter(color: Colors.white54, fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Title
            Text(
              'Title',
              style: GoogleFonts.inter(
                  color: Colors.white38,
                  fontSize: 11,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Text(
              post.title,
              style: GoogleFonts.spaceGrotesk(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            const SizedBox(height: 28),

            // Divider
            Container(height: 1, color: Colors.white.withOpacity(0.06)),
            const SizedBox(height: 28),

            // Body
            Text(
              'Content',
              style: GoogleFonts.inter(
                  color: Colors.white38,
                  fontSize: 11,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2E),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.white.withOpacity(0.06)),
              ),
              child: Text(
                post.body,
                style: GoogleFonts.inter(
                  color: Colors.white70,
                  fontSize: 16,
                  height: 1.8,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
