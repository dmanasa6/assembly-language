	extern scanf
	extern printf
section .data
	input : db "enter a number: ",10,0
	int : db "%d",0
	out : db "%d",10,0
	res : db "Sum of digits of inputted number is : %d",10,0
section .text
	global main
main:
	push ebp
	mov ebp,esp

	push input 
	call printf

	lea eax,[ebp-0x8]
	push eax
	push int
	call scanf
	
	mov eax,dword[ebp-0x8]		;input

	mov dword[ebp-0x0c],0		;sum


loop:	mov eax,dword[ebp-0x8]		; will change
	xor edx,edx
	mov ebx,10
	div ebx
	mov dword[ebp-0x8],eax
	mov dword[ebp-0x10],edx			;dword[ebp-0x8]  = quotient
						;dword[ebp-0x10] = remainder
	
	mov eax,dword[ebp-0x0c]
	add eax,dword[ebp-0x10]		; sum=sum+remainder
	mov dword[ebp-0xc],eax
	
	cmp dword[ebp-0x8],0
	jne loop

	push dword[ebp-0xc]
	push res
	call printf

	leave	
	ret
