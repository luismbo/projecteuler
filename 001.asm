;;; /usr/local/bin/nasm -f macho64 001.asm && ld -lc 001.o -o 001 && ./001

        EXTERN  _printf
        GLOBAL start

        SECTION .text

start:
        mov rcx, 1              ; for rcx from 1 below 1000
	mov r8, 3
	mov r9, 5

	xor rbx, rbx            ; sum

loop:	mov rax, rcx
	xor rdx, rdx
	div r8
	test rdx, rdx
	je sum

	mov rax, rcx
	xor rdx, rdx
	div r9
	test rdx, rdx
	jne skip

sum:	add rbx, rcx

skip:	inc rcx
	cmp rcx, 1000
	jne loop


        ;; print result and exit

        push qword rbp          ; build stack frame
	mov rbp, rsp

        mov rdi, qword fmt
	xor eax, eax
        mov rsi, rbx            ; show result
	call _printf

        mov rax, 0x2000001
        mov rdi, 0
        syscall


        SECTION .data

fmt     db "%d", 0x0a, 0
