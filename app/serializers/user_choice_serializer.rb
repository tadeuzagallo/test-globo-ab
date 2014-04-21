require 'active_model_serializers'

class UserChoiceSerializer < ActiveModel::Serializer
  attributes :result

  def result
    object.choice.url
  end
end
