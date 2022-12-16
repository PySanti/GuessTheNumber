Program GUESSTHENUMBER;
uses crt;

var
    lastDirection,initialX, initialY, maxX, currentAnimation : integer;

procedure drawCharPatas();
begin
    if (lastDirection = 0) then
        begin
            write('/ \');
        end
    else 
        begin
            if (currentAnimation = 0) then
                begin
                    write('/ \');
                end
            else if (currentAnimation = 1) then
                begin
                    write(' |');
                end;
        end
end;

procedure moveRight(var currentXpos : integer);
begin
    currentXpos := currentXpos + 1;
end;

procedure moveLeft(var currentXpos : integer);
begin
    currentXpos := currentXpos - 1;
end;

procedure drawCharTorso();
begin
    if (lastDirection = 0) then
        begin
            write('l|l');
        end
    else 
        begin
            if (currentAnimation = 0) then
                begin
                    write('/|\');
                end
            else if (currentAnimation = 1) then
                begin
                    write(' |');
                end;
        end
end;

procedure drawCharacter(currentXpos : integer);
begin
    gotoxy(currentXpos+initialX, initialY-2);
    write(' 0');
    gotoxy(currentXpos+initialX, initialY-1);
    drawCharTorso();
    gotoxy(currentXpos+initialX, initialY);
    drawCharPatas()
end;

procedure drawGrass();
begin
    write(',')
end;

procedure drawMap();
var
    i : integer;
begin
    i := 0;
    textColor(2);
    while (i < maxX) do
        begin
            gotoxy(initialX+i,initialY);
            drawGrass();
            i := i + 1;
        end;
    textColor(15);
end;

procedure updateAnimationIndex(direction : integer);
begin
    if (lastDirection <> direction) then
        begin
            currentAnimation := 0;
        end
    else
        begin
        currentAnimation := currentAnimation + 1;
        if (currentAnimation > 1) then
            begin 
                currentAnimation := 0;
            end
        end;
end;

procedure mainLoop();
var
    letter : char;
    currentXpos : integer;
begin
    currentXpos := 2;
    while True do
        begin
            clrscr();
            drawMap();
            drawCharacter(currentXpos);
            gotoxy(1,1);
            letter := readKey();
            if (letter = 'd') then
                begin
                    updateAnimationIndex(1);
                    moveRight(currentXpos);
                    lastDirection :=1;
                end
            else if (letter = 'a') then
                begin
                    updateAnimationIndex(-1);
                    moveLeft(currentXpos);
                    lastDirection :=-1;
                end
            else if (letter = 'q') then
                begin
                    break;
                end;
            writeln('Posicion actual en x ',currentXpos);
        end;
end;

begin

    initialX := 20;
    initialY := 40;
    maxX := 120;
    lastDirection := 0;
    clrScr();
    mainLoop();
end.
