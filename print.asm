	extern printf
	extern scanf
section .data
	input : db "Printing numbers" ,0
	output : db "%d ", 0
section .text
	global main
main :
	push ebp
	mov ebp,esp
	sub esp,0x10

	push input
	call printf

	mov byte[ebp-0xc],0x1

;loop:
;	mov ebx,dword[ebp-0xc]
;	imul ebx,eax
;	mov[ebp-0xc],ebx

;	dec eax
;	cmp eax,1
;	jne loop

	push dword[ebp-0xc]
	push output
	call printf

	mov esp,ebp
	leave
	ret