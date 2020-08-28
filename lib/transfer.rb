class Transfer

  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end 

  def valid?
    sender.valid? && receiver.valid?
  end 

  def execute_transaction
    if valid? && sender.balance > amount && self.status != "complete"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

def reverse_transfer
  if valid? && receiver.balance > amount && self.status == "complete"
    receiver.balance -= amount
    sender.balance += amount 
    self.status = "reversed"
  else
    self.status = "rejected"
  end 
end 

end 



# #reverse_transfer
# can reverse a transfer between two accounts (FAILED - 6)
# it can only reverse executed transfers (FAILED - 7)
