TITLE INSERTION SORT ALGORITHM
; Author : Youssef Gamal
;------------------------------------------------------------------------
; The array is virtually split into sorted and unsorted part and we assume arr[0] is the first sorted
; element and we start picking values from unsorted part and placed it in the right position at the sorted part
; then iterate from arr[1] to arr[arr_size]
; compare the current key to its predecessor
; _if the key is smaller , compare to the element before , shift the greater elements one position forward 
; to make space for the swapped element
; _else continue for the next element
; Time complexity  worst case O(n^2)
; Space comlexity O(1)
;------------------------------------------------------------------------
.386
.MODEL FLAT
ExitProcess PROTO NEAR32 stdcall , dwExitCode:DWORD
INCLUDE io.h 
cr 	 EQU 0dh
Lf 	 EQU 0ah


.STACK 4096

.DATA
arr     DWORD 50,40,20,30,10
siz   = ($-arr)/4  ;array size 
result  BYTE 11 DUP (?),0ah,0dh,0
string  BYTE 20 DUP (?)
prm     BYTE "enter number : ",0
;-------------------------------
.CODE
_start:

comment !
;////////////////////////
; if you want to enter array elements    UNCOMMENT 
lea esi , arr
mov ecx,siz

_printARR
output prm
input string 
atod string 
mov [esi],eax
add esi,4
loop _printArr
;////////////////////////

!


;////////////////////////


mov esi,1     ;i
lea ebx,arr

_for:  ;outter loop
cmp esi,siz
je end_for
mov edx,[ebx+esi*4]  ;key


mov ecx ,esi
dec ecx


_xfor:  ;inner loop
cmp ecx,-1
je end_xfor

cmp  edx,[ebx+ecx*4]
jg  end_xfor

mov eax,0
mov eax,[ebx+ecx*4]
mov edi , ecx
inc edi
mov [ebx+edi*4],eax



dec ecx
jmp _xfor
end_xfor:

mov edi,ecx
inc edi
mov [ebx+edi*4],edx  
inc esi
jmp  _for

end_for:
;////////////////////////



;////////////////////////////
; * Printing array elements 

lea esi , arr
mov ecx,siz

_printARR:
dtoa result,[esi]
output result
add esi,4
loop _printArr
;////////////////////////////

invoke EXITPROCESS,0 
PUBLIC _start
END
