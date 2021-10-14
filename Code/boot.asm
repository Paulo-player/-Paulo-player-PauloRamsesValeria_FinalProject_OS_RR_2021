org 0x7C00                    ;Endereço carregado pela BIOS
bits 16                       ;Arquitetura de 16 bits

start:
	cli                       ;Desabilita as interrupções
	mov si, msg               ;ponteiro SI guarda oo endereço de msg
	mov ah, 0x0E              ;print char

.loop	lodsb                 ;Carrega si no registrador AL e incrementa (contador)
	or al, al                 ;Checa se não há mais caracteres a serem imprimidos
	jz halt                   ;Interrompe o loop
	int 0x10                  ;caso contrário, interrompe o loop
	jmp .loop                 ;Próxima iteração e repetição do loop

halt:	hlt                   ;hlt interrompe a execução do loop
msg:	db "Hello, World!", 0 ;String armazenada no endereço 0,

times 510 - ($ - $$) db 0     ;Magic numbers para oidentificação do código como bootable
dw 0xAA55