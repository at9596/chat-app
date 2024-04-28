class AddPolymorphicReferencesToPictures < ActiveRecord::Migration[7.0]
  def change
    add_reference :pictures, :imagable, polymorphic: true, null: false
  end
end
