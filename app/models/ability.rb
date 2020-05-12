# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)

    can(:crud, Idea) do |idea|
      idea.user == user
    end

    can(:crud, Review) do |review|
      review.user == user
    end
    
  end
end
