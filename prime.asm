	extern scanf
	extern printf
section .data
	msg : db "enter a number : ",10,0
	input : db "%d",0
	out : db  "%d",10,0
	not : db "%d is not a prime number ",10,0
	prime : db "%d is a prime number",10,0
	
section .text
	global main
main:
	push ebp
	mov ebp,esp

	push msg
	call printf
	
	lea eax,[ebp-0x4]		; user input 'n'
	push eax
	push input
	call scanf

	mov eax,dword[ebp-0x4]		; eax = n 
	xor edx,edx			; edx = 0
	mov ebx,0x2			; ebx = 2
	div ebx				; eax = eax/ebx	  ->   n = n/2	  and 	edx = eax % ebx
	mov dword[ebp-0x8],eax		; 'n/2'

	mov dword[ebp-0xc],0x1		; i = 1
	mov dword[ebp-0x14],0x0		; counter is initialised i.e number of factors
	
loop:
	mov eax,dword[ebp-0x8]
	cmp dword[ebp-0xc],eax		; i < n/2
	je check		
	inc dword[ebp-0xc]		; i = i + 1
	xor edx,edx			; edx = 0 
	mov eax,dword[ebp-0x4]		; eax = n
	mov ebx,dword[ebp-0xc]		; ebx = i
	div ebx				; eax = eax/ebx	   ->  eax = n/i  and edx = n%i

	mov dword[ebp-0x10],edx
	cmp dword[ebp-0x10],0x0		; reamainder == 0
	je factor
	jmp loop
check:
	cmp dword[ebp-0x14],0x0		; counter != 0
	jne not_prime			; 'atleast' one factor
	push dword[ebp-0x4]		; prime number
	push prime
	call printf
	jmp exit 

factor:
	inc dword[ebp-0x14]		; 'i' is a factor of 'n' -> counter is incremented
	jmp loop
not_prime:
	push dword[ebp-0x4]		; not a prime number
	push not
	call printf
exit:
	leave
	ret
	
