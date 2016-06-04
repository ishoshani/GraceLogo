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
var location is readable := notInitialized
var heading is readable := notInitialized
var nib: Boolean is readable := false
var GA is readable := notInitialized
var C := notInitialized

method lazyInitLocation (point){
   if(notInitialized==location)then{location:=point}
}
method lazyInitHeading(n){
    if(notInitialized==heading)then{heading:=n}
}
method lazyInitAppSize(x,y){
    if(notInitialized==GA)then{
        GA := od.graphicApplicationSize(x@y)
        C := GA.canvas
    }
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
    return (degree/180 * π)%(π *2)
}
method toDegrees(radians:Number){
    return (radians/π * 180)%360
}
method moveForward(n:Number){
    lazyInitLocation(250@250)
    lazyInitAppSize(500, 500)
    def nx= location.x + (toRadians(heading)).cos * n
    def ny= location.y + (toRadians(heading)).sin * n
    if {nib} then {od.lineFrom(location)to(nx@ny)on(C)}
    location := nx@ny
}
method show{
    lazyInitAppSize(500, 500)
    lazyInitHeading(270)
    lazyInitLocation(250@250)
    GA.startGraphics
}
//End Of New Methods
type testClass={}

fail "classes are not allowed at this level" // this rule will fail the tests as is! make sure to import into tests rather than dialect in
    when {n : Method -> n.isClass}
fail "please declare as numbers, booleans, and string are allowed at this level"
    when {n : Var -> 
        if((n.decType.value != "Number") && (n.decType.value!= "Boolean") && (n.decType.value != "String"))then{
            fail("please declare variables as Numbers, Booleans, and String are allowed at this level")
            true
        }
        false       
    }
fail "please declare as numbers, booleans, and string are allowed at this level"
    when {n : Def -> 
        if((n.decType.value != "Number") && (n.decType.value!= "Boolean") && (n.decType.value != "String"))then{
            fail("please declare defined identifiers as Numbers, Booleans, and String are allowed at this level")
            true
        }
        false       
    }
method checker(code){
    check(code)
}
