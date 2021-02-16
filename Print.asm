	extern printf
	extern scanf
section .data
	ques: db "Printing Numbers from 1 to 100 :", 0
	print: db "%d", 0

section .text
	global main
main:
	push ebp
	mov ebp,esp
	sub esp,0x10

	push ques
	call printf

	mov byte[ebp-0xc],0x1

loop:

	push dword[ebp-0xc]
	push print
	call printf

	mov eax,dword[ebp-0xc]
	inc eax
	mov [ebp-0xc],eax

	cmp eax,101
	jne loop
	
	mov esp,ebp
	leave
	ret


