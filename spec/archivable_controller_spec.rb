require 'spec_helper'

describe Archivable::Controller do

  let(:controller) { FakesController.new }

  subject { controller }

  it { should respond_to(:archive) }

  describe '.archive' do

    before { subject.archive }

    it 'should set the instance variable' do
      subject.get_model_instance_variable.should eq(subject.fake)
    end

    context 'when successfully archived' do

      it 'should render the :show action' do
        subject.should_receive(:redirect_to).with(:show, { notice: "Fake was archived successfully." })
        subject.archive
      end
    end

    context 'when unsuccessfully archived' do

      it 'should render the :show action' do
        Fake.any_instance.stub({ save: false })
        subject.should_receive(:render).with(:edit, { alert: "Fake was not archived successfully." })
        subject.archive
      end
    end
  end
end
