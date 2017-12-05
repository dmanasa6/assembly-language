	extern scanf
	extern printf
section .data
	ques: db "Welcome!! Enter yor name: ",0
	ans: db "%s",0
	greet: db "Hai %s, Nice to meet you!!"
section .text
	global main
main:
	push ebp
	mov ebp,esp
	sub esp,0x12

	push ques
	call printf

	mov eax,[ebp-0x4]
	push eax
	push ans
	call scanf

	mov eax,dword[ebp-0x4]
	push eax
	push greet
	call printf

	add esp,0x12
	leave
	ret
