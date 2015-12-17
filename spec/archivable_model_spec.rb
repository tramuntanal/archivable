require 'spec_helper'

describe Archivable::Model do

  let(:model) { Fake.new }

  subject { model }

  it { is_expected.to respond_to(:archive!) }
  it { is_expected.to respond_to(:unarchive!) }
  it { is_expected.to respond_to(:is_archivable?) }

  describe '#archive!' do

    before { subject.archive! }

    it 'sets archived to true' do
      expect(model.archived?).to be_truthy
    end

    it 'saves' do
      expect(subject).to receive(:save)
      subject.archive!
    end
  end

  describe '#unarchive!' do
    let(:model) { Fake.new(archived: true) }

    before { model.unarchive! }

    it 'sets archived to false' do
      expect(model.archived?).to be_falsey
    end

    it 'saves' do
      expect(subject).to receive(:save)
      subject.archive!
    end
  end
end
