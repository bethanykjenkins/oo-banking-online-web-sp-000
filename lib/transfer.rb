class Transfer
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount) #can initialize a transfer
    @sender = sender #initializes with a sender
    @receiver = receiver #initializes with a recceiver
    @amount = amount #initializes with a transfer amount
    @status = "pending" #always initializes with a status of pending
  end
  
  def valid? #can check that both accounts are valid
    if sender.valid? && receiver.valid? #calls on the sender and receiver valid? methods
      true 
    else 
      false 
    end
  end
  
  def execute_transaction #can exdecute a successful transaction between two accounts
    if @sender.balance >= @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else 
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
