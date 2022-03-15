# frozen_string_literal: true

require './validators/base_validator'

describe Validators::BaseValidator do
  describe '#validate' do
    it 'not implemented' do
      line = '/about 061.945.150.735'

      expect do
        described_class.new.validate(line)
      end.to raise_error(NotImplementedError, 'Can not execute method in the Base class')
    end
  end
end
