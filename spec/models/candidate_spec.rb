require 'rails_helper'

RSpec.describe Candidate, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
      @core_skills = CoreSkill.create([{name: 'Ruby'}, {name: 'Java'}])
  end

  subject { Candidate.new(name: "Jack", dob: (Date.today - 20.year), email: "jsmith@sample.com", experience: 2, skill_ids: @core_skills.pluck(:id))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid with more than 16 characters" do
    subject.name='JJJJJJJJJJAAAACC'
    expect(subject.name).to have_attributes(size: (be < 17))
  end

  it "is not valid without a dob" do
    subject.dob=nil
    expect(subject).to_not be_valid
  end

  it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com nil '']
      addresses.each do |invalid_address|
        subject.email = invalid_address
        expect(subject).not_to be_valid
      end 
  end
  it "is not valid without a experience" do
    subject.experience=nil
    expect(subject).to_not be_valid
  end

  after(:all) do
    CoreSkill.destroy_all
  end

end

