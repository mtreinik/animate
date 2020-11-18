
P386N
MODEL USE16 TINY

;--- equations

;VASESCALE1              EQU 0
;VASESCALE2              EQU 1   ;2
;VASESCALE3              EQU 4

VASEX                   EQU 0
VASEY                   EQU -3

VASESCALE1              EQU 0
VASESCALE2              EQU 1
VASESCALE3              EQU 3

USHIFT                  EQU 7
VSHIFT                  EQU 7

PHONGSIZE               EQU 14   ;3
AMBIENT                 EQU 10   ;3

EZOOM                   EQU 7

LX1                     EQU 48
LZ1                     EQU 118 ;sqrt(128^2-LX1^2)

LOGOWIDTH               EQU 64

VASEPNUM                EQU 35  ;37
VASEPSIZE               EQU 2*(VASEPNUM+1)*16*3
NLEN                    EQU 63

PZOOM                   EQU 7
ZPOSITION               EQU 320 ;300 ;500

MAXP                    EQU 43 ;43 ;120          ;30

CHAOSZOOM               EQU 5   ;5
HIGHLIGHTSIZE           EQU 6
SMOOTHITER              EQU 5   ;5
GROUNDHEIGHT            EQU 60

PERHOYSTART             EQU 65535
;PERHOYSTART             EQU 32767
PERHOYMAX               EQU 80 shl 9
PERHOYSPEED             EQU 4

TIMERCOUNT              EQU (1193180/256)       ;256times/s

XS                      EQU (256-160)/2
YS                      EQU (256-100)/2
XLSTART                 EQU YS
XCENTER                 EQU XS+80
YCENTER                 EQU YS+50
YDIVXSTART              EQU 105*256
YDIVX                   EQU YDIVXSTART+256*64+128

FUDGEFACTOR             EQU 15
FUD                     EQU (1 shl FUDGEFACTOR)
SINSTEP                 EQU 201

KBD_ESC                 EQU 1

DATASEG

factorials              dd 2*3
                        dd 2*3*4*5
                        dd 2*3*4*5*6*7
                        dd 2*3*4*5*6*7*8*9
                        dd 2*3*4*5*6*7*8*9*10*11

perhoypos               dw PERHOYSTART

x1                      db 10+XS
y1                      db 80+YS
u1                      db 0
v1                      db 138

x2                      db 72+XS
y2                      db 80+YS
u2                      db 5
v2                      db 138

x3                      db 72+XS       ;51
y3                      db 150+YS       ;42
u3                      db 5
v3                      db 138

x4                      db 10+XS
y4                      db 150+YS       ;42
u4                      db 0
v4                      db 138

x5                      db 10+XS       ;should have the same values as x1,y1,u1,v1
y5                      db 90+YS
u5                      db 0
v5                      db 138

bx1                     db ?
by1                     db ?
bu1                     db 193
bv1                     db 193
bx2                     db ?
by2                     db ?
bu2                     db 254
bv2                     db 193
bx3                     db ?
by3                     db ?
bu3                     db 254
bv3                     db 254
bx4                     db ?
by4                     db ?
bu4                     db 193
bv4                     db 254
bx5                     db ?
by5                     db ?
bu5                     db 193
bv5                     db 193
cx1                     db ?
cy1                     db ?
cu1                     db 193
cv1                     db 193
cx2                     db ?
cy2                     db ?
cu2                     db 254
cv2                     db 193
cx3                     db ?
cy3                     db ?
cu3                     db 254
cv3                     db 254
cx4                     db ?
cy4                     db ?
cu4                     db 193
cv4                     db 254
cx5                     db ?
cy5                     db ?
cu5                     db 193
cv5                     db 193

red1                    db 0
red2                    db 50
green1                  db 0
green2                  db 50
blue1                   db 0
blue2                   db 63

red3                    db 0
red4                    db 40
green3                  db 0
green4                  db 30
blue3                   db 0
blue4                   db 5

;change this to alter the highlights
highlight               db 3,6,10,18,40,63

pal2                    db 0,63,0,63,0,63
                        db 0,63,0,56,0,0

pal3                    db 0,0,0,56,0,63
                        db 0,0,0,63,0,0
pal4                    db 0,0,0,0,0,0
                        db 63,63,63,63,63,63

perho_points            db 3,15        ;y,z
                        db -3,15       ;y,z
                        db -3,-17      ;y,z
                        db 1,-17       ;y,z
                        db 0,20        ;y,z
                        db 0,-20       ;y,z


                        db 56,57
vase_points             db 44,54,    32,48,    24,40,   16,22,   16,8
                        db 4,-16,    4,-34,    0,-49,   19,-53,  38,-53
                        db 38,-52,   35,-50,   19,-50,  16,-47,  15,-44
                        db 17,-37,   15,-34,   14,-31,  15,-28
                        db 14,-27,   13,-24,   15,-22,  17,-19,  15,-16
                        db 7,-14,    6,-13,    7,-11,   19,8,    18,16
                        db 20,24,    22,31,    26,38,   34,46,   43,48
                        db 44,54
                        db 32,48


logo_packed             dw 01000000000000000b
                        dw 01100000000000000b
                        dw 01111000000000000b
                        dw 01001110000000000b
                        dw 00000111100000000b
                        dw 00000100111000000b
                        dw 00000100001110000b
                        dw 00000100000011100b
                        dw 00000100001111110b
                        dw 00000100111111000b
                        dw 01000111111100000b
                        dw 01111111110000000b
                        dw 01111111000000000b
                        dw 01111100000000000b
                        dw 01110000000000000b
                        dw 01000000000000000b
                        dw 01000000100000000b
                        dw 01111111110000000b
                        dw 01111111110000000b
                        dw 01000000100000000b
                        dw 00000000010000000b
                        dw 01000000010000000b
                        dw 01111111110000000b
                        dw 01111111100000000b
                        dw 01000000000000000b
                        dw 01000000100000000b
                        dw 01111111110011000b
                        dw 01111111110011000b
                        dw 01000000000000000b
                        dw 01000000100000000b
                        dw 01111111110000000b
                        dw 01111111110000000b
                        dw 00000000100000000b
                        dw 00000000010000000b
                        dw 01000000010000000b
                        dw 01111111110000000b
                        dw 01111111100000000b
                        dw 01000000100000000b
                        dw 00000000010000000b
                        dw 01000000010000000b
                        dw 01111111110000000b
                        dw 01111111100000000b
                        dw 01000000000000000b
                        dw 00000000000000000b
                        dw 00111001100000000b
                        dw 01111101110000000b
                        dw 01000100010000000b
                        dw 01000010010000000b
                        dw 01111111110000000b
                        dw 01111111100000000b
                        dw 01000000000000000b
                        dw 00000000010000000b
                        dw 00111111111100000b
                        dw 01111111111110000b
                        dw 01000000010000000b
                        dw 00100000010000000b
                        dw 00000000000000000b
                        dw 00011111000000000b
                        dw 00111111100000000b
                        dw 01110010110000000b
                        dw 01100010010000000b
                        dw 01100010010000000b
                        dw 00100011100000000b
                        dw 00010011000000000b

exitmsg                 db 'ANIMATE!','$'
;copyright               db '(c)1995schwartz@cute.fi'


UDATASEG

udatastart:

wordloopcounter         dw ?
envtab                  dw ?
perhoy                  dw ?

highest                 dw ?
height                  dw ?

groundx                 dw ?
groundy                 dw ?
yrot                    dw ?
perhoyvel               dw ?

vrotx                   dw ?
vroty                   dw ?

quador                  dw ?

seed1                   dw ?
seed2                   dw ?

oldtimerseg             dw ?
oldtimerofs             dw ?
oldkbdseg               dw ?
oldkbdofs               dw ?

bltpos                  dw ?

sintab                  dw 1024+256 dup (?)

perhot_orig             dw MAXP*3 dup (?)       ;x,y,z

perho_p                 dw MAXP*32 dup (?)

perho_order             dw MAXP*2 dup (?)

perhot                  db MAXP*8 dup (?)       ;x,y,z dw; wingphase,yrot db

vase_orig               db VASEPSIZE dup (?)  ;first half:  x,y,z
                                                        ;second half: nx,ny,nz

vase_p                  dw VASEPSIZE dup (?)


siny                    db ?
cosy                    db ?

wspeed                  db ?

wingpos                 db 256*2 dup (?)

xl                      db 1024 dup (?)
ul                      db 1024 dup (?)
vl                      db 1024 dup (?)
xr                      db 1024 dup (?)
ur                      db 1024 dup (?)
vr                      db 1024 dup (?)

loopcounter             db ?

oldpalette              db 256*3 dup (?)
palette                 db 256*3 dup (?)

logo                    db 16*256 dup (?)
pal5                    db 12 dup (?)

                        db 200h dup (?)
mystack label word

CODESEG

        STARTUPCODE

        mov sp,offset mystack
        cld

;--- clear udataseg
        push ds
        pop es
        mov cx,offset mystack-offset udatastart
        mov di,offset udatastart
        sub al,al
        rep stosb

;--- setup keyboard and timer interrupts
        mov ax,03508h
        int 21h
        mov oldtimerseg,es
        mov oldtimerofs,bx

        mov ax,03509h
        int 21h
        mov oldkbdseg,es
        mov oldkbdofs,bx

        push ds
        push cs
        pop ds
        mov dx,offset kbdint
        mov ax,02509h
        int 21h

        mov dx,offset timerint
        mov ax,02508h
        int 21h
        pop ds

        mov dx,TIMERCOUNT
        call timer_rate

;--- setup extra data segments
        mov ax,sp
        shr ax,4
        inc ax
        mov bx,ss
        add ax,bx
        mov fs,ax               ;fs->vscreen(105*256)+ydivx(128*128*2)+(23*256)

        add ax,65536 / 16
        mov gs,ax               ;gs->colorsum(256*256)
        add ax,65536 / 16
        mov envtab,ax

;--- make butterfly texture bitmap
        mov es,ax
        sub di,di
        mov bp,256
bitmap_1:
        mov cx,256
bitmap_2:
        mov ax,bp
        dec ax
        and ax,63
        sub ax,32
        imul ax
        mov bx,ax

        mov ax,cx
        dec ax
        and ax,63
        sub ax,32
        imul ax
        add ax,bx
        shr ax,6

        inc al
        cmp al,16
        jbe envok
        sub al,al
        jmp bitmap_store
envok:
        add al,12
        cmp al,32-HIGHLIGHTSIZE
        jb bitmap_store
        mov al,32-HIGHLIGHTSIZE
bitmap_store:

        stosb
        loop bitmap_2

        dec bp
        jnz bitmap_1

;--- make butterfly body texture
        mov di,128*256
        mov cx,256*32/2
;        mov al,10
        mov ax,0c08h
        rep stosw

;--- make ydivx table
        push fs
        pop es
        mov di,YDIVXSTART
        mov bp,-64
ydivx_1:
        mov cx,-64
ydivx_2:
        test cx,cx
        jz ydivx_dontdiv

        mov ax,bp
        shl ax,8
        cwd
        idiv cx
ydivx_dontdiv:
        stosw

        inc cx
        cmp cx,64
        jl ydivx_2

        inc bp
        cmp bp,64
        jl ydivx_1

;--- make sintab
        push ds
        pop es
        mov di,offset sintab

        sub ebp,ebp
        mov wordloopcounter,512
sintab_1:
        add ebp,SINSTEP         ;ebp=a

        mov ebx,ebp             ;ebx=a

        mov si,offset factorials
        mov cx,5
        mov eax,ebp
sintab_2:
        mul ebp
        shrd eax,edx,FUDGEFACTOR
        shr edx,FUDGEFACTOR
        mul ebp
        shrd eax,edx,FUDGEFACTOR
        shr edx,FUDGEFACTOR     ;edx:eax=a^3

        push eax

        div dword ptr [si]
        add si,4

        neg ebx
        add ebx,eax

        pop eax

        loop sintab_2

        mov eax,ebx
        shr eax,FUDGEFACTOR-15

        cmp ax,-32768
        jne sintab_3
        inc ax
sintab_3:
        stosw
        neg ax
        mov es:[di+1022],ax

        dec wordloopcounter
        jnz sintab_1
        mov di,offset sintab+1024*2
        mov si,offset sintab
        mov cx,256
        rep movsw

;--- animate butterfly wings
        mov di,offset wingpos
        mov bp,2048
        mov cx,1161     ;774
animwings_1:
        mov bx,ds:[offset sintab+bp]
        sar bx,8
        add bx,bx

        mov ax,[offset sintab+bx+512-100]
        cwd
        idiv cx
        stosb
        mov ax,[offset sintab+bx+512+512-100]
        cwd
        idiv cx
        stosb

        sub bp,8
        jnz animwings_1

;--- make vase normals
        mov si,offset vase_points-2
        mov di,offset vase_p
        mov cx,VASEPNUM+1       ;+1
mvn_1:
        push cx

        mov dh,[si-2]
        sub dh,[si]     ;dh=nx

        mov al,[si+1]
        sub al,[si-1]
        mov dl,al       ;dl=ny

        imul al
        mov bx,ax
        mov al,dh
        imul al
        add ax,bx       ;bx=|n|
        inc ax

        movzx eax,ax
        push si
        call sqrt_eax
        pop si

        mov bp,dx

        mov cx,NLEN
        movsx ax,dl
        imul cx
        idiv bx
        stosb

        mov dx,bp

        movsx ax,dh
        imul cx
        idiv bx
        stosb

        add si,2

        pop cx
        loop mvn_1

        mov si,offset vase_p
        mov bp,offset vase_points
        mov di,offset vase_orig
        mov cx,VASEPNUM
mvn_2:
        push cx

        mov dx,ds:[bp]     ;dl=x, dh=y
        mov bx,2048*15/16
mvn_3:
        mov al,dl
        imul byte ptr [offset sintab+bx+512+1]
        sar ax,7
        stosb                           ;x

        mov al,dh
        stosb                           ;y

        mov al,dl
        imul byte ptr [offset sintab+bx+1]
        sar ax,7
        stosb                           ;z

        push dx

        mov al,[si+2]
;        mov al,[si]
        mov cx,ax

        imul byte ptr [offset sintab+bx+512+1]
        sar ax,7
        mov [di+(VASEPSIZE/2)-3],al     ;nx

        mov al,[si+3]
;        mov al,[si+1]
        mov [di+(VASEPSIZE/2)-2],al     ;ny

        mov ax,cx
        imul byte ptr [offset sintab+bx+1]
        sar ax,7
        mov [di+(VASEPSIZE/2)-1],al     ;nz

        pop dx

        sub bx,2048/16
        jns mvn_3

        add si,2
        add bp,2

        pop cx
        loop mvn_2

;--- initialize graphics mode
        mov ax,13h
        int 10h

;--- make palette
        mov di,offset palette
        mov cx,256*3
        mov al,63
        rep stosb

        mov bp,64
mkp_1:
        call fadepalette
        dec bp
        jnz mkp_1

        call makepalette

;--- unpack logo
        mov si,offset logo_packed
        mov di,offset logo
        mov bp,LOGOWIDTH
upl_1:
        lodsw
        mov cx,16
upl_2:
        shr ax,1
        jnc upl_3
        add byte ptr [di],31
        add byte ptr [di+64],31
        add byte ptr [di+128],31
        add byte ptr [di+192],31
upl_3:
        add di,256
        loop upl_2
        sub di,256*16-1

        dec bp
        jnz upl_1

;--- ground image
        mov ax,envtab
        mov es,ax
        sub di,di
        mov cx,(128+5)*256
tsti1:
        xor al,ah
        add dx,0a382h
        add ax,dx

        and al,31
        mov bl,al
        shr bl,2
        sub al,bl
        add al,32

        stosb
        loop tsti1

;--- smooth
        mov bx,SMOOTHITER
tsti3:
        sub di,di
        mov cx,(128+5)*256
tsti2:
        mov al,es:[di]
        add al,es:[di+1]
        add al,es:[di+256]
        add al,es:[di+257]
        add al,3
        shr al,2
        stosb

        loop tsti2

        dec bx
        jnz tsti3

;--- initialize butterflies
        push ds
        pop es
        mov di,offset perhot_orig
        mov bp,MAXP*3
ib_1:
        call random
        add ax,ax
        sar ax,1
;        shl ax,2
;        sar ax,2
        stosw

        dec bp
        jnz ib_1

        mov di,offset perhot
        mov bp,MAXP
ib_2:
        call random
        mov [di+6],al
        add di,8
        dec bp
        jnz ib_2

        mov si,offset pal3
        call makenewpalette

        mov cs:part,1
        mov cs:clock,256*25
main:
        call fadepalette
        call bltscreen

;--- update world parameters
        sub ax,ax
        xchg al,cs:wingspeed
        mov wspeed,al

        movzx bx,al
        mov ax,perhoypos
        shl bx,PERHOYSPEED

        sub ax,bx
        jb noperhoychange
        mov perhoypos,ax
        cmp ax,PERHOYMAX
        jbe perhoyok
        mov ax,PERHOYMAX
perhoyok:
        mov perhoy,ax
noperhoychange:

        sub ax,ax
        xchg ax,cs:groundrotspeed
        add yrot,ax
        mov ax,yrot
        mov bx,ax
        neg bx
        add bx,(1 shl 15)
        shr bx,6
        add bx,bx
        mov cx,[offset sintab+bx]
        sar cx,3
        add cx,ax
        mov groundx,cx
        mov cx,[offset sintab+bx+512]
        sar cx,3
        mov groundy,cx


;--- draw the ground bitmap and fill the sky
        mov bx,yrot
        shr bx,6
        add bx,bx
        mov al,[offset sintab+bx+1]
        mov ah,[offset sintab+bx+513]
        mov siny,al
        mov cosy,ah

        push fs

        push fs
        pop es

        mov ax,envtab
        mov fs,ax

        mov di,100*256+XS
        mov bp,GROUNDHEIGHT
ground_1:
        mov ax,350
        mov bx,perhoy
        shr bx,3
        add bx,100+12*32
        mul bx

        div bp

        cmp ah,63               ;63
        ja ground_end

        push bp

        shr ax,7        ;7

        mov cx,ax

        imul cosy
        sar ax,6        ;7
        mov bp,ax
        shl ebp,16              ;ebp=Dx<<16

        imul dx,ax,-80

        mov ax,cx
        imul siny
        shl ax,1        ;##
        sub dx,ax
        shl edx,16              ;edx=x<<16

        mov ax,cx
        imul siny
        sar ax,6        ;7
        mov bp,ax               ;ebp=Dx<<16+Dy

        imul dx,ax,-80

        mov ax,cx
        imul cosy
        shl ax,1        ;##
        add dx,ax               ;edx=x<<16+y

        mov ax,groundx
        shl eax,16
        mov ax,groundy
        add edx,eax

        shr cx,3
        sub cx,9

        mov si,81

ground_2:
        mov bl,dh
        rol edx,16
        mov bh,dh
        rol edx,16
        and bh,127
        mov al,fs:[bx]

        sub al,cl

        add edx,ebp

        mov bl,dh
        rol edx,16
        mov bh,dh
        rol edx,16
        and bh,127
        mov ah,fs:[bx]

        sub ah,cl

        mov es:[di],ax
        add di,2

        add edx,ebp

        dec si
        jnz ground_2

        pop bp

        sub di,256+162
        dec bp
        jnz ground_1

ground_end:
        add bp,101-GROUNDHEIGHT
        mov di,bp
        shl di,8
        add di,XS-256

        mov dx,10 shl 8
        mov si,309+18+4
sky_1:

        mov al,dh
        mov ah,al
        mov cx,ax
        shl eax,16
        mov ax,cx
        mov cx,164/4
        rep stosd
        sub di,256+164

        cmp dh,31
        jae sky_2
        add dx,si
        sub si,10
sky_2:
        dec bp
        jnz sky_1

        pop fs

;--- move butterflies

        push ds
        pop es
        mov di,offset perhot
        mov si,offset perhot_orig
        mov loopcounter,MAXP-1

        mov bx,yrot
        shr bx,6
        add bx,bx
        mov cx,[offset sintab+bx]               ;bp=sin
        mov bp,[offset sintab+bx+512]           ;bx=cos
mb_1:
        mov ax,[si]
        imul cx
        mov bx,dx

        mov ax,[si+4]
        imul bp
        mov ax,dx

        add ax,bx
        add ax,ax
        stosw           ;x

        movzx bx,[di+4]
        add bl,128
        add bx,bx
        sub ax,ax
        movsx ax,[offset wingpos+bx+1]
        shl ax,5
        add ax,[si+2]
        stosw           ;y

        mov ax,[si+4]
        imul cx
        mov bx,dx

        mov ax,[si]
        imul bp
        mov ax,dx
        sub ax,bx
        sar ax,PZOOM-1

        add ax,ZPOSITION
        stosw           ;z

        mov al,wspeed
        add [di],al

        mov ax,yrot
        shr ax,8
        neg al

        mov [di+1],al  ;yrot

        add si,6
        add di,2
        dec loopcounter
        jnz mb_1

        sub ax,ax
        stosw

        movzx bx,[di+4]
        add bl,128
        add bx,bx
        sub ax,ax
        movsx ax,[offset wingpos+bx+1]
        shl ax,5
;        sub ax,29900
;        sub ax,29000

        mov cx,perhoy
        shr cx,1
        add cx,8000
        sub ax,cx

        stosw
        mov ax,ZPOSITION
        stosw
        mov al,wspeed
        add [di],al
        mov ax,yrot
        shr ax,8
        neg al
        mov [di+1],al

;--- calculate butterflies

        mov bx,offset perhot
        mov di,offset perho_p
        mov bp,MAXP
cb_1:
        push bx
        push bp
        mov si,offset perho_points
        mov cl,6

        movzx bp,byte ptr [bx+7]
        shl bp,3
        mov dl,ds:[offset sintab+bp+1]
        mov dh,ds:[offset sintab+bp+513]
cb_2:
        mov al,[si+1]
        imul dh
        add ax,[bx]
        stosw           ;x

        movsx ax,[si]
        shl ax,PZOOM
        add ax,[bx+2]
        stosw           ;y

        mov al,[si+1]
        imul dl
        sar ax,PZOOM
        add ax,[bx+4]

        stosw           ;z

        add si,2

        dec cl
        jnz cb_2

;wing tips

        movzx si,byte ptr [bx+6]
        add si,si
        add si,offset wingpos

;1
        mov al,-30
        imul dh
        mov bp,ax

        mov al,[si]
        imul dl
        add ax,bp
        add ax,[bx]
        stosw           ;x

        movsx ax,[si+1]
        shl ax,PZOOM
        add ax,[bx+2]
        stosw           ;y

        mov al,[si]
        imul dh
        mov bp,ax

        mov al,-30
        imul dl
        sub ax,bp
        sar ax,PZOOM
        add ax,[bx+4]
        stosw           ;z


;2
        mov al,30
        imul dh
        mov bp,ax

        mov al,[si]
        imul dl
        add ax,bp
        add ax,[bx]
        stosw           ;x

        movsx ax,[si+1]
        shl ax,PZOOM
        add ax,[bx+2]
        stosw           ;y

        mov al,[si]
        imul dh
        mov bp,ax

        mov al,30
        imul dl
        sub ax,bp
        sar ax,PZOOM
        add ax,[bx+4]
        stosw           ;z

        neg dl
        neg dh

        dec dl
        dec dh
;3
        mov al,30
        imul dh
        mov bp,ax

        mov al,[si]
        imul dl
        add ax,bp
        add ax,[bx]
        stosw           ;x

        movsx ax,[si+1]
        shl ax,PZOOM
        add ax,[bx+2]
        stosw           ;y

        mov al,[si]
        imul dh
        mov bp,ax

        mov al,30
        imul dl
        sub ax,bp
        sar ax,PZOOM
        add ax,[bx+4]
        stosw           ;z

;4
        mov al,-30
        imul dh
        mov bp,ax

        mov al,[si]
        imul dl
        add ax,bp
        add ax,[bx]
        stosw           ;x

        movsx ax,[si+1]
        shl ax,PZOOM
        add ax,[bx+2]
        stosw           ;y

        mov al,[si]
        imul dh
        mov bp,ax

        mov al,-30
        imul dl
        sub ax,bp
        sar ax,PZOOM
        add ax,[bx+4]
        stosw           ;z

        pop bp
        pop bx

        add di,4
        add bx,8
        dec bp
        jnz cb_1

;--- sort butterflies

        mov si,offset perhot+4
        mov di,offset perho_order
        mov cx,MAXP
        sub ax,ax
sb_1:
        mov bx,[si]
        mov [di],bx
        mov [di+2],ax
        inc ax

        add si,8
        add di,4

        dec cx
        jnz sb_1

;bubblesort!
        mov si,offset perho_order
        mov bp,MAXP-1
sb_2:
        mov di,si
        mov cx,bp
sb_3:
        mov ax,[di]
        cmp ax,[di+4]
        jae sb_4

        mov bx,[di+4]
        mov [di+4],ax
        mov [di],bx

        mov ax,[di+2]
        mov bx,[di+6]
        mov [di+6],ax
        mov [di+2],bx
sb_4:
        add di,4

        dec cx
        jnz sb_3

        add si,4

        dec bp
        jnz sb_2

;--- draw butterflies
        push gs

        mov ax,envtab
        mov gs,ax

        push fs
        pop es

        mov si,offset perho_order+2
        mov bp,MAXP
db_1:
        push si
        mov si,[si]
        shl si,6
        add si,offset perho_p

;body
        mov di,offset x1

        mov bx,[si+4]
;x1,x5
        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di],al
        mov [di+4*4],al

;y1,y5
        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+1],al
        mov [di+4*4+1],al

        add si,2

        mov bx,[si+4]
;x2
        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di+4],al
;y2
        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+4+1],al

        add si,2

        mov bx,[si+4]
;x3
        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di+8],al
;y3
        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+8+1],al

        add si,2

        mov bx,[si+4]
;x4
        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di+12],al
;y4
        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+12+1],al

        add si,2

;first wing
        mov di,offset bx1

        mov bx,[si+4]

        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di],al
        mov [di+4*4],al
        mov [di+5*4],al
        mov [di+5*4+4*4],al

        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+1],al
        mov [di+4*4+1],al
        mov [di+5*4+1],al
        mov [di+5*4+4*4+1],al

        add si,2

        mov bx,[si+4]

        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di+4],al
        mov [di+5*4+4],al

        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+4+1],al
        mov [di+5*4+4+1],al

        add si,2

        mov bx,[si+4]

        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di+8],al

        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+8+1],al

        add si,2

        mov bx,[si+4]

        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di+12],al

        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+12+1],al

        add si,2

;second wing
        mov bx,[si+4]

        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di+5*4+2*4],al

        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+5*4+2*4+1],al

        add si,2

        mov bx,[si+4]

        lodsw
        cwd
        idiv bx
        add al,XCENTER
        mov [di+5*4+3*4],al

        lodsw
        cwd
        add ax,perhoy
        adc dx,0
        idiv bx
        add ax,YCENTER
        test ah,ah
        jnz db_clip1

        mov [di+5*4+3*4+1],al


        push bp

        mov si,offset x1
        call quadorient
        push ax
        cmp ax,0
        jg db_firstfirst        ;jg

;second first
        mov si,offset cx1
        call quadorient
        call quadtext

        mov si,offset x1
        pop quador
        call quadtext

        mov si,offset bx1
        call quadorient
        call quadtext
        jmp db_2
db_firstfirst:
        mov si,offset bx1
        call quadorient
        call quadtext

        mov si,offset x1
        pop quador
        call quadtext

        mov si,offset cx1
        call quadorient
        call quadtext
db_2:

        pop bp

db_clip1:
        pop si
        add si,4

        dec bp
        jnz db_1

        pop gs

        cmp cs:escpressed,0
        jnz end_final
        cmp cs:clock,256
        jb end_main
        jmp main
end_main:

;--- test chaos
        push fs
        pop es
        mov di,XS
        mov bp,100
        sub ax,ax
tc_1:
        add di,160
        mov cx,(256-160)/2
        rep stosw
        dec bp
        jnz tc_1
        mov cx,5*256/2
        rep stosw

        mov bp,35
chaos:
        push bp

        call chaosfadeoff
        call bltscreen


        pop bp
        dec bp
        jnz chaos

part2:

;--- make environment map
        mov ax,envtab
        mov es,ax
        sub di,di
        mov bp,256
menv_1:
        mov cx,256
menv_2:
        push bp
        push cx
        push di

        sub bp,128
        sub cx,128
        shl bp,1        ;pit{isi ehk{ muuttaa
        shl cx,1        ;

        mov ax,bp
        imul ax
        mov bx,ax
        mov ax,cx
        imul ax
        add ax,bx
        sub ax,128*128
        jae menv_skipit
        neg ax
        movzx eax,ax
        push bp
        call sqrt_eax
        pop bp
;bx=cos(à)

        mov ax,-LX1
        imul cx
        mov si,ax

        mov ax,LZ1
        imul bx
        add ax,si

        sar ax,9

        test ax,ax
        jns jjji
        sub ax,ax
jjji:

        mov loopcounter,al

        cmp ax,31
        jle menv_ok
        mov ax,31
menv_ok:
        cmp ax,AMBIENT
        jge menv_ok2
menv_skipit:
        mov ax,AMBIENT
menv_ok2:

menv_store:

        pop di
        pop cx
        pop bp

        add al,32
        stosb

        dec cx
        jnz menv_2

        dec bp
        jnz menv_1


;--- make palette for vase
        mov si,offset pal2
        call makenewpalette

;--- The vase

        mov cs:clock,256*15     ;14 seconds
        mov cs:part,2
vase:

;--- update vase parameters

        mov bx,cs:vasepos
        and bx,1023
        add bx,bx

        mov ax,[offset sintab+bx]
        mov cx,ax
        sar ax,2
        sar cx,3
        add ax,cx
        mov vroty,ax

        mov ax,[offset sintab+bx+512]
        mov bx,ax
        sar ax,2
        sar bx,4
        add ax,bx
        mov vrotx,ax

        call do_vase

        call fadepalette
        call bltscreen

        cmp cs:escpressed,0
        jnz end_final
        cmp cs:clock,256
        ja vase
end_vase:

        mov cs:vasepos,0
        mov cx,512
faces:

        sub bx,bx
        xchg bx,cs:vasepos
        shl bx,6

        mov ax,vrotx
        sub ax,16384
        add ax,bx
        jb vrotx_ready
        add ax,16384
        mov vrotx,ax
        jmp vrotx_notready
vrotx_ready:
        mov loopcounter,1
vrotx_notready:

        mov ax,vroty
        sub ax,16384-808
        sub ax,bx
        jb vroty_ready
        add ax,16384-808
        mov vroty,ax
        jmp vroty_notready
vroty_ready:
        inc loopcounter
vroty_notready:

        cmp loopcounter,2
        je end_face

        push cx

        call do_vase
        call fadepalette
        call bltscreen
        cmp cs:escpressed,0
        jnz end_final

        pop cx
        loop faces
end_face:

        push ds
        pop es
        mov si,offset pal4
        mov di,offset red1
        mov cx,2*3*2/2
        rep movsw

        call makepalette

        mov cx,64+35
fadeandwait:
        push cx
        call wait_vsync
        call fadepalette
        cmp cs:escpressed,0
        jne end_final
        pop cx
        loop fadeandwait

        push ds

        mov ax,0a000h
        mov es,ax
        mov ds,ax
        mov bp,80
slidemain:
        call wait_vsync

        sub di,di
        mov dx,200
sl_1:
        mov si,di
        add si,2
        mov cx,160/2
        rep movsw

        std
        add di,160
        add si,156
        mov cx,160/2
        rep movsw
        cld

        add di,160

        dec dx
        jnz sl_1

        cmp cs:escpressed,0
        jnz end_final

        dec bp
        jnz slidemain

slide_end:

        pop ds


        push ds
        pop es
        mov si,offset pal5
        mov di,offset red1
        mov cx,2*3*2/2
        rep movsw

        call makepalette

;--- show logo
        mov ax,0a000h
        mov es,ax
        mov cx,30000
        sub bp,bp
dlmain:
        push cx
        push bp

        shr cx,3
        mov bp,30000/8+1
        sub bp,cx

        sub di,di
        mov loopcounter,200

        mov ax,-100
        imul bp
        mov dx,ax
        add dx,32768
;        sub dx,dx
dl_1:
        mov cx,320
        push dx

        mov ax,-159
        imul bp
        add ax,32768

        pop dx

;        sub ax,ax
        add dx,bp
dl_2:
        mov bh,dh
        mov bl,ah

        add ax,bp

        add bx,8*256+36

        and bh,15
        mov bl,[offset logo+bx]
;        add bl,2
        inc bl
        mov es:[di],bl
        inc di
        dec cx
        jnz dl_2

        dec loopcounter
        jnz dl_1


        pop bp

        test bp,1
        jz dl_nofade
        call fadepalette
dl_nofade:

        pop cx

        cmp cs:escpressed,0
        jne dl_end

        inc bp
        sub cx,bp

        cmp cx,20000
        ja dlmain

dl_end:

end_final:

;--- back to text mode
exit_textmode:
        mov ax,3
        int 10h
exit:

        mov ah,9
        mov dx,offset exitmsg
        int 21h

        push ds
        mov dx,oldkbdofs
        mov ds,oldkbdseg
        mov ax,02509h
        int 21h
        pop ds

        sub dx,dx
        call timer_rate

        push ds
        mov dx,oldtimerofs
        mov ds,oldtimerseg
        mov ax,02508h
        int 21h
        pop ds

        mov ax,4c00h
        int 21h

;
;--- wait for vertical retrace
;
wait_vsync:
        mov dx,3dah
        in al,dx
        and al,8
        jnz wait_vsync
vsync:
        in al,dx
        and al,8
        jz vsync
        ret

;
;--- return a random number at ax
;
random:

        mov ax,seed1
        mov cx,seed2
        add ax,cx
        rol ax,cl
;        add cx,01234h
        add cx,07155h
        ror cx,1
        mov seed1,ax
        mov seed2,cx
        ret

;
;--- check the orientation of a quad
;
quadorient:
        mov al,[si+1]   ;al=y1
        sub al,[si+5]   ;al=y1-y2
        mov ah,[si+8]   ;ah=x3
        sub ah,[si+4]   ;ah=x3-x2
        imul ah
        mov bx,ax       ;bx=(y1-y2)*(x3-x2)

        mov al,[si]     ;al=x1
        sub al,[si+4]   ;al=x1-x2
        mov ah,[si+9]   ;ah=y3
        sub ah,[si+5]   ;ah=y3-y2
        imul ah
        sub ax,bx       ;ax=(x1-x2)*(y3-y2)-(y1-y2)*(x3-x2)

        mov quador,ax
        ret

qt_endquad:
        ret
;
;--- draw a texture mapped quad (si->x1)
;
quadtext:

;calculate highest point and the quad height
        mov al,[si+1]           ;al=y1
        mov ah,[si+5]           ;ah=y2
        mov bl,[si+9]           ;bl=y3
        mov bh,[si+13]          ;bh=y4

        cmp al,ah
        jb qt_s1
        xchg al,ah
qt_s1:
        cmp bl,bh
        jb qt_s2
        rol bx,8
qt_s2:
        cmp ah,bl
        jb qt_s4
        xchg ah,bl
        cmp al,ah
        jb qt_s3
        xchg al,ah
qt_s3:
        cmp bl,bh
        jb qt_s4
        rol bx,8
qt_s4:

;--- clip highest and lowest
        cmp al,YS+100
        jae qt_endquad

        cmp bh,YS
        jbe qt_endquad

        cmp al,YS
        jae qt_s5
        mov al,YS
qt_s5:
        cmp bh,YS+100
        jb qt_s6
        mov bh,YS+100
qt_s6:


        movzx bx,bh
        movzx bp,al
        sub bx,bp
        inc bx
        mov height,bx
        mov highest,bp

        mov loopcounter,4

qt_line:

        sub ax,ax
        mov ah,[si+4]                   ;ax=x2<<8
        sub bx,bx
        mov bh,[si]                     ;bx=x1<<8
        sub ax,bx

        movzx di,[si+4+1]               ;di=y2
        movzx cx,[si+1]                 ;cx=y1
        sub di,cx                       ;di=ycounter            %
        jnz qt_nothoriz

        mov al,bh               ;ax=x2<<8+x1
        add ah,al

        mov bx,cx
        add bx,offset xl+XLSTART

        mov cx,[si+2]
        mov dx,[si+6]

        cmp al,ah
        je qt_endline
        jb qt_1
        xchg al,ah
        xchg cx,dx
qt_1:

        cmp quador,0
        jl qt_leftisleft


        mov [bx],ah
        mov [bx+1024*1],dl
        mov [bx+1024*2],dh

        mov [bx+1024*3],al
        mov [bx+1024*4],cl
        mov [bx+1024*5],ch

        jmp qt_endline

qt_leftisleft:

        mov [bx],al
        mov [bx+1024*1],cl
        mov [bx+1024*2],ch

        mov [bx+1024*3],ah
        mov [bx+1024*4],dl
        mov [bx+1024*5],dh

        jmp qt_endline

qt_nothoriz:


        push si

        push cx                                         ;1: y
        mov cx,bx                               ;cx=x           %

        mov bx,di
        mov bh,ah
        add bl,bl
        push word ptr fs:[bx+YDIVX]                     ;2: Dx

        sub ax,ax
        mov ah,[si+4+3]                 ;ax=v2<<8
        sub bx,bx
        mov bh,[si+3]                   ;bx=v1<<8
        sub ax,bx
        push bx                                         ;3: v

        mov bx,di
        mov bh,ah
        add bl,bl
        mov bp,fs:[bx+YDIVX]                    ;bp=Dv          %

        sub dx,dx
        mov dh,[si+4+2]                 ;ax=u2<<8
        sub ax,ax
        mov ah,[si+2]                   ;bx=u1<<8
        sub dx,ax

        mov bx,di
        mov bh,dh
        add bl,bl
        mov dx,fs:[bx+YDIVX]

        shl edx,16
        mov dx,bp                               ;edx=Du<<16+Dv  %

        shl eax,16                              ;eax=u<<16      %

        pop ax                                  ;eax=u<<16+v    %

        pop si                                  ;si=Dx          %

        pop bx                                  ;bx=y           %

        add bx,offset xl+XLSTART                ;bx->xl[y]


        test di,di
        jns qt_innerloopstart
        dec di
qt_neginnerloop:
        mov [bx],ch
        mov [bx+1024*2],ah
        rol eax,16
        mov [bx+1024*1],ah
        rol eax,16

        sub cx,si
        sub eax,edx

        dec bx
        inc di
        jnz qt_neginnerloop
        jmp qt_endloop

qt_innerloopstart:
        inc di
        add bx,1024*3
qt_innerloop:
        mov [bx],ch
        mov [bx+1024*2],ah
        rol eax,16
        mov [bx+1024*1],ah
        rol eax,16

        add cx,si
        add eax,edx

        inc bx
        dec di
        jnz qt_innerloop
qt_endloop:

        pop si          ;->x1


qt_endline:

        add si,4

        dec loopcounter
        jnz qt_line


;--- check the orientation of the quad
        cmp quador,0
        jl qt_clockwise
;        jmp qt_clockwise

;--- counter-clockwise
        push ds

        mov si,highest                  ;esi=y
        shl esi,16
        mov si,height                   ;esi=y<<16+ycounter

        push ds
        pop es
        push fs
        pop ds

qt_fill2:

        rol esi,16

        movzx di,byte ptr es:[si+offset xl+XLSTART+1024*3]
        movzx dx,byte ptr es:[si+offset xl+XLSTART]
        sub dx,di                       ;dx=xcounter
        jb qt_dontfill2
        inc dx

        mov ax,si
        shl ax,8
        add di,ax                       ;di=(y<<8+x)pos
        sub di,256*YS

        mov bh,es:[si+offset xl+XLSTART+1024*2]              ;bx=v2<<8
        sub cx,cx
        mov ch,es:[si+offset xl+XLSTART+1024*5]              ;cx=v1<<8
        sub bh,ch

        shl ecx,16                      ;ecx=v<<16

        mov bl,dl
        add bl,bl
        mov bp,[bx+YDIVX]
        shl ebp,16                      ;ebp=Dv<<16

        mov bh,es:[si+offset xl+XLSTART+1024*1]              ;bx=u2<<8
        mov ch,es:[si+offset xl+XLSTART+1024*4]              ;ecx=v<<16+u<<8
        sub bh,ch

        mov bl,dl
        add bl,bl
        mov bp,[bx+YDIVX]            ;ebp=Dv<<16+Du

qt_innerfill2:
        mov bl,ch
        rol ecx,16
        mov bh,ch
        rol ecx,16
        mov al,gs:[bx]
        add ecx,ebp

        test al,al
        jz qt_dontdraw2
        mov [di],al
qt_dontdraw2:
        inc di
        dec dx
        jnz qt_innerfill2

qt_dontfill2:

        inc si

        rol esi,16
        dec si
        jnz qt_fill2

        pop ds
        ret

;--- clockwise
qt_clockwise:


        push ds

        mov si,highest                  ;esi=y
        shl esi,16
        mov si,height                   ;esi=y<<16+ycounter

        push ds
        pop es
        push fs
        pop ds

qt_fill:

        rol esi,16

        movzx di,byte ptr es:[si+offset xl+XLSTART]
        movzx dx,byte ptr es:[si+offset xl+XLSTART+1024*3]
        sub dx,di                       ;dx=xcounter
        jb qt_dontfill
        inc dx

        mov ax,si
        shl ax,8
        add di,ax                       ;di=(y<<8+x)pos
        sub di,256*YS

        mov bh,es:[si+offset xl+XLSTART+1024*5]              ;bx=v2<<8
        sub cx,cx
        mov ch,es:[si+offset xl+XLSTART+1024*2]              ;cx=v1<<8
        sub bh,ch

        shl ecx,16                      ;ecx=v<<16

        mov bl,dl
        add bl,bl
        mov bp,[bx+YDIVX]
        shl ebp,16                      ;ebp=Dv<<16

        mov bh,es:[si+offset xl+XLSTART+1024*4]              ;bx=u2<<8
        mov ch,es:[si+offset xl+XLSTART+1024*1]              ;ecx=v<<16+u<<8
        sub bh,ch

        mov bl,dl
        add bl,bl
        mov bp,[bx+YDIVX]            ;ebp=Dv<<16+Du

qt_innerfill:
        mov bl,ch
        rol ecx,16
        mov bh,ch
        rol ecx,16
        mov al,gs:[bx]
        add ecx,ebp

        test al,al
        jz qt_dontdraw
        mov [di],al
qt_dontdraw:
        inc di
        dec dx
        jnz qt_innerfill

qt_dontfill:

        inc si

        rol esi,16
        dec si
        jnz qt_fill

        pop ds

        ret

;
;--- fade one step closer to new palette
;
fadepalette:
        mov di,offset oldpalette
        sub bx,bx
        mov cx,256*3
fp_1:
        mov al,[di]
        mov ah,[di+256*3]
        cmp al,ah
        jne fp_3
        inc bx
        jmp fp_skip
fp_3:
        jb fp_2
        sub al,2
fp_2:
        inc al
        mov [di],al
fp_skip:
        inc di

        dec cx
        jnz fp_1

        cmp bx,256*3
        jae fp_end

        mov dx,3c8h
        sub al,al
        out dx,al
        inc dx
        mov si,offset oldpalette
        mov cx,256*3
fp_5:
        lodsb
        out dx,al
        dec cx
        jnz fp_5

fp_end:

        ret

chaosfadeoff:
        mov di,XS
        sub bp,bp
cha_1:
;        sub dx,dx
        mov dx,XS
cha_2:

        mov ax,bp
        shl ax,CHAOSZOOM
        add ax,bp
        add ax,dx
        shr ax,CHAOSZOOM
        mov bh,al

        mov ax,dx
        shl ax,CHAOSZOOM
        add ax,dx
        sub ax,bp
        shr ax,CHAOSZOOM
        mov bl,al

        cmp bh,100
        jbe cha_clip
        mov bh,100
cha_clip:

        mov si,bx
        mov bx,fs:[si]
        mov al,gs:[bx]
        mov bx,fs:[si+256]
        mov ah,gs:[bx]
        mov bx,ax
        mov al,gs:[bx]

        stosb

        inc dx
        cmp dx,160+XS
        jb cha_2

        add di,256-160

        inc bp
        cmp bp,100
        jb cha_1
        ret

makenewpalette:
        push ds
        pop es
        mov di,offset red1
        mov cx,2*3*2/2
        rep movsw

        mov di,offset oldpalette
        mov cx,256*3
        mov al,63
        rep stosb

        call makepalette
        ret

;
;--- create a palette
;
makepalette:
        mov di,offset red1
	call getpaldeltas
        mov di,offset palette
        call mploop
        push di
        call makehighlight

        mov di,offset red3
        call getpaldeltas
        pop di
        call mploop
        call makehighlight

        mov si,offset palette+3
        mov di,64*3
        mov bp,16
mp_1:
        mov ah,[si]

        mov dl,[si+1]

        mov dh,[si+2]

        add si,6
        push si
        mov si,offset palette+32*3+3

        mov cx,12


mp_2:
        lodsb
        add al,ah
        mov bl,al
        cmp bl,63
        jbe mp_fix1
        mov bl,63
mp_fix1:

        lodsb
        add al,dl
        mov bh,al
        cmp bh,63
        jbe mp_fix2
        mov bh,63
mp_fix2:

        lodsb
        add al,dh
        cmp al,63
        jbe mp_fix3
        mov al,63
mp_fix3:

        mov [offset palette+di],bl
        mov [offset palette+di+1],bh
        mov [offset palette+di+2],al
        add di,3

        add si,6

        loop mp_2

        pop si

        dec bp
        jnz mp_1

;make the colorsum table

        push gs
        pop es
        sub di,di
        mov bp,256
mp_3:
        mov ax,bp
        call getweights
        mov bx,ax

        mov cx,256
mp_4:
        mov ax,cx
        call getweights
        add ax,bx

        test ah,ah
        jnz mp_5
        shr al,1
        jmp mp_7
mp_5:
        test al,al
        jnz mp_6
        mov al,ah
        shr al,1
        add al,32
        jmp mp_7
mp_6:

        mov dh,ah
        mov dl,12
        shr al,2        ;2
        mul dl
        xchg al,dh      ;dh=first*12, al=second
        mov dl,6        ;6
        div dl

        add al,dh

        add al,64       ;!!!
mp_7:

        stosb

        loop mp_4

        dec bp
        jnz mp_3

        ret

getweights:
        neg al
        sub ah,ah

        cmp ax,32
        jb gw_done

        cmp ax,64
        jae gw_2
        xchg al,ah
        sub ah,32
        jmp gw_done
gw_2:
        sub ax,64
        mov dl,12
        div dl
        mov dl,ah
        add ah,ah
        add ah,dl

        add al,al

gw_done:

        ret

makehighlight:

        mov cx,HIGHLIGHTSIZE
        mov si,offset highlight+HIGHLIGHTSIZE
hl_1:
        dec si
        mov ah,[si]
        mov dx,3
hl_2:
        dec di

        mov al,[di]
        add al,ah
        cmp al,63
        jbe dontclipcolor
        mov al,63
dontclipcolor:
        mov [di],al

        dec dx
        jnz hl_2

        loop hl_1

        ret

mploop:
        mov loopcounter,32
mpl_1:

        mov [di],bh
        inc di
        mov [di],ch
        inc di
        mov [di],ah
        inc di
        add bx,bp
        add cx,si
        add ax,dx

        dec loopcounter
        jnz mpl_1

        ret

getpaldeltas:

        sub ax,ax
        mov ah,[di+1]
        mov bp,ax               ;bp=red2

        sub bx,bx
        mov bh,[di]             ;bx=red1
        sub bp,bx
        sar bp,5                ;bp=deltared

        mov ah,[di+3]
        mov si,ax               ;si=green2

        sub cx,cx
        mov ch,[di+2]           ;cx=green1
        sub si,cx
        sar si,5                ;si=deltagreen

        mov ah,[di+5]
        mov dx,ax               ;dx=blue2

        mov ah,[di+4]           ;ax=blue1
        sub dx,ax
        sar dx,5                ;dx=deltablue
	ret

;
;--- blit virtual screen to video memory
;
bltscreen:
        push ds
        push es

        mov ax,0a000h
        mov es,ax
        push fs
        pop ds
        mov si,XS
        sub di,di
        mov bp,100            ;-4
blt1:
        mov cx,160
blt2:
        mov bx,[si]
        mov bh,gs:[bx]          ;@
        mov dl,bh
        mov es:[di],bx

        mov ax,[si+256]
        mov bh,al
        mov bl,gs:[bx]          ;@
        mov es:[di+320],bl

        mov bl,ah
        mov bl,gs:[bx]          ;@
        mov bh,dl
        mov al,gs:[bx]          ;@
        mov es:[di+321],al

        add di,2
        inc si

        dec cx
        jnz blt2

        add di,320
        add si,256-160

        dec bp
        jnz blt1

        pop es
        pop ds
        ret

;
;--- set the timer interrupt rate
;
timer_rate:
        cli
        mov al,00110110b
        out 43h,al
        jmp $+2
        mov al,dl
        out 40h,al
        jmp $+2
        mov al,dh
        out 40h,al
        jmp $+2
        sti
        ret

;
;--- take the square root of ebx and place it to eax
;
sqrt_eax:
        mov ebp,040000000h
        sub esi,esi
sqrt:
        mov ebx,ebp
        add ebx,esi
        cmp ebx,eax
        jbe sqrt_1
        shr esi,1
        jmp sqrt_2
sqrt_1:
        sub eax,esi
        sub eax,ebp
        shr esi,1
        or esi,ebp
sqrt_2:
        shr ebp,2
        jnz sqrt

        mov ebx,esi

        cmp ebx,eax           ;round the result..
        jae sqrt_3
        inc ebx
sqrt_3:                 ;..not necessary here?
        ret

;
;--- timer interrupt, invoked 256 times per second
;
timerint:
        mov cs:save_ax,ax

        dec word ptr cs:clock
        test cs:part,1
        jz t_notpart1

;update part1 parameters
        add cs:wingspeed,3              ;3
        add cs:groundrotspeed,31        ;31

t_notpart1:
        test cs:part,2
        jz t_notpart2
        inc cs:vasepos
t_notpart2:
        mov al,20h
        out 20h,al
        mov ax,cs:save_ax
        sti
        iret

ALIGN 2
save_ax                 dw 0
clock                   dw 0
groundrotspeed          dw 0
vasepos                 dw 0
escpressed              db 0
wingspeed               db 0
part                    db 0

;
;--- keyboard interrupt
;
kbdint:
        mov cs:save_ax,ax
        in al,60h
        cmp al,KBD_ESC
        jne not_esc
        mov byte ptr cs:escpressed,1
not_esc:
        mov al,20h
        out 20h,al
        mov ax,cs:save_ax
        iret

do_vase:
;--- blit background
        push fs
        pop es
        mov di,XS
        mov bp,101
        sub eax,eax
bbb_1:
        mov cx,164/4
        rep stosd
        add di,256-164
        dec bp
        jnz bbb_1

;--- rotate vase
        push ds
        pop es
        mov bx,vrotx
        shr bx,6
        add bx,bx
        mov dh,[offset sintab+bx+1]     ;dh=sinx
        mov ch,[offset sintab+bx+512+1] ;ch=cosx

        mov bx,vroty
        shr bx,6
        add bx,bx
        mov dl,[offset sintab+bx+1]     ;dx=sinx<<8+siny
        mov cl,[offset sintab+bx+512+1] ;cx=cosx<<8+cosy

        mov si,offset vase_orig
        mov di,offset vase_p

        mov bp,VASEPSIZE/3
rv_1:
        mov al,[si+2]
        imul dh
        mov bx,ax

        mov al,[si+1]
        imul ch
        add ax,bx
        sar ax,7

        imul dl
        mov bx,ax

        mov al,[si]
        imul cl
        add ax,bx
        mov [di],ax     ;x

        mov al,[si+2]
        imul ch
        mov bx,ax

        mov al,[si+1]
        imul dh
        sub ax,bx
        mov [di+2],ax   ;y

        add si,3
        add di,6
        dec bp
        jnz rv_1

;--- draw vase
        push gs
        mov ax,envtab
        mov gs,ax

        mov si,offset vase_p
        mov bp,VASEPNUM-1
dv_1:
        push bp

        mov ax,[si+15*6]
        sar ax,7
        add al,XCENTER+VASEX
        mov x2,al

        mov ax,[si+15*6+2]
        sar ax,7
        add ax,YCENTER+VASEY
        test ah,ah
        jnz dv_clip
        mov y2,al

        mov ax,[si+VASEPSIZE+15*6]
        sar ax,USHIFT
        add al,128
        mov u2,al

        mov ax,[si+VASEPSIZE+15*6+2]
        sar ax,VSHIFT
        add al,128
        mov v2,al

        mov ax,[si+16*6+15*6]
        sar ax,7
        add al,XCENTER+VASEX
        mov x3,al

        mov ax,[si+16*6+15*6+2]
        sar ax,7
        add ax,YCENTER+VASEY
        test ah,ah
        jnz dv_clip
        mov y3,al

        mov ax,[si+VASEPSIZE+16*6+15*6]
        sar ax,USHIFT
        add al,128
        mov u3,al

        mov ax,[si+VASEPSIZE+16*6+15*6+2]
        sar ax,VSHIFT
        add al,128
        mov v3,al

        mov bp,16
dv_2:
        push bp

;1
        mov ax,word ptr [offset x2]
        mov word ptr [offset x1],ax
        mov word ptr [offset x5],ax

        mov ax,word ptr [offset u2]
        mov word ptr [offset u1],ax
        mov word ptr [offset u5],ax
;4
        mov ax,word ptr [offset x3]
        mov word ptr [offset x4],ax

        mov ax,word ptr [offset u3]
        mov word ptr [offset u4],ax
;2
        mov ax,[si]
        sar ax,7
        add al,XCENTER+VASEX
        mov x2,al

        mov ax,[si+2]
        sar ax,7
        add ax,YCENTER+VASEY
        test ah,ah
        jnz dv_clip
        mov y2,al

        mov ax,[si+VASEPSIZE]
        sar ax,USHIFT
        add al,128
        mov u2,al

        mov ax,[si+VASEPSIZE+2]
        sar ax,VSHIFT
        add al,128
        mov v2,al
;3
        mov ax,[si+16*6]
        sar ax,7
        add al,XCENTER+VASEX
        mov x3,al

        mov ax,[si+16*6+2]
        sar ax,7
        add ax,YCENTER+VASEY
        test ah,ah
        jnz dv_clip
        mov y3,al

        mov ax,[si+VASEPSIZE+16*6]
        sar ax,USHIFT
        add al,128
        mov u3,al

        mov ax,[si+VASEPSIZE+16*6+2]
        sar ax,VSHIFT
        add al,128
        mov v3,al

        push si

        mov si,offset x1
        call quadorient
        test ax,ax
        jns eipas
juupas:
        mov si,offset x1
        call quadtext
eipas:

        pop si

dv_clip:
        add si,6

        pop bp
        dec bp
        jnz dv_2

        pop bp
        dec bp
        jnz dv_1

        pop gs

;--- make background
        push ds

        push fs
        pop ds
        mov di,XS
        mov bp,101
mmb_1:
        mov cx,161
mmb_2:
        cmp byte ptr [di],0
        jne mmb_3
        mov ax,cx
        xor ax,bp
        and al,15

        cmp byte ptr [di+LX1],0
        jne mmb_4
        add al,7
mmb_4:
        mov [di],al
mmb_3:
        inc di

        dec cx
        jnz mmb_2

        add di,256-161

        dec bp
        jnz mmb_1

        pop ds
        ret

END

