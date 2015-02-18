class Bfile < ActiveRecord::Base
  belongs_to :user
  attr_accessor :datafile

  validates :datafile, presence: true
  before_validation :create_file
  before_create :save_file
  before_destroy :delete_file

  def create_file
    self.file_name = self.datafile.original_filename
    stored_name = SecureRandom.urlsafe_base64(32)
    self.file_location = Rails.root.join("private", self.user.directory, stored_name).to_s
    puts self.file_location
  end

  def save_file
    File.open(self.file_location, 'wb') do |file|
      file.write(self.datafile.read)
    end
  end

  def delete_file
    File.delete(self.file_location)
  end
end
