# -*- coding: utf-8 -*-
"""
Created on Tue Jan 12 17:19:42 2016
"""

class Client(object):
    bank = "TD"
    location = "Toronto"    
    
    def __init__(self, name, balance):
        self.name = name
        self.balance = balance + 100
        
        if self.balance < 5000:
            self.level = "Basic"
        elif self.balance < 15000:
            self.level = "Intermediate"
        else:
            self.level = "Advanced"
        
        print "Name: %s, Opening Balance: %s" % (self.name, self.balance)
            
    def deposit(self, amount):
        self.balance += amount
        return self.balance
    
    def withdraw(self, amount):
        if amount > self.balance:
            raise RuntimeError("Insufficient Funds")
        else: 
            self.balance -= amount
        return self.balance
            
    @staticmethod
    def make_money_sound():
        print "Cha-Ching!"
        
    @classmethod
    def bank_location(cls):
        print "%s %s" % (cls.bank, cls.location)
    
    
John_Doe = Client("John Doe", 2000)
Jane_Defoe = Client("Jane Defoe", 10000)

John_Doe.name
John_Doe.balance
Jane_Defoe.level

John_Doe.email = "jdoe23@gmail.com"
John_Doe.email = "johndoe23@gmail.com"
del John_Doe.email

# try calling these attributes at the class and instance level
Client.bank
Jane_Defoe.location

# Try calling a method two different ways
John_Doe.withdraw(100)
Client.withdraw(John_Doe, 100)

Client.make_money_sound()
Jane_Defoe.make_money_sound()

Client.bank_location()

class Savings(Client):
    interest_rate = 0.001       
    
    def update_balance(self):
        self.balance += self.balance*self.interest_rate
        return self.balance

# create an instance the same way as a Client but this time by calling Savings 
# instead        
Lina_Tran = Savings("Lina Tran", 50) 

# it now has access to the new attributes and methods in Savings...
Lina_Tran.update_balance()

# ...as well as access to attributes and methods from the Client class
Lina_Tran.deposit(200)
print Lina_Tran.name
print Lina_Tran.balance

#defining a method outside the class definition
def check_balance(self):
    return self.balance

Client.check_balance = check_balance

John_Doe.check_balance()