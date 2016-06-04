import "logoDialect" as LD
import "gUnit" as gU
import "math" as mt
def logoTest = object {
    class forMethod(m){
        inherits gU.testCaseNamed(m)
        method testIsNotInitialized{
            assert(LD.location) shouldBe(LD.notInitialized)
            assert(LD.heading) shouldBe(LD.notInitialized)
            assert(LD.GA) shouldBe(LD.notInitialized)
        }
        method hasLocationandHeading{
            LD.moveForward(0)
            assert(LD.location) shouldBe(250@250)
            assert(LD.heading) shouldBe (0)
            deny(LD.notInitialized==LD.heading)
        }
        method testGrapicsWork{
            LD.show
            deny(LD.notInitialized==LD.GA)
        }
        method testMoveForward{
            assert(LD.location) shouldBe(250@250)
            LD.setAngle(270)
            LD.moveForward(10)
            assert(LD.location) shouldBe(250@240)
        }
        method testDrawLine{
            assert(LD.location) shouldBe(250@240)
            LD.nibSwitch
            LD.moveForward(10)
            assert(LD.location) shouldBe(250@230)
            assert(LD.nib) shouldBe(true)
        }
        method testManualNib{
            LD.setNib(true)
            assert(LD.nib) shouldBe(true)
            LD.setNib(false)
            assert(LD.nib) shouldBe(false)
        }
        method testToRadians{
            assert(LD.toRadians(45))shouldBe(π/4)
            assert(LD.toRadians(360+45))shouldBe(π/4)
        }
        method testToDegrees{
            assert(LD.toDegrees(π/4))shouldBe(45)
            assert(LD.toDegrees(2*π))shouldBe(0)
        }
        method testWhileSquare{
            def currentLocation=LD.location
            var i := 0
            LD.setNib(true)
            while{(i < 4)}do{
                LD.right(90)
                LD.moveForward(40)
                i := i+1
            }
            assert(LD.location)shouldBe(currentLocation)
            
        }
            
    }
}

gU.testSuite.fromTestMethodsIn(logoTest).runAndPrintResults