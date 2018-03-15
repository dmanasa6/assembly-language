	extern scanf
	extern printf
section .data
	input : db "enter a number",10,0
	int : db "%d",0
	out : db "%d",10,0
	res : db "Cube of inputted number is : %d",10,0
section .text
	global main
main:
	push ebp
	mov ebp,esp

	push input 
	call printf

	lea eax,[ebp-0x4]
	push eax
	push int
	call scanf
	
	mov eax,dword[ebp-0x4]
	mov dword[ebp-0x08],1
	mov dword[ebp-0x10],0

loop:	mov eax,dword[ebp-0x8]
	mul dword[ebp-0x4]	
	mov dword[ebp-0x8],eax

	inc dword[ebp-0x10]
	cmp dword[ebp-0x10],3
	jne loop

	
	push dword[ebp-0x8]
	push res
	call printf

	leave
	ret

