class BankCustomer < ActiveRecord::Base
validates_presence_of :name, :acc_no, :balance
  validates_numericality_of :balance, greater_than_or_eaqual_to:0
  validates_uniqueness_of :acc_no


  def transaction(amount,code)
  	if code == 0
  		if self.balance - amount < 0
  			puts "Insufficient balance"
  		else
  		 self.balance = self.balance - amount
  		 self.update_attributes(balance: self.balance)
  		end
  	else
  		self.balance = self.balance + amount
  		 self.update_attributes(balance: self.balance)
    end
  end
end
