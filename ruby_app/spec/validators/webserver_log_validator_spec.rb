# frozen_string_literal: true

require './validators/webserver_log_validator'

describe Validators::WebserverLogValidator do
  subject { described_class.new }

  describe '#validate' do
    context 'when the format of line is corrct' do
      it 'passes the validation' do
        line = '/about 061.945.150.735'

        expect { subject.validate(line) }.to_not raise_error
      end
    end

    context 'when malformed path exists' do
      it 'raises error' do
        line = 'about 061.945.150.735'

        expect do
          subject.validate(line)
        end.to raise_error(Validators::WebserverLogValidator::FormatError, "The format of the path is incorrect. Line details: #{line}")
      end
    end

    context 'when malformed ip exists' do
      it 'raises error' do
        line = '/about 061.945.150'

        expect do
          subject.validate(line)
        end.to raise_error(Validators::WebserverLogValidator::FormatError, "The format of the ip is incorrect. Line details: #{line}")
      end
    end
  end
end
