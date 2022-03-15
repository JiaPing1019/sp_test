# frozen_string_literal: true

module Validators
  class BaseValidator
    def validate(_params)
      raise NotImplementedError, 'Can not execute method in the Base class'
    end
  end
end
