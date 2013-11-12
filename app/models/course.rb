class Course < ActiveRecord::Base

  attr_accessible :course_type_id, :course_type_attributes, :start_time, :end_time, :venue, :price, :places_available, :course_id, :registrations_attributes, :certificate, :logo, :signature, :Designation

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

  def total_revenue
    registrations.size * price
  end


  # course_type
  # course_date
  # number_of_participants
  # total_revenue	
  # feedback_question (agreement)	Number who answered: strongly disagree	Number who answered: disagree	Number who answered: Neutral	Number who answered: agree	Number who answered: strongly agree	Number who answered: N/A	Mode	mean	concatenated free text answers	sum of radio button qu  option 1	sum of radio button qu option 2 etc	sum of dropdown qu  option 1	sum of dropdown qu  option 2 etc

  def to_csv(options ={})
    CSV.generate(options) do |csv|
      csv << course_type.csv_titles
      csv << csv_data
    end
  end

  def csv_data
    data = [
      id,
      course_type.title,
      start_time,
      end_time,
      registrations.count,
      total_revenue,
    ]
    feedback_questions.each do |question|
      answer_finder = Proc.new { |registration|
        answer = registration.feedback_answers.select{|a|a.feedback_question_id == question.id}[0]
        answer ? answer.answer : nil
      }
      data << case question.question_type_id
        when FeedbackQuestion::QuestionType.free_text
          registrations.map { |registration|
            answer_finder.call(registration)
          }.join("\n")
        when FeedbackQuestion::QuestionType.agreement_level
          registrations.average { |registration|
            answer_finder.call(registration)
          }
        when FeedbackQuestion::QuestionType.drop_down
          registrations.map { |registration|
            answer_finder.call(registration)
          }.join("\n")
        when FeedbackQuestion::QuestionType.radio_buttons
          registrations.map { |registration|
            answer_finder.call(registration)
          }.join("\n")
        end
    end
    data
  end
end


