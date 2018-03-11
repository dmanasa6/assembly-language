	extern scanf
	extern printf
section .data
	input : db "%d",0
	out   : db "%d",10,0
section .text
	global main
main:
	push ebp
	mov ebp,esp

	lea eax,[ebp-0x4]
	push eax
	push input
	call scanf
	
	push dword[ebp-0x4]
	push out
	call printf
	
	xor edx,edx				; edx = 0 
	mov eax,dword[ebp-0x4]			; eax = n
	mov ecx,0x4				; ecx = 4
	div ecx					; eax = eax / ecx 	edx = eax % ecx
	mov dword[ebp-0x8],edx
	
	push eax				; quiotient
	push out
	call printf

	push dword[ebp-0x8]			; remainder
	push out
	call printf

	leave
	ret
