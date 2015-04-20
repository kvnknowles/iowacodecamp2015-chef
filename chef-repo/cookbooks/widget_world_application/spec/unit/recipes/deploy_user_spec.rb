#
# Cookbook Name:: .
# Spec:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

require 'spec_helper'

describe 'widget_world_application::deploy_user' do

  context 'When all attributes are default, on an unspecified platform' do

    let(:chef_run) do
      runner = ChefSpec::ServerRunner.new
      runner.converge(described_recipe)
    end

    it 'converges successfully' do
      chef_run # This should not raise an error
    end
    
    it 'creates the deploy user' do
      expect(chef_run).to create_user('deploy')
    end

    it 'creates the deploy user with a uid of 500' do
      expect(chef_run).to create_user('deploy').with_uid(500)
    end

  end
end