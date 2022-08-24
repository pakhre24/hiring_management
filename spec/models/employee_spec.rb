require 'rails_helper'

RSpec.describe Employee, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"

  before(:all) do
      @core_skills = CoreSkill.create([{name: 'Ruby'}, {name: 'Java'}, {name: 'MySQL'}])
  end

  subject { Employee.new(name: "Testtt", email: "john@sample.com", experience: 5, skill_ids: @core_skills.pluck(:id))}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a name" do
    subject.name=nil
    expect(subject).to_not be_valid
  end
  it "is not valid with less than 5 characters" do
    subject.name='JJJJJJJJJJAAAACC'
    expect(subject.name).to have_attributes(size: (be > 4))
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
