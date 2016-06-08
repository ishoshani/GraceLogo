//Ido Shoshani
//An attempt at Creating a dialect by following the LOGO example in Graceful Dialects
//We purposefully do not include the standard Prelude
dialect "dialect"
import "objectdraw" as od
inherit prelude.methods
def notInitialized is readable = object{
    method ==(other){
        if(self.isMe(other))then{return true}
        return false
    }
}  
var _location := notInitialized
var _heading  := notInitialized
var nib: Boolean is public := false
var _GA := notInitialized
var _C := notInitialized

method location{
    if(notInitialized==_location)then{_location:=250@250}
    return _location
}
method location:=(n:Point){
    _location := n
}
method heading{
    if(notInitialized==_heading)then{_heading:=0}
    return _heading
}
method heading:=(degree:Number){
    _heading := asAngle(degree)
}
method GA{
    if(notInitialized==_GA)then{
        _GA := od.graphicApplicationSize(500@500)
        _C := GA.canvas
    }
    return _GA
}
method C{
    if(notInitialized==_GA)then{
        _GA := od.graphicApplicationSize(500@500)
        _C := GA.canvas
    }
    return _C
}
method left(degree:Number){

    _heading := heading+ asAngle(degree)
}
method right(degree:Number){
 
    _heading := heading - asAngle(degree)
}
method asAngle(degree:Number){
    def A=degree.abs%360
    if(degree < 0)then{
        return 360-A
    }else{
       return A
    }
}

method toRadians(degree:Number){
    return (degree/180 * π)%(π *2)
}
method toDegrees(radians:Number){
    return (radians/π * 180)%360
}
method moveForward(n:Number){
   

    
    var nx:= location.x + (toRadians(heading)).cos * n
    var ny:= location.y + (toRadians(heading)).sin * n

    if {nib} then {od.lineFrom(location)to(nx@ny)on(C)}
   
    location := nx@ny
}
method show{

    GA.startGraphics
}
//End Of New Methods
def Allowed = list(["Number","Boolean","String","Point"])

fail "classes are not allowed at this level" // this rule will fail the tests as is! make sure to import into tests rather than dialect in
    when {m : Method -> m.isClass}
//fail "declaring new methods in the dialect are still not done, sorry!"
 //  when {m : Method -> true}
fail "please declare Vars as Number,Boolean,String, or Point"
    when {n : Var -> (Allowed.contains(n.decType.value).not)}    
fail "please declare your defs as Number,Boolean,String, or Point"
    when {n : Def -> (Allowed.contains(n.decType.value).not)}   

method checker(code) is public{
    check(code)
}
