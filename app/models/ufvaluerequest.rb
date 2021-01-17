class Ufvaluerequest < ApplicationRecord
    before_save :clientname_to_downcase
    
    protected
    def clientname_to_downcase
        self.client.downcase!
    end
end
