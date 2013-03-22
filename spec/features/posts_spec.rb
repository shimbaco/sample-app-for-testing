# coding: utf-8

require 'spec_helper'

describe 'posts' do
  describe '#index' do
    before do
      FactoryGirl.create(:post)
    end

    context 'ブログトップにアクセスしたとき' do
      before do
        visit '/posts'
      end

      it '記事が表示されている' do
        expect(page).to have_content('はじめまして')
      end
    end
  end

  describe '#create' do
    context '記事作成ページにアクセスする' do
      before do
        visit '/posts/new'
      end

      context '記事を入力して作成ボタンをクリックする' do
        before do
          within('#new_post') do
            fill_in 'Name', with: '徳川家康'
            fill_in 'Title', with: '天下統一しました'
            fill_in 'Content', with: 'うれしいです。'
          end

          click_button 'Create Post'
        end

        it '記事が作成される' do
          expect(page).to have_content('天下統一しました')
        end
      end
    end
  end

  describe '#destroy' do
    before do
      @post = FactoryGirl.create(:post)
    end

    context '記事一覧ページにアクセスする' do
      before do
        visit '/posts'
      end

      context '削除ボタンをクリックする' do
        before do
          find("a[href='/posts/#{@post.id}']", text: 'Destroy').click
        end

        it '記事が削除される' do
          expect(page).not_to have_content(@post.title)
        end
      end
    end
  end
end
