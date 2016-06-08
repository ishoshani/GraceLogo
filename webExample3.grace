dialect "logoDialect"
method DrawSquareSize(n:Number)TopLeft(place){
    location:=place
    heading := 0
    var i : Number := 0
    nib:=true
    while{i < 4}do{
        moveForward(n)
        right(90)
        i := i+1
    }
}
show
right(47)
nib:=true
moveForward (90)
DrawSquareSize(60)TopLeft(300@400)
