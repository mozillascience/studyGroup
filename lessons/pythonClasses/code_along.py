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

Client.bank
Jane_Defoe.location

John_Doe.withdraw(100)
Client.withdraw(John_Doe, 100)

Client.make_money_sound()
Jane_Defoe.make_money_sound()

Client.bank_location()

class Savings(Client):
    interest = 0.001

#    def __init__(self, name, balance, email):
#        super(Savings, self).__init__(name, balance)
#        self.email = email        
    
    def add_interest(self):
        self.balance += self.balance*self.interest
        return self.balance
        
Lina_Tran = Savings("Lina Tran", 50) 

Lina_Tran.add_interest()

Lina_Tran.deposit(200)