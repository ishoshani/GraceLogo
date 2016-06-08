dialect "logoDialect"
show // creates our 500 by 500 window, and starts the turtle at 250,250, with initial heading 270
right(90)
nib:=true //turns on the nib, since it starts at off
moveForward(50)
nib:=nib.not
right(90)
moveForward(50)
left(90)
nib:=nib.not
moveForward(50)