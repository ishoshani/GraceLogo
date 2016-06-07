//Ido Shoshani
//An attempt at Creating a dialect by following the LOGO example in Graceful Dialects
//We purposefully do not include the standard Prelude
dialect "dialect"
import "objectdraw" as od
inherit prelude.methods
class Uninit{
    method ==(other){
        if(self.isMe(other))then{return true}
        return false
    }
}  
def notInitialized is readable = Uninit
var location is public := notInitialized
var heading is readable := notInitialized
var nib: Boolean is public := false
var GA is readable := notInitialized
var C := notInitialized

method lazyInitLocation (point){
    if(notInitialized==location)then{location:=point}
}
method lazyInitHeading(n){
    if(notInitialized==heading)then{setHeading(n)}
}
method lazyInitAppSize(x,y){
    if(notInitialized==GA)then{
        GA := od.graphicApplicationSize(x@y)
        C := GA.canvas
    }
}
method left(degree:Number){
    lazyInitHeading(270)
    heading :=heading+ asAngle(degree)
}
method right(degree:Number){
    lazyInitHeading(270)
    heading := heading - asAngle(degree)
}
method asAngle(degree:Number){
    def A=degree.abs%360
    print(A)
    if(degree < 0)then{
        print("negative anlge")
        return A
    }else{
       return 360-A
    }
}
method setHeading(degree:Number){
    heading := asAngle(degree)
}
method nibSwitch{
    nib := !nib
}
method setNib(on:Boolean){
    nib := on
}
method toRadians(degree:Number){
    return (degree/180 * π)%(π *2)
}
method toDegrees(radians:Number){
    return (radians/π * 180)%360
}
method moveForward(n:Number){
    lazyInitLocation(250@250)
    lazyInitAppSize(500, 500)
    lazyInitHeading(0)

    
    var nx:= location.x + (toRadians(heading)).cos * n
    var ny:= location.y + (toRadians(heading)).sin * n

    if {nib} then {od.lineFrom(location)to(nx@ny)on(C)}
   
    location := nx@ny
}
method show{
    lazyInitAppSize(500, 500)
    lazyInitHeading(0)
    lazyInitLocation(250@250)
    GA.startGraphics
}
//End Of New Methods
def Allowed = list(["Number","Boolean","String","Point"])

fail "classes are not allowed at this level" // this rule will fail the tests as is! make sure to import into tests rather than dialect in
     when {m : Method -> m.isClass}
fail "declaring new methods in the dialect are still not done, sorry!"
    when {m : Method -> true}
fail "please declare Vars as Number,Boolean,String, or Point"
    when {n : Var -> (Allowed.contains(n.decType.value).not)}    
fail "please declare your defs as Number,Boolean,String, or Point"
    when {n : Def -> (Allowed.contains(n.decType.value).not)}   

method checker(code) is public{
    check(code)
}
