# coding: utf-8

require 'spec_helper'

describe 'home' do
  describe '#index' do
    context 'トップページにアクセスすると' do
      before do
        visit '/'
      end

      it '正常にアクセスできる' do
        expect(status_code).to eq 200
      end
    end
  end
end
