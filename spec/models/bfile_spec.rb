require 'rails_helper'

RSpec.describe Bfile, :type => :model do
  
  before { @bfile = FactoryGirl.build(:bfile) }
  subject { @bfile }

  it { should be_valid }
  it { should respond_to :file_name }
  it { should respond_to :file_location }
  it { should respond_to :user_id }
  it { should respond_to :datafile }

end
