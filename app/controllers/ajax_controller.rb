class AjaxController < ApplicationController
  def search # 選択ボックスに表示する出版社名を取得
    @books = Book.select(:publish).distinct
  end

  def result # 選択ボックスで指定された出版社で books テーブルを検索
    @books = Book.where(publish: params[:publish])
  end
end
