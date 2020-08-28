class BankAccount
    attr_reader :name 
    attr_accessor :balance, :status
    @@all = []

    def initialize(name)
        @name = name 
        @balance = 1000
        @status = "open"
        @@all << self
    end
    
    def self.all
        @@all
    end 

    def deposit(amount)
        @balance = @balance + amount.to_i
    end 

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid? 
        if self.status == "open" && self.balance > 0
            true
        else 
            false
        end
    end

    def close_account
        if self.status == "open"
            self.status = "closed"
        else
            "You don't have an exisitng account."
        end 
    end 

end
