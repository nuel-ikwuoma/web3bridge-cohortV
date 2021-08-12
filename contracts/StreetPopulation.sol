// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.8.0;

contract StreetPopulation {
    // house[4] street;  // a street has four house
    
    struct street {     // a street has four house
        house[4] houses;
    }
    
    struct house {      // a house can contain 6 flats that contains 5 rooms each
        flat[6] flats;
    }
    
    struct flat {       // a room can contain any number of persons
        room[5] rooms;
    }
    
    struct room {
        uint numOfPersons;
    }
    
    mapping(uint => street) streets;
    
    // calculate the number of flats in a street
    function numberOfFlats(uint _streetID) public view returns(uint8) {
        street memory s = streets[_streetID];
        uint numOfFlat;
        for(uint8 i=0; i<s.houses.length; i++) {
            house memory h = s.houses[i];
            numOfFlat += h.flats.length;
        }
        return uint8(numOfFlat);
    }
    
    // calculate the number of rooms
    function numberOfRooms(uint _streetID) public view returns(uint8) {
        street memory s = streets[_streetID];
        uint numOfRooms;
        for(uint8 i=0; i<s.houses.length; i++) {
            house memory h = s.houses[i];
            for(uint8 j=0; j<h.flats.length; j++) {
                flat memory f = h.flats[j];
                numOfRooms += f.rooms.length;
            }
        }
        return uint8(numOfRooms);
    }
    
    // calculate the number of numOfOccupants
    function numberOfOccupants(uint _streetID) public view returns(uint) {
        street memory s = streets[_streetID];
        uint numOfOccupants;
        for(uint8 i=0; i<s.houses.length; i++) {
            house memory h = s.houses[i];
            for(uint8 j=0; j<h.flats.length; j++) {
                flat memory f = h.flats[j];
                for(uint8 k=0; k<f.rooms.length; k++) {
                    room memory r = f.rooms[k];
                    numOfOccupants += r.numOfPersons;
                }
            }
        }
        return numOfOccupants;
    }
    
    // a function to initialize a streets, yet to be implemented
    // function createStreet(){}
}
