require 'chefspec'

describe 'user::lock' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'locks a user with an explicit action' do
    expect(chef_run).to lock_user('explicit_action')
  end

  it 'locks a user with attributes' do
    expect(chef_run).to lock_user('with_attributes').with(uid: '1234')
  end

  it 'locks a user when specifying the identity attribute' do
    expect(chef_run).to lock_user('identity_attribute')
  end
end