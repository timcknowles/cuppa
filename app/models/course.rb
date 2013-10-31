class Course < ActiveRecord::Base

  attr_accessible :course_type_id, :course_type_attributes, :start_time, :end_time, :venue, :price, :places_available, :course_id, :registrations_attributes, :certificate, :logo, :signature

  belongs_to :course_type
  has_many :feedback_questions, through: :course_type

  has_many :registrations
  has_many :users, through: :registrations

  accepts_nested_attributes_for :course_type, allow_destroy: false, reject_if: Proc.new {|x|!x[:id].blank?}
  accepts_nested_attributes_for :registrations, allow_destroy: false

  validates :course_type, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :venue, presence: true
  validates :price, presence: true
  validates :places_available, presence: true, numericality: { only_integer: true }

  mount_uploader :certificate, CertificateUploader
  mount_uploader :logo, LogoUploader
  mount_uploader :signature, SignatureUploader

  def places_remaining
    places_available - registrations.size
  end

  def full?
    places_remaining <= 0
  end

  def title
    course_type.title
  end

  def description
    course_type.description
  end

def self.to_csv(options ={})
  CSV.generate(options) do |csv|
    csv << column_names
    all.each do |course|
      course.registrations each do |registration|
      csv << [registration.user.name]
    end
  end
end
end
  

  

end


