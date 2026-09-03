import 'package:flutter/material.dart';

class HeroVisual extends StatelessWidget {
  const HeroVisual({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 480),
        child: Container(
          decoration: BoxDecoration(
            color: isDark ? const Color(0xFF0F172A) : Colors.white,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: isDark ? const Color(0xFF1E293B) : const Color(0xFFE2E8F0),
              width: 1.5,
            ),
            boxShadow: [
              BoxShadow(
                color: theme.colorScheme.primary.withAlpha(isDark ? 30 : 20),
                blurRadius: 32,
                offset: const Offset(0, 16),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Code Editor Window Titlebar
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF131D33)
                      : const Color(0xFFF1F5F9),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  border: Border(
                    bottom: BorderSide(
                      color: isDark
                          ? const Color(0xFF1E293B)
                          : const Color(0xFFE2E8F0),
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    _windowDot(const Color(0xFFEF4444)),
                    const SizedBox(width: 8),
                    _windowDot(const Color(0xFFF59E0B)),
                    const SizedBox(width: 8),
                    _windowDot(const Color(0xFF10B981)),
                    const SizedBox(width: 16),
                    Flexible(
                      child: Text(
                        'flutter_architect.dart',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 12,
                          color: isDark ? Colors.white70 : Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Code Snippet Display
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _codeLine(
                      keyword: 'class ',
                      identifier: 'FlutterDeveloper ',
                      suffix: 'implements Architect {',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 6),
                    _indentLine(
                      keyword: 'final ',
                      text: 'name = ',
                      value: "'Arpit Yadav';",
                      isDark: isDark,
                    ),
                    const SizedBox(height: 4),
                    _indentLine(
                      keyword: 'final ',
                      text: 'primaryFocus = ',
                      value: "'Cross-Platform & Web';",
                      isDark: isDark,
                    ),
                    const SizedBox(height: 4),
                    _indentLine(
                      keyword: 'final ',
                      text: 'patterns = [',
                      value: "'BLoC', 'Clean Arch'];",
                      isDark: isDark,
                    ),
                    const SizedBox(height: 10),
                    _codeLine(
                      keyword: '  Future<void> ',
                      identifier: 'buildProductionApp',
                      suffix: '() async {',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 4),
                    _doubleIndentLine(
                      action: 'await deliverQuality',
                      arg: '(zeroJank: true);',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 6),
                    _codeLine(
                      keyword: '  }',
                      identifier: '',
                      suffix: '',
                      isDark: isDark,
                    ),
                    _codeLine(
                      keyword: '}',
                      identifier: '',
                      suffix: '',
                      isDark: isDark,
                    ),
                  ],
                ),
              ),
              // Status Bar
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isDark
                      ? const Color(0xFF0B1120)
                      : const Color(0xFFF8FAFC),
                  borderRadius: const BorderRadius.vertical(
                    bottom: Radius.circular(15),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10B981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        'Ready to collaborate',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 11,
                          color: isDark ? Colors.white60 : Colors.black54,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Flexible(
                      child: Text(
                        'Flutter 3',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 11,
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  static Widget _windowDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }

  static Widget _codeLine({
    required String keyword,
    required String identifier,
    required String suffix,
    required bool isDark,
  }) {
    return RichText(
      text: TextSpan(
        style: const TextStyle(
          fontFamily: 'monospace',
          fontSize: 13,
          height: 1.4,
        ),
        children: [
          TextSpan(
            text: keyword,
            style: const TextStyle(
              color: Color(0xFF818CF8),
              fontWeight: FontWeight.bold,
            ),
          ),
          TextSpan(
            text: identifier,
            style: TextStyle(
              color: isDark ? const Color(0xFF38BDF8) : const Color(0xFF0284C7),
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: suffix,
            style: TextStyle(
              color: isDark ? const Color(0xFFCBD5E1) : const Color(0xFF334155),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _indentLine({
    required String keyword,
    required String text,
    required String value,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 13,
            height: 1.4,
          ),
          children: [
            TextSpan(
              text: keyword,
              style: const TextStyle(
                color: Color(0xFF818CF8),
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: text,
              style: TextStyle(
                color: isDark
                    ? const Color(0xFFCBD5E1)
                    : const Color(0xFF334155),
              ),
            ),
            TextSpan(
              text: value,
              style: TextStyle(
                color: isDark
                    ? const Color(0xFF34D399)
                    : const Color(0xFF059669),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _doubleIndentLine({
    required String action,
    required String arg,
    required bool isDark,
  }) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontFamily: 'monospace',
            fontSize: 13,
            height: 1.4,
          ),
          children: [
            TextSpan(
              text: action,
              style: const TextStyle(
                color: Color(0xFFF472B6),
                fontWeight: FontWeight.w600,
              ),
            ),
            TextSpan(
              text: arg,
              style: TextStyle(
                color: isDark
                    ? const Color(0xFFCBD5E1)
                    : const Color(0xFF334155),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
