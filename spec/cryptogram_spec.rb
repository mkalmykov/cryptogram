require 'spec_helper'

RSpec.describe Cryptogram do
  it 'has a version number' do
    expect(Cryptogram::VERSION).not_to be nil
  end
end
