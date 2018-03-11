	extern printf
	extern scanf
section .data
	input: db "Enter a number :" ,0
	number : db "%d" ,0
	output: db " Multiplication table of %d : " ,10,0
	print : db "%d * %d = %d ", 10,0

section .text
	global main
main:
	push ebp
	mov ebp,esp

	push input
	call printf

	lea eax,[ebp-0x4]		; user input 'n'
	push eax 
	push number
	call scanf

	push dword[ebp-0x4]
	push output
	call printf

	mov dword[ebp-0x8],0x1		; 'i' = 1

loop:
	mov eax,dword[ebp-0x4]
	mov ebx,dword[ebp-0x8]
	mul ebx				; n = n * i

	push eax
	push dword[ebp-0x8]
	push dword[ebp-0x4]
	push print
	call printf

	inc dword[ebp-0x8]		; i += 1 
	cmp dword[ebp-0x8],10		; i <= 10
	jle loop

	leave
	ret


