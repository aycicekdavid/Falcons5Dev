system.debug('1) cars running at max speed: ' + car.carsRunningAtMaxSpeed);

Car bm = new Car(String name, Intger tire);
//access public variable
//first set the value
bm.carColor = 'black';
system.debug('car color is ' + bm.carColor);
bm.switchOn();

car lm = new car();
lm.carColor = 'red';
lm.switchOn();
lm.driveAtmaxSpeed();
//lm.maxSpeedKMperHour = 100;
//Variable is not visible: Car.maxSpeedKMperHour
system.debug('2) cars running at max speed: ' + car.carsRunningAtMaxSpeed);

car vw = new car();
vw.carColor = 'white';
vw.carName = 'polo';
vw.drive();
vw.driveAtmaxSpeed();
//vw.carsRunningAtMaxSpeed = 8; // We can't do this.

system.debug('3) cars running at max speed: ' + car.carsRunningAtMaxSpeed);