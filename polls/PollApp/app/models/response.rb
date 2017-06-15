class Response < ApplicationRecord

  validates :user_id, presence: true
  validates :answer_choice_id, presence: true
  validate :respond_already_answered
  validate :author_responses


  belongs_to :answer_choice,
  primary_key: :id,
  foreign_key: :answer_choice_id,
  class_name: :AnswerChoice

  belongs_to :respondent,
  primary_key: :id,
  foreign_key: :user_id,
  class_name: :User

  has_one :question,
  through: :answer_choice,
  source: :question


  def sibling_responses
    self.question.responses
    .where.not(id: self.id)
  end

  def respond_already_answered
    if sibling_responses.map{|response| response.user_id}.include?(self.user_id)
      errors.add(:response, "already exists")
    end
  end


  def author_responses
    if question.poll.user_id == self.user_id
      errors[:response] << "Don't rig the poll!"
    end
  end
end
