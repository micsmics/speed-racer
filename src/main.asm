INCLUDE Irvine32.inc
INCLUDE select-car.asm
INCLUDE select-car2.asm

.CODE
main PROC
    call select
	call select2
main ENDP


END main
