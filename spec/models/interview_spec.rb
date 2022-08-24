require 'rails_helper'

RSpec.describe Interview, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
      @core_skills = CoreSkill.create([{name: 'Ruby'}, {name: 'Java'}])
      @candidate = Candidate.create(name: "Jack", dob: (Date.today - 20.year), email: "jsmith@sample.com", experience: 2, skill_ids: @core_skills.pluck(:id))
      @employee = Employee.create(name: "Testtt", email: "john@sample.com", experience: 5, skill_ids: @core_skills.pluck(:id))
      @candidate_second = Candidate.create(name: "Jack2", dob: (Date.today - 20.year), email: "j2smith@sample.com", experience: 2, skill_ids: @core_skills.pluck(:id))
      
  end

  subject { Interview.new(candidate_id: @candidate.id, employee_id: @employee.id, start_time: DateTime.now(), end_time: DateTime.now() + 1.hour, round: 1)}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "start time should not be less than end time" do 
    subject.start_time = DateTime.now()
    subject.end_time = DateTime.now() - 1.hour
    expect(subject).to_not be_valid
  end

  it "should not be overlapping Interview" do 
    subject.save 
    overlapped_inteview = Interview.new(candidate_id: @candidate_second.id, employee_id: @employee.id, start_time: DateTime.now(), end_time: DateTime.now() + 1.hour, round: 2)
    expect(overlapped_inteview).to_not be_valid
  end


  after(:all) do
    CoreSkill.destroy_all
    Employee.destroy_all
    Candidate.destroy_all
  end

end

