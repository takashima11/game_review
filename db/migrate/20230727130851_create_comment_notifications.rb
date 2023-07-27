class CreateCommentNotifications < ActiveRecord::Migration[6.1]
  def change
    create_table :comment_notifications do |t|
      t.integer :comment_id, null:false
      t.integer :sent_a_notice_customer_id, null:false
      t.integer :got_notified_customer_id, null:false
      t.boolean :notification_status, null:false

      t.timestamps
    end
  end
end
