const {utils} = require("ethers");

class Fintech {
    constructor(...admins) {
        this.admins = admins;
        this.customers = [];
        this.hashToIDs = [];
        this.nextCustomerID = 0;
    }

    createCustomer(name, address) {
        const hash = utils.id(address);
        this.customers[hash] = new Customer(name, address);
        this.hashToIDs[hash] = this.nextCustomerID;
        this.nextCustomerID++;
    }

    getCustomerDetails(customerHash, msgSender) {
        const isAdmin = this.admins.find(a => a == msgSender);
        const isAllowed = this.customers[customerHash].allowed.find(a => a = msgSender) > -1
        if(isAdmin || isAllowed) {
            return this.customers[customerHash]
        }
        return new Error("Not Allowed");
    }

    allowViewer(customerHash, msgSender, toAllow) {
        if(this.admins.find(a => a == msgSender) < 0) {
            return "Allowed:: not an admin"
        }
        this.customers[customerHash].allowed.push(toAllow);
        return "Allowed:: success"
    }
}

class Customer {
    constructor(name, address) {
        this.name = name;
        this.address = address;
        this.allowed = [];
    }
}

module.exports = Fintech;