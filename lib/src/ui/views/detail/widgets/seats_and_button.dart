import 'package:app_cinema/src/domain/entities/movie.dart';
import 'package:flutter/material.dart';

import '../../../../domain/entities/seat.dart';
import '../../../theme/app_colors.dart';
import '../../../utils/responsive.dart';

class SeatsAndButton extends StatefulWidget {
  const SeatsAndButton({Key? key, required this.movie}) : super(key: key);

  // final Color buttonColor;
  final Movie movie;

  @override
  State<SeatsAndButton> createState() => _SeatsAndButtonState();
}

class _SeatsAndButtonState extends State<SeatsAndButton> {
  final List<Seat> _seats = List.generate(70, (_) => Seat());
  final List<Seat> _selectedSeats = [];
  final bool _vip = true;

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Column(
      children: [
        SizedBox(
          height: responsive.hp(40),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _vip ? 7 : 10,
            ),
            itemCount: _vip ? 35 : _seats.length,
            itemBuilder: (_, i) {
              final Seat seat = _seats[i];
              final bool isSelected = seat.isSelected;
              return GestureDetector(
                onTap: () {
                  seat.isSelected = !isSelected;
                  !isSelected
                      ? _selectedSeats.add(seat)
                      : _selectedSeats.remove(seat);
                  setState(() {});
                },
                child: _vip
                    ? Icon(
                        isSelected ? Icons.chair : Icons.chair_outlined,
                        color: isSelected ? Colors.white : AppColors.grey,
                      )
                    : Icon(
                        isSelected
                            ? Icons.event_seat
                            : Icons.event_seat_outlined,
                        color: isSelected ? Colors.white : AppColors.grey,
                      ),
              );
            },
          ),
        ),
        // SizedBox(height: responsive.hp(2)),
        // GestureDetector(
        //   onTap: () => setState(() => _vip = !_vip),
        //   child: AnimatedContainer(
        //     duration: const Duration(milliseconds: 350),
        //     curve: Curves.easeInSine,
        //     width: responsive.width,
        //     height: responsive.hp(6.5),
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         colors: [
        //           if (_vip) ...[
        //             AppColors.grey,
        //             AppColors.grey.withOpacity(0.9),
        //           ] else
        //             ..._vipColors
        //         ],
        //       ),
        //       borderRadius: BorderRadius.circular(8),
        //     ),
        //     child: Center(
        //       child: Text(
        //         'Cambiar a sala ${_vip ? 'común' : 'VIP'}',
        //         style: TextStyle(
        //           color: Colors.black54,
        //           fontWeight: FontWeight.bold,
        //           fontSize: responsive.dp(2),
        //           shadows: const [
        //             BoxShadow(
        //               color: Colors.black,
        //               offset: Offset(0.5, 0.5),
        //             ),
        //           ],
        //         ),
        //       ),
        //     ),
        //   ),
        // ),
        SizedBox(height: responsive.hp(2)),
        GestureDetector(
          onTap: () => print('tap'),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 350),
            curve: Curves.easeInSine,
            width: responsive.width,
            height: responsive.hp(6.5),
            decoration: BoxDecoration(
              color: _selectedSeats.isEmpty ? AppColors.grey : AppColors.blue,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                _selectedSeats.isEmpty
                    ? 'Agrega tus asientos'
                    : 'Confirmar (${_selectedSeats.length})',
                style: TextStyle(
                  color: _selectedSeats.isEmpty ? Colors.black54 : Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: responsive.dp(2),
                  shadows: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(0.5, 0.5),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
