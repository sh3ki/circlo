import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class CreatePostScreen extends StatefulWidget {
  const CreatePostScreen({super.key});

  @override
  State<CreatePostScreen> createState() => _CreatePostScreenState();
}

class _CreatePostScreenState extends State<CreatePostScreen> {
  final _captionCtrl = TextEditingController();
  String _selectedEmoji = '🌸';
  final Set<String> _selectedTags = {};
  bool _posted = false;

  static const _emojis = ['🌸', '🎨', '✈️', '🍕', '💪', '📸', '🎵', '🌿', '🚀', '📚', '🌅', '🎭', '🏔️', '🐾', '💻', '🧘'];
  static const _tagSuggestions = ['photography', 'travel', 'food', 'fitness', 'art', 'tech', 'books', 'wellness', 'music', 'nature'];

  @override
  void dispose() { _captionCtrl.dispose(); super.dispose(); }

  void _post() {
    if (_captionCtrl.text.trim().isEmpty) return;
    setState(() => _posted = true);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: const Text('Posted to Circlo! 🌸'), backgroundColor: AppTheme.primary, behavior: SnackBarBehavior.floating),
    );
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() { _posted = false; _captionCtrl.clear(); _selectedTags.clear(); _selectedEmoji = '🌸'; });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.surface,
      appBar: AppBar(title: const Text('Create Post'), actions: [
        TextButton(onPressed: _post, child: ShaderMask(
          shaderCallback: (b) => AppTheme.heroGradient.createShader(b),
          child: const Text('Share', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white)),
        )),
      ]),
      body: SingleChildScrollView(padding: const EdgeInsets.all(20), child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Center(child: Container(
          width: 120, height: 120,
          decoration: BoxDecoration(gradient: LinearGradient(colors: [AppTheme.primary.withOpacity(0.15), AppTheme.secondary.withOpacity(0.15)]), borderRadius: BorderRadius.circular(24)),
          child: Center(child: Text(_selectedEmoji, style: const TextStyle(fontSize: 64))),
        )),
        const SizedBox(height: 16),
        const Text('Choose a cover emoji', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 8),
        SizedBox(height: 52, child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: _emojis.length,
          itemBuilder: (_, i) => GestureDetector(
            onTap: () => setState(() => _selectedEmoji = _emojis[i]),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 44, height: 44,
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                color: _selectedEmoji == _emojis[i] ? AppTheme.primary.withOpacity(0.2) : Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: _selectedEmoji == _emojis[i] ? AppTheme.primary : Colors.grey.shade200),
              ),
              child: Center(child: Text(_emojis[i], style: const TextStyle(fontSize: 22))),
            ),
          ),
        )),
        const SizedBox(height: 20),
        TextField(
          controller: _captionCtrl,
          maxLines: 5,
          decoration: InputDecoration(
            hintText: "What's on your mind?",
            filled: true, fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 20),
        const Text('Add Tags', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14)),
        const SizedBox(height: 10),
        Wrap(spacing: 8, runSpacing: 8, children: _tagSuggestions.map((tag) {
          final sel = _selectedTags.contains(tag);
          return GestureDetector(
            onTap: () => setState(() => sel ? _selectedTags.remove(tag) : _selectedTags.add(tag)),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: sel ? AppTheme.heroGradient : null,
                color: sel ? null : Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: sel ? Colors.transparent : Colors.grey.shade200),
              ),
              child: Text('#$tag', style: TextStyle(color: sel ? Colors.white : Colors.black87, fontWeight: FontWeight.w600, fontSize: 13)),
            ),
          );
        }).toList()),
        const SizedBox(height: 32),
        SizedBox(width: double.infinity, child: DecoratedBox(
          decoration: BoxDecoration(gradient: AppTheme.heroGradient, borderRadius: BorderRadius.circular(16)),
          child: ElevatedButton(
            onPressed: _post,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, shadowColor: Colors.transparent, padding: const EdgeInsets.symmetric(vertical: 16), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
            child: Text(_posted ? 'Posted! 🌸' : 'Share Post', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white)),
          ),
        )),
        const SizedBox(height: 20),
      ])),
    );
  }
}
