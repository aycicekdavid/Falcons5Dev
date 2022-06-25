AirlineTickets ticketToBerlin = new AirlineTickets();
ticketToBerlin.arrivalCity = 'Berlin';
ticketToBerlin.departureCity = 'London';
ticketToBerlin.flightNumber = '6e2065';
ticketToBerlin.seatAssigned = '19F';
ticketToBerlin.printTicket();
//This is ticket is for the journey from London to Berlin.

System.debug('ticketToBerlin ' + ticketToBerlin);
//ticketToBerlin AirlineTickets:[arrivalCity=Berlin, departureCity=London, flightNumber=6e2065, seatAssigned=19F]

AirlineTickets ticketToDelhi = new AirlineTickets();
ticketToDelhi.arrivalCity = 'Delhi';
ticketToDelhi.departureCity = 'New York';
ticketToDelhi.flightNumber = '6L7943';
ticketToDelhi.seatAssigned = '1A';
ticketToDelhi.printTicket();

System.debug('ticketToDelhi ' + ticketToDelhi);