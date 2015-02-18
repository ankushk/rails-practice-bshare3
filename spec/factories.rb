FactoryGirl.define do

  factory :user do
    userid "user@domain.com"
    password "password"
    password_confirmation "password"
  end

  factory :bfile do
    datafile ActionDispatch::Http::UploadedFile.new(
      tempfile: File.new("#{Rails.root}/spec/testupload.txt"), 
      filename: 'testupload.txt')
    user
  end
end