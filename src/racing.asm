.DATA
    oi BYTE "oi", 0

.CODE
racingScreen PROC
	mov edx, OFFSET chronometerScreenLabel
	call WriteString

    ret
racingScreen ENDP

END