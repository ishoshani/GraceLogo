dialect "LogoDialect"
import "gUnit" as gU
import "math" as mt
def logoTest = object {
    class forMethod(m){
        inherits gU.testCaseNamed(m)
    
        method testIsNotInitialized{
            assert(location) shouldBe(notInitialized)
            assert(heading) shouldBe(notInitialized)
            assert(GA) shouldBe(notInitialized)
        }
        method hasLocationandHeading{
            moveForward(0)
            assert(location) shouldBe(250@250)
            assert(heading) shouldBe (0)
            deny(notInitialized==heading)
        }
        method testGrapicsWork{
            show
            deny(notInitialized==GA)
        }
        method testMoveForward{
            assert(location) shouldBe(250@250)
            setAngle(270)
            moveForward(10)
            assert(location) shouldBe(250@240)
        }
        method testDrawLine{
            assert(location) shouldBe(250@240)
            nibSwitch
            moveForward(10)
            assert(location) shouldBe(250@230)
            assert(nib) shouldBe(true)
        }
        method testManualNib{
            nibSwitch
            nibSwitch
            nibSwitch
            nibSwitch
            nibSwitch
            nibSwitch
            nibSwitch
            setNib(true)
            assert(nib) shouldBe(true)
            setNib(false)
            assert(nib) shouldBe(false)
        }
        method testToRadians{
            assert(toRadians(45))shouldBe(mt.pi/4)
            assert(toRadians(360+45))shouldBe(mt.pi/4)
        }
        method testToDegrees{
            assert(toDegrees(mt.pi/4))shouldBe(45)
            assert(toDegrees(2*mt.pi))shouldBe(0)
        }
        method testWhileSquare{
            def currentLocation=location
            var i := 0
            setNib(true)
            while{(i < 4)}do{
                right(90)
                moveForward(40)
                i := i+1
            }
            assert(location)shouldBe(currentLocation)
            
        }
            
    }
}

gU.testSuite.fromTestMethodsIn(logoTest).runAndPrintResults