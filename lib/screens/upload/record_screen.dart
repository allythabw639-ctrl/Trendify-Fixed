import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../services/style_filter_provider.dart';
import '../../utils/trendify_theme.dart';

class RecordScreen extends StatefulWidget {
  const RecordScreen({super.key});

  @override
  State<RecordScreen> createState() => _RecordScreenState();
}

class _RecordScreenState extends State<RecordScreen> with TickerProviderStateMixin {
  bool _isRecording = false;
  bool _isFrontCamera = true;
  int _selectedDuration = 15;
  int _selectedMode = 1;
  late AnimationController _pulseController;
  late AnimationController _timerController;

  static const _durations = [15, 30, 60];
  static const _modes = ['Photo', 'Video', 'Templates'];

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    _timerController = AnimationController(
      vsync: this,
      duration: Duration(seconds: _selectedDuration),
    );
    _timerController.addListener(() {
      if (_timerController.isCompleted) {
        setState(() => _isRecording = false);
        _pulseController.stop();
      }
    });
  }

  @override
  void dispose() {
    _pulseController.dispose();
    _timerController.dispose();
    super.dispose();
  }

  void _toggleRecording() {
    setState(() {
      _isRecording = !_isRecording;
      if (_isRecording) {
        _pulseController.repeat(reverse: true);
        _timerController.duration = Duration(seconds: _selectedDuration);
        _timerController.forward(from: 0);
      } else {
        _pulseController.stop();
        _timerController.stop();
        _timerController.reset();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filterProvider = context.watch<StyleFilterProvider>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned.fill(
            child: Container(
              margin: const EdgeInsets.only(bottom: 200),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Stack(
                children: [
                  Center(
                    child: CustomPaint(
                      size: Size.infinite,
                      painter: _GridPainter(),
                    ),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          _isFrontCamera ? Icons.person_outline : Icons.landscape_outlined,
                          size: 72,
                          color: Colors.white.withOpacity(0.08),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          _isFrontCamera ? 'Front Camera' : 'Rear Camera',
                          style: TextStyle(color: Colors.white.withOpacity(0.15), fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  if (_isRecording)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AnimatedBuilder(
                        animation: _timerController,
                        builder: (context, _) {
                          return LinearProgressIndicator(
                            value: _timerController.value,
                            backgroundColor: Colors.white12,
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.pinkAccent),
                            minHeight: 3,
                          );
                        },
                      ),
                    ),
                  Positioned(
                    top: MediaQuery.of(context).padding.top + 8,
                    left: 12,
                    right: 12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _iconButton(Icons.close, () => Navigator.pop(context)),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: _durations.map((d) {
                            final selected = d == _selectedDuration;
                            return GestureDetector(
                              onTap: _isRecording ? null : () => setState(() => _selectedDuration = d),
                              child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 4),
                                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                                decoration: BoxDecoration(
                                  color: selected ? Colors.white.withOpacity(0.15) : Colors.transparent,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Text(
                                  '${d}s',
                                  style: TextStyle(
                                    color: selected ? Colors.white : Colors.white54,
                                    fontSize: 13,
                                    fontWeight: selected ? FontWeight.w600 : FontWeight.normal,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        _iconButton(Icons.music_note_outlined, () {}),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 12,
                    top: MediaQuery.of(context).padding.top + 64,
                    child: Column(
                      children: [
                        _sideButton(Icons.flip_camera_ios_outlined, 'Flip', () {
                          setState(() => _isFrontCamera = !_isFrontCamera);
                        }),
                        _sideButton(Icons.speed, 'Speed', () {}),
                        _sideButton(Icons.auto_awesome, 'Beauty', () {}),
                        _sideButton(Icons.filter, 'Filters', () {}),
                        _sideButton(Icons.timer_outlined, 'Timer', () {}),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 200,
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  SizedBox(
                    height: 36,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_modes.length, (index) {
                        final selected = _selectedMode == index;
                        return GestureDetector(
                          onTap: () => setState(() => _selectedMode = index),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              _modes[index],
                              style: TextStyle(
                                color: selected ? Colors.white : Colors.white38,
                                fontSize: 14,
                                fontWeight: selected ? FontWeight.bold : FontWeight.normal,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      itemCount: filterProvider.filters.length,
                      itemBuilder: (context, index) {
                        final filter = filterProvider.filters[index];
                        final isSelected = filterProvider.selectedFilter?.id == filter.id;
                        return GestureDetector(
                          onTap: () => filterProvider.selectFilter(filter),
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: isSelected ? Colors.pinkAccent.withOpacity(0.2) : Colors.grey[900],
                              border: isSelected
                                  ? Border.all(color: Colors.pinkAccent, width: 1.5)
                                  : Border.all(color: Colors.white10),
                            ),
                            child: Center(
                              child: Text(
                                filter.displayName,
                                style: TextStyle(
                                  color: isSelected ? Colors.pinkAccent : Colors.white54,
                                  fontSize: 12,
                                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[900],
                            ),
                            child: const Icon(Icons.auto_fix_high, color: Colors.white54, size: 22),
                          ),
                          const SizedBox(height: 4),
                          const Text('Effects', style: TextStyle(color: Colors.white38, fontSize: 10)),
                        ],
                      ),
                      GestureDetector(
                        onTap: _toggleRecording,
                        child: AnimatedBuilder(
                          animation: _pulseController,
                          builder: (context, child) {
                            return Container(
                              width: 76,
                              height: 76,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: _isRecording
                                      ? Colors.pinkAccent.withOpacity(0.3 + _pulseController.value * 0.4)
                                      : Colors.white24,
                                  width: 4,
                                ),
                              ),
                              padding: const EdgeInsets.all(4),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                decoration: BoxDecoration(
                                  shape: _isRecording ? BoxShape.rectangle : BoxShape.circle,
                                  borderRadius: _isRecording ? BorderRadius.circular(8) : null,
                                  gradient: TrendifyBrand.logoGradient,
                                ),
                                width: _isRecording ? 28 : 60,
                                height: _isRecording ? 28 : 60,
                              ),
                            );
                          },
                        ),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 44,
                            height: 44,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[900],
                            ),
                            child: const Icon(Icons.photo_library_outlined, color: Colors.white54, size: 22),
                          ),
                          const SizedBox(height: 4),
                          const Text('Upload', style: TextStyle(color: Colors.white38, fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconButton(IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }

  Widget _sideButton(IconData icon, String label, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 18),
        child: Column(
          children: [
            Icon(icon, color: Colors.white, size: 26),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10)),
          ],
        ),
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.04)
      ..strokeWidth = 0.5;

    for (var i = 1; i < 3; i++) {
      final dx = size.width * i / 3;
      canvas.drawLine(Offset(dx, 0), Offset(dx, size.height), paint);
    }
    for (var i = 1; i < 3; i++) {
      final dy = size.height * i / 3;
      canvas.drawLine(Offset(0, dy), Offset(size.width, dy), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
