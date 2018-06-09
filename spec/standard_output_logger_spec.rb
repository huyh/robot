require 'spec_helper'
require 'standard_output_logger'

describe StandardOutputLogger do
  describe '#log' do
    let(:logger) { StandardOutputLogger.new }
    let(:message) { 'hello world!' }

    it 'logs the given message to the standard output' do
      expect($stdout).to receive(:puts).with(message)
      logger.log(message)
    end
  end
end
