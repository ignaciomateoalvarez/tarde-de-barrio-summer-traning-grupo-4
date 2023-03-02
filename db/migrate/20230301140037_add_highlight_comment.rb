# frozen_string_literal: true

class AddHighlightComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :highlight_comment, :boolean, default: false
  end
end
