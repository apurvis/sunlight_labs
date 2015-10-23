require 'spec_helper'

describe SunlightLabs do
  it 'has a version number' do
    expect(SunlightLabs::VERSION).not_to be nil
  end

  it 'is configurable' do
    expect { SunlightLabs.configure }.to_not raise_error
  end
end
