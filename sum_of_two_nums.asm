	extern scanf
	extern printf
section .data
	number: db "input two numbers",10,0
	num1 : db "%d %d",0
	result: db "Sum of inputted numbers is : %d",0
section .text
	global main
main:
	push ebp
	mov ebp,esp
	
	push number
	call printf
	
	lea eax,[ebp-0x4]
	lea ebx,[ebp-0x8]
	push ebx
	push eax
	push num1
	call scanf
	
	mov eax,dword[ebp-0x4]
	mov ebx,dword[ebp-0x8]
	add eax,ebx
	push eax
	push result
	call printf
	
	leave
	ret
