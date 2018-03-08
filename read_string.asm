	extern scanf
	extern printf
section .data
	input : db "enter a string",10,0
	output: db "%s",0
	input1: db "inputted string is: ",10,0
section .text
	global main
main:
	push ebp					; function prolong	
	mov ebp,esp
	sub esp,0xc

	push input
	push output
	call printf
	
	mov eax,[ebp-0x8]
	push eax
	push output
	call scanf

	push input1
	push output
	call printf
	
	mov eax,dword[ebp-0x8]
	push eax
	push output
	call printf
	
	leave
	ret
