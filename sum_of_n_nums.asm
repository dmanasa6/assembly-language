	; Sum of 'n' natural numbers 

	extern scanf
	extern printf
section .data
	input: db "Enter a number: ",10,0
	int : db "%d",0
	output : db "Sum of first %d numbers is : %d",10,0
section .text
	global main
main:
	push ebp
	mov ebp,esp
	
	push input			
	call printf
	
	lea eax,[ebp-0x4]		; to take user input number
	push eax
	push int
	call scanf

	mov dword[ebp-0x8],0		; sum = 0
	mov dword[ebp-0xc],0		; counter is initialized

loop:	mov eax,dword[ebp-0xc]		
	add dword[ebp-0x8],eax		; sum 
	
	add dword[ebp-0xc],0x1		; counter is incremented
	mov eax,dword[ebp-0x4]
	cmp dword[ebp-0xc],eax
	jle loop

	push dword[ebp-0x8]		; sum
	push dword[ebp-0x4]		; value of n
	push output
	call printf

	leave
	ret

