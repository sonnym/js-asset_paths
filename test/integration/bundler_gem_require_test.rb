require_relative '../test_helper'

describe 'bundler gem' do
  it 'successfully runs a simple inline bundler script' do
    assert `test/support/bundlescript`
  end
end
