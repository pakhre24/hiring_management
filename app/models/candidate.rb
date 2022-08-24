class Candidate < User
	validates_length_of :name, :maximum => 16
	validates :dob, :presence => true

	has_many :interviews, :dependent => :destroy
	
end
