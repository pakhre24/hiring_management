class Employee < User
	validates_length_of :name, :minimum => 5
	validates :name, uniqueness: true

	has_many :interviews, :dependent => :destroy
end
