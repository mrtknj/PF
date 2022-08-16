#postsテーブルのカラム名nameのnot null制約を外す例
class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    # Not Null制約を外す場合　not nullを外したいカラム横にtrueを記載
    change_column_null :users, :introduction, true
    change_column_null :games, :genre_id, true
    change_column_null :games, :device_id, true
  end

  def down
    change_column_null :users, :introduction, false
    change_column_null :games, :genre_id, false
    change_column_null :games, :device_id, false
  end
end
