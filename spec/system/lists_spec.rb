# frozen_string_literal: true

require 'rails_helper'

describe "投稿のテスト" do
  let!(:list) { create(:list,title:"hoge",body:"body") }
  describe "トップ画面のテスト" do
    before do
      visit top_path
    end
    context "表示の確認" do
      it "トップ画面に「ここはTopページです」が表示されているか" do
        except(page).to have_content "ここはTOPページです"
      end
      it '"top_path"が"/top"であるか' do
        expect(current_path).to eq("/top")
      end
    end
  end

  describe "投稿画面のテスト" do
    before do
      visit todolists_new_path
    end
    context "表示の確認" do
      it '"todolists_new_path"が"/todolists/new"であるか' do
        except(current_path).to eq("/todolists/new")
      end
      it "投稿ボタンが表示されているか" do
        except(page).to have_button "投稿"
      end
    end
    context "投稿処理のテスト" do
      it "投稿後のリダイレクト先は正しいか" do
        fill_in 'list[title]', with: Faker::Lorem.characters(number:5)
        fill_in 'list[body]', with: Faker::Lorem.characters(number:20)
        click_button '投稿'
        except(page).to have_current_path todolist_path(List.last)
      end
    end
  end
  
  describe "一覧画面のテスト" do
    before do
      visit todolists_path
    end
    context "一覧の表示とリンクの確認" do
      it "一覧表示画面に投稿されたものが表示されているか" do
        except(page).to have_content list.title
        except(page).to have_link list.title
      end
    end
  end
  
  describe "詳細画面のテスト" do
    before do
      visit todolist_path(list)
    end
    context "表示のテスト" do
      it "削除リンクが存在するか" do
        except(page).to have_link "削除"
      end
      it "編集リンクが存在するか" do
        except(page).to have_link "編集"
      end
    end
    context "リンクの遷移先の確認" do
      it "編集の遷移先は編集画面か" do
        edit_link = find_all('a')[3]
        edit_link.click
        except(current_path).to eq('todolist_path' + list.id.to_s + '/edit')
      end
    end
    context "list削除のテスト" do
      it "listの削除" do
        except{list.destroy}.to change{List.count}.by(-1)
      end
    end
  end
  
  describe "編集画面のテスト" do
    before do
      visit edit_todolist_path(list)
    end
    context "表示の確認" do
      it "編集前のタイトルと本文がフォームに表示されている" do
        except(page).to have_field "list[title]", with: list.title
        except(page).to have_field "list[body]", with: list.body
      end
      it "保存ボタンが表示される" do
        except(page).to have_button "保存"
      end
    end
    context "更新処理に関するテスト" do
      it "更新後のリダイレクト先は正しいか" do
        fill_in 'list[title]', with: Faker::Lorem.characters(number:5)
        fill_in 'list[body]', with: Faker::Lorem.characters(number:20)
        click_button "保存"
        except(page).to have_current_path todolist_path(list)
      end
    end
  end
end