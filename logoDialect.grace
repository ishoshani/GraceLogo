//Ido Shoshani
//An attempt at Creating a dialect by following the LOGO example in Graceful Dialects
//We purposefully do not include the standard Prelude
dialect "dialect"
import "objectdraw" as od
import "math" as mt
inherit prelude.methods
var location is readable := "nope"
var heading is readable := "nope"
var nib: Boolean is readable := false
var GA is readable:= "nope"
var C := "nope"
method lazyInitLocation (point){
    if(location=="nope")then{location:=point}
}
method lazyInitHeading(n){
    if(heading=="nope")then{heading:=n}
}
method lazyInitAppSize(x,y){
    if("nope"==GA)then{
        GA := od.graphicApplicationSize(x@y)
        C := GA.canvas}
}
method left(degree:Number){
    lazyInitHeading(270)
    heading :=heading+ (degree%360)
}
method right(degree:Number){
    lazyInitHeading(270)
    heading := heading - (degree%360)
}
method setAngle(degree:Number){
    heading := (degree%360)
}
method nibSwitch{
    nib := !nib
}
method setNib(on:Boolean){
    nib := on
}
method toRadians(degree:Number){
    return (degree/180 * mt.pi)%(mt.pi *2)
}
method toDegrees(radians:Number){
    return (radians/mt.pi * 180)%360
}
method moveForward(n:Number){
    lazyInitLocation(250@250)
    lazyInitAppSize(500,500)
    def nx= location.x + mt.cos(toRadians(heading)) * n
    def ny= location.y + mt.sin(toRadians(heading)) * n
    if {nib} then {od.lineFrom(location)to(nx@ny)on(C)}
    location := nx@ny
}
method show{
    lazyInitAppSize(500,500)
    lazyInitHeading(270)
    lazyInitLocation(250@250)
    GA.startGraphics
}

